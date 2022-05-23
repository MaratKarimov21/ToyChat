class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :playerO, null: false, foreign_key: { to_table: :users }
      t.references :playerX, null: false, foreign_key: { to_table: :users }
      t.string :state, array: true, default: ['', '', '', '', '', '', '', '', '']
      t.references :winner, null: true, foreign_key: { to_table: :users }
      t.string :turn_status

      t.timestamps
    end
  end
end
