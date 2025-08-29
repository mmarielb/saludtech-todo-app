require 'rails_helper'

RSpec.describe "Tasks CRUD", type: :request do
  it "crea una tarea con redirect" do
    expect {
      post tasks_path, params: { task: { title: "Comprar café" } }
    }.to change(Task, :count).by(1)

    task = Task.last
    expect(response).to redirect_to(task)
  end

  it "togglea estado" do
    task = Task.create!(title: "Probar toggle")

    patch toggle_complete_task_path(task)
    expect(response).to redirect_to(tasks_path)

    task.reload
    expect([true, false]).to include(task.completed)
  end
end
