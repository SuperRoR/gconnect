class Product < ApplicationRecord
  mount_uploader :icon, IconUploader
end
