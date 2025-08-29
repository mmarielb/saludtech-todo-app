require 'rails_helper'

RSpec.describe EstimationJob, type: :job do
  include ActiveJob::TestHelper

  let!(:task) { Task.create!(title: "Tarea de prueba") }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it "encola el job correctamente" do
    expect {
      EstimationJob.perform_later(task.id)
    }.to have_enqueued_job(EstimationJob).with(task.id)
  end

  it "actualiza estimated_minutes de la tarea" do
    # Simulamos el servicio para no depender de IA real
    allow_any_instance_of(EstimationService).to receive(:estimate_minutes).and_return(15)

    perform_enqueued_jobs do
      EstimationJob.perform_later(task.id)
    end

    task.reload
    expect(task.estimated_minutes).to eq(15)
  end
end
