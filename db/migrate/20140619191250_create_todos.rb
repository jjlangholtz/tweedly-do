class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :notes
      t.boolean :complete
      t.date :due
      t.references :todo_list, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
