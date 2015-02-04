class CreateAssessorCandidateRelationship < ActiveRecord::Migration
  def change
    create_table :assessor_candidate_relationships do |t|
      t.datetime :created_at, :null=>false
      t.datetime :completed_at
      t.boolean  :complete, :boolean, :null => false, :default => false
    end
    add_column :assessor_candidate_relationships, :accessor_id, :integer, references: :users
  	add_column :assessor_candidate_relationships, :candidate_id, :integer, references: :users
  end
end



