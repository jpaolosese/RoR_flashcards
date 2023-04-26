class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.references :user_id, null: false, foreign_key: true
      t.string :subject
      t.integer :card_count

      t.timestamps
    end
  end
end
