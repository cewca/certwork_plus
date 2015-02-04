class AddEvidenceNameEvidenceUrlToAssessmentIndicators < ActiveRecord::Migration
  def change
  	add_column :assessment_indicators, :evidence_url, :string
  	add_column :assessment_indicators, :evidence_filename, :string
  end
end
