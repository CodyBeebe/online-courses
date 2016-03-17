require 'test_helper'
require 'carrierwave/test/matchers'

class SubmissionTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  test "has an attachment" do
    #This is found as a fixture in submissions.yml
    submission = submissions(:submission_with_attachment)
    
    #Although only the base file name is stored in the fixture, the uploader stores its path
    assert File.exists?(submission.attachment.file.path), "The path that the attachment should be in is: " + submission.attachment.file.path
  end
  
  test "uploads an attachment" do
    submission = Submission.create!(:attachment => fixture_file_upload('/files/test.txt', 'text/txt'))
    assert File.exists?(submission.reload.attachment.file.path), "The file failed to upload"
  end
  
end
