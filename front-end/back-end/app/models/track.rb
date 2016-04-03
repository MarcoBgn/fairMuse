class Track < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, presence: true,
  content_type: { content_type: /\Aaudio\/.*\Z/}, 
  size: { in: 0..10.megabytes }
  
  def track_url
    file.url
  end
  
  has_attached_file :image, styles: {
    thumb: '200x200>',
    medium: '500x500>'
  }
  validates_attachment :image,
  content_type: { content_type: /\Aimage\/.*\Z/},
  size: { in: 0..4.megabytes }
  
  def image_url
    image.url(:thumb)
  end
  
  has_many :streams, dependent: :destroy
  belongs_to :artist
end