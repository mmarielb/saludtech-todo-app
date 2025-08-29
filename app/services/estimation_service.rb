# app/services/estimation_service.rb
require 'openai' if defined?(OpenAI)

class EstimationService
  def initialize(client: nil)
    @client = client || default_client
  end

  # devuelve Integer (minutes) o nil
  def estimate_minutes(title, description = nil)
    # si no hay API key, usar heurística local:
    return heuristic(title, description) unless openai_available?

    prompt = build_prompt(title, description)
    response = @client.chat(
      parameters: {
        model: "gpt-4o-mini", # si no tienes ese modelo usa "gpt-3.5-turbo"
        messages: [
          { role: "system", content: "Eres un asistente que devuelve solamente un número entero que representa minutos." },
          { role: "user", content: prompt }
        ],
        max_tokens: 30,
        temperature: 0.0
      }
    )

    text = extract_text_from_response(response)
    parse_minutes(text) || heuristic(title, description)
  rescue => e
    Rails.logger.error("EstimationService error: #{e.message}")
    heuristic(title, description)
  end

  private

def default_client
  return nil unless ENV['OPENAI_API_KEY'].present?

  # Configura el cliente globalmente
  OpenAI.configure do |config|
    config.access_token = ENV['OPENAI_API_KEY']
  end

  OpenAI::Client.new
end

  def openai_available?
    ENV['OPENAI_API_KEY'].present? && defined?(OpenAI) && @client
  end

  def build_prompt(title, description)
    <<~PROMPT
      Estima en número entero (minutos) cuánto demoraría completar la tarea. Devuelve solo el número, sin texto adicional.

      Título: #{title}
      Descripción: #{description || 'Sin descripción'}
    PROMPT
  end

  def extract_text_from_response(resp)
    return nil unless resp
    if resp.respond_to?(:dig)
      msg = resp.dig("choices", 0, "message", "content") ||
            resp.dig(:choices, 0, :message, :content)
      msg || resp.to_s
    else
      resp.to_s
    end
  end

  def parse_minutes(text)
    return nil unless text
    if text =~ /(\d+)\b/
      $1.to_i
    else
      nil
    end
  end

  def heuristic(title, description)
    t_words = title.to_s.split.size
    d_words = description.to_s.split.size
    # Base mínima 1 minuto, más 0.2 por palabra de descripción
    [(t_words * 0.5 + d_words * 0.2).ceil, 1].max
  end
end
