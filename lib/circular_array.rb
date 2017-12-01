class CircularArray
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def [](i)
    if i < arr.length
      arr[i]
    else
      self[i - arr.length]
    end
  end
end
