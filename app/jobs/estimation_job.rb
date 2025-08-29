class EstimationJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return unless task

    # Llama a un servicio que estime los minutos según título y descripción
    minutes = EstimationService.new.estimate_minutes(task.title, task.description)
    task.update(estimated_minutes: minutes) if minutes.present?
  rescue => e
    Rails.logger.error("EstimationJob failed for task #{task_id}: #{e.message}")
  end
end

