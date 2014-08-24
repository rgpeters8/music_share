class RefactorUser < ActiveRecord::Migration
  def change
   change_table(:users) do |t|
     t.remove :email
     t.remove :username

     t.column :provider, :string
     t.column :uid, :integer
     t.column :oauth_token, :string
     t.column :oauth_expires_at, :datetime
   end
  end
end
