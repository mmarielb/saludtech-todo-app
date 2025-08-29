class Task < ApplicationRecord
  # Validaciones
  validates :title, presence: true, length: { maximum: 200 }
  validates :estimated_minutes, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  # Callback después de crear la tarea
  after_commit :enqueue_estimation_job, on: :create

  # Método para marcar la tarea como completada
  def mark_complete!
    update!(completed: true)
  end

  private

  # Encola el job en background (ActiveJob)
  def enqueue_estimation_job
    if Rails.env.development?
      # Ejecuta inmediatamente en desarrollo
      EstimationJob.perform_now(self.id)
    else
      # En producción o test, usar background job normal
      EstimationJob.perform_later(self.id)
    end
  end
end
