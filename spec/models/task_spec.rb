require 'rails_helper'

RSpec.describe Task, type: :model do
  it "valida presence de title" do
    t = Task.new(title: nil)
    expect(t).not_to be_valid
    expect(t.errors[:title]).to include("can't be blank")
  end

  it "encola EstimationJob al crear" do
    ActiveJob::Base.queue_adapter = :test

    expect {
      Task.create!(title: "Tarea prueba")
    }.to have_enqueued_job(EstimationJob)
  end
end

