class CreateAssessmentIndicator < ActiveRecord::Migration
  def change
    create_table :assessment_indicators do |t|
      t.belongs_to :assessment_plan
      t.datetime :due_date
      t.string :name
      t.string :comment
      t.string :evidence_option
    end
  end
end
