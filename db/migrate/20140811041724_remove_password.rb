class RemovePassword < ActiveRecord::Migration
  def change
   change_table(:users) do |t|
     t.remove :password_digest
   end
  end
end
