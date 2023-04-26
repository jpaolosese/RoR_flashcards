class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
