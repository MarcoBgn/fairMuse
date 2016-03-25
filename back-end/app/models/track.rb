class Track < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file,
  content_type: /\Aaudio\/.*\Z/,
  presence: true,
  size: { in: 0..9.megabytes }
end
