class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :estimated_minutes
      t.boolean :completed, default: false, null: false
      t.date :due_date

      t.timestamps
    end

    add_index :tasks, :completed
  end
end

