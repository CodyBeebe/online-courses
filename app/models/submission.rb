class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment
  mount_uploader :file, SubmissionUploader
end
