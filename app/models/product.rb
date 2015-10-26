class Product < ActiveRecord::Base
  mount_base64_uploader :image, ProductImageUploader
end
