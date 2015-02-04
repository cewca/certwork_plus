class CreateAssessmentPlan < ActiveRecord::Migration
  def change
    create_table :assessment_plans do |t|
      t.datetime :created_at
      t.boolean :arroved
    end

    add_column :assessment_plans, :assigned_by_id, :integer, references: :users
    add_column :assessment_plans, :approved_by_id, :integer, references: :users
  	add_column :assessment_plans, :candidate_id, :integer, references: :users
  end
end
