class Style < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  mount_uploader :css, CssUploader
  
  belongs_to :user
end
