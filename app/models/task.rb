class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :estimated_minutes, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :asignar_a, length: { maximum: 100 }, allow_blank: true

  after_commit :enqueue_estimation_job, on: :create

  def mark_complete!
    update!(completed: true)
  end

  private

  def enqueue_estimation_job
    if Rails.env.development?
      # Ejecutar inmediatamente en desarrollo
      EstimationJob.perform_now(id)
    else
      # En producción o test, usar background job normal
      EstimationJob.perform_later(id)
    end
  end
end
