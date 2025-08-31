if ENV['OPENAI_API_KEY'].present?
  OpenAI.configure do |config|
    config.access_token = ENV['OPENAI_API_KEY']
  end
else
  Rails.logger.warn 'OPENAI_API_KEY no está configurada. Se usará la heurística local.'
end
