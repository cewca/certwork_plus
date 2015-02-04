class AddStatusToAssessmentIndicator < ActiveRecord::Migration
  def change
    add_column :assessment_indicators, :status, :string, :defaul=> 'pending'
  end
end
