module GalleriesHelper
  def options_for_watermarked_variant
    return {} unless Rails.configuration.watermark_images
    # Gravity options can be found here: https://imagemagick.org/script/command-line-options.php#gravity
    {
      combine_options: {
        gravity: 'center',
        draw: 'image Over 0,0 0,0 "' + Gallery::WATERMARK_PATH.to_s + '"'
      }
    }
  end
end
