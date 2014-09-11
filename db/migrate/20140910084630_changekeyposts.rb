class Changekeyposts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  	   t.rename :userid, :user_id
  	end
  end
end
