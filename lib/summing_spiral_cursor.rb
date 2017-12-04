require_relative 'spiral_cursor'

class SummingSpiralCursor < SpiralCursor
  def update_matrix
    matrix.set(position, neighbours_sum)
  end

  def found?
    matrix.get(position) > target_value
  end

  private

  def neighbours_sum
    return 1 if iteration == 1

    sum = 0
    [
      [position.x - 1, position.y],
      [position.x - 1, position.y + 1],
      [position.x, position.y + 1],
      [position.x + 1, position.y + 1],
      [position.x + 1, position.y],
      [position.x + 1, position.y - 1],
      [position.x, position.y - 1],
      [position.x - 1, position.y - 1]
    ].each do |(x, y)|
      if v = matrix.store[x][y]
        sum += v
      end
    end
    sum
  end
end
