package :imagemagick do
  description "ImageMagick image processing library"

  apt "imagemagick"

  verify do
    has_apt "imagemagick"
  end
end