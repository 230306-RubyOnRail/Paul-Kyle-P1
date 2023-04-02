class CreateLoginTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :login_tokens do |t|
      t.string :personnel_username, null: false, foreign_key: true, unique: true
      t.string :token, null: false, unique: true
    end
  end
end
