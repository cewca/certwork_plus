class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
  	  t.string :username,         :null => false
      t.string :firstname, :null => false
      t.string :lastname, :null=> false
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true

  end
end