class Addcreatedattoposts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.timestamps
  	end

  	change_table :users do |t|
  		t.timestamps
  	end

  	change_table :comments do |t|
  		t.timestamps
  	end
  end
end
