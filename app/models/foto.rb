require "mime/types"

class Foto < ActiveRecord::Base

  belongs_to :estabelecimento

  has_attached_file :imagem, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => ":rails_root/public/images/:class/:id/:style_:basename.:extension",
                    :url => "/images/:class/:id/:style_:basename.:extension"

  validates_attachment_content_type :imagem,
  :content_type => ['image/jpeg', 'image/pjpeg',
                                   'image/jpg', 'image/png']

end

