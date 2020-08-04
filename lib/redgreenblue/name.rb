class RGB

  # Returns the name.
  def name
    defined?(@name) ? @name : nil
  end

  # Sets the name (a string or nil).
  def name=(text)
    @name = ( text.to_s.size != 0 ) ? text.to_s : nil
  end

end
