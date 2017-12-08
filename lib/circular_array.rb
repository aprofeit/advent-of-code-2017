class CircularArray < Array
  def [](i)
    super(i % length)
  end

  def []=(i, val)
    super(i % length, val)
  end
end
