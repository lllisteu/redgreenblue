class RGB

  # Returns a 1-pixel GIF image set to the color.
  #
  # With help from:
  # - https://www.perlmonks.org/?node_id=7974
  def gif_pixel
    "GIF89a\1\0\1\0\x90\0\0".b +
    rgb.pack('C3') +
    "\0\0\0,\0\0\0\0\1\0\1\0\0\x02\x02\x04\1\0;".b
  end

  # Writes a 1-pixel GIF image to a file.
  def gif_pixel_write(file_path)
    File.binwrite(file_path, gif_pixel)
  end

end
