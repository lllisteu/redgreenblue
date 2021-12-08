class RGB::Color

private

  def zip_add(a,b)
    a.zip(b).map { |ab| ( ab[0] || 0 ) + ab[1] }
  end

end
