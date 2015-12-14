class CreateAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :authentication_tokens do |t|
      t.string :secret_id
      t.string :hashed_secret
      t.timestamps null: false
    end
    add_index :authentication_tokens, :secret_id, unique: true
  end
end
