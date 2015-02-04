
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email address")
    end
  end


end

class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless (value)
    unless value.length >= 6
      record.errors[attribute] << ("password must be at least 6 characters long")
    end
    unless value =~ /[0-9]/
      record.errors[attribute] << ("password must contain at least one number (0-9)")
    end

    unless value =~ /[a-z]/
      record.errors[attribute] << ("password must contain at least one lowercase letter (a-z)")
    end

    unless value =~ /[A-Z]/
      record.errors[attribute] << ("password must contain at least one uppercase letter (a-z)")
    end
  end


end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  #attr_accessible :username, :email, :password, :password_confirmation, :firstname, :lastname
  has_many :messages_to, class_name: "Message", foreign_key: "from_user_id"
  has_many :messages_from, class_name: "Message", foreign_key: "to_user_id"
  has_many :assessment_plans, class_name: "AssessmentPlan", foreign_key: "candidate_id"
  validates_confirmation_of :password
  validates :password, password: true
  validates_presence_of :password,  :on => :create
  validates_presence_of :password_confirmation, :on => :create
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :email, presence: true, email: true
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username

  def assessment_plan
    assessment_plans.first;
  end

  def formatted_errors 
    self.validate
    rt = ""
    errors.messages.each do |key,msg| 
      if (key.to_s.include? "password") 
        rt =rt +msg[0].to_s
      else
        rt =rt+ send(key).to_s+ " " +msg[0].to_s
      end
    end
    return rt
  end

  has_attached_file :avatar, styles: {
    thumb: '48x48'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
