class RGB

  # Return a 1-pixel GIF
  #
  # With help from:
  # - http://www.perlmonks.org/?node_id=7974
  def gif_pixel
    "GIF89a\1\0\1\0\x90\0\0".b +
    rgb.pack('C3') +
    "\0\0\0,\0\0\0\0\1\0\1\0\0\x02\x02\x04\1\0;".b
  end

  def gif_pixel_write(file_path)
    File.binwrite(file_path, gif_pixel)
  end

end