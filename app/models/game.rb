class Game < ApplicationRecord
  has_many_attached :images
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
  validate :images_format
  validate :images_count
  validates :images, presence: true


  private

  def images_format
    return unless self.images.attached?

    self.images.each do |image|

      if !image.content_type.start_with? 'image/'
        image.purge_later
        errors.add(:images, 'needs to be an image')
      end
    end

  end

  def images_count
    return unless self.images.attached?


    # I'm doing this because the property images.count is 0.
    # while the images are not saved this property remains 0
    #
    count = 0
    self.images.each do |image|
      count += 1
    end

    puts("AMOUNT #{count}")

    if count > 10
      self.images.each do |image|
        image.purge_later
      end
      errors.add(:game, 'only 10 images allowed')
    end
  end
end
