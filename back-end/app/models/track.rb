class Track < ActiveRecord::Base
  has_attached_file :file
  
  validates_attachment :file, presence: true, 
  content_type: { content_type: /\Aaudio\/.*\Z/}, 
  size: { in: 0..10.megabytes }
  
  has_many :streams
end
