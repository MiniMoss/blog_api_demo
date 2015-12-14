class AddUserRefToAuthenticationTokens < ActiveRecord::Migration
  def change
    add_reference :authentication_tokens, :user, index: true, foreign_key: true
  end
end
