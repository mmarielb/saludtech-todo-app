class AddAsignarAToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :asignar_a, :string
  end
end
