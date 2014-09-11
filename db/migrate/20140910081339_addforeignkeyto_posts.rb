class AddforeignkeytoPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.integer :userid
  	end
  end
end
