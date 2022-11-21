class RGB::Color

private

  # Returns shortest angle of travel (rotation)
  # to move between 2 points on a circle.
  #
  # Some discussions here:
  # - https://stackoverflow.com/questions/9505862/
  # - https://stackoverflow.com/questions/7428718/
  def angle_of_travel(source, destination)
    angle = destination - source
    (angle.abs > 180) ? (angle + (angle.negative? ? 360 : -360)) : angle
  end

  def zip_add(a,b)
    a.zip(b).map { |ab| ( ab[0] || 0 ) + ab[1] }
  end

end
