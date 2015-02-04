class AddS3KeyToAssessmentIndicator < ActiveRecord::Migration
  def change
  	add_column :assessment_indicators, :obj_key, :string
  end
end
