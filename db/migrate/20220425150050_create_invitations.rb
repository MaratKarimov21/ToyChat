class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :sender_id, null: false, foreign_key: { to_table: :users }
      t.integer :receiver_id, null: false, foreign_key: { to_table: :users }
      t.boolean :confirmed, default: :false

      t.timestamps
    end

    add_index :invitations, [:sender_id, :receiver_id]
  end
end
