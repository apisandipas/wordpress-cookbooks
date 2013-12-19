package :imagemagick do
  description "ImageMagick image processing library"

  apt "imagemagick", "libmagick++-dev"

  verify do
    has_apt "imagemagick"
    has_apt "libmagick++-dev"
  end
end