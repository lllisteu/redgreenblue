class RGB

  # Returns the name.
  def name
    defined?(@name) ? @name : nil
  end

  # Sets the name (a string or nil).
  def name=(text)
    @name = ( text ? text.to_s : nil )
  end

end
