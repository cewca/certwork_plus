class CreateMessages< ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject, :null=>false
      t.string :body
      t.boolean :read, :boolean, :default => false
      t.datetime :created_at, :null=>false
    end
    add_column :messages, :from_user_id, :integer, references: :users
    add_column :messages, :to_user_id, :integer, references: :users
  end
end
