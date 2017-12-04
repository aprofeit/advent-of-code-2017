class SpiralCursor
  attr_accessor :position, :state, :distance, :iteration, :target_value

  STATE_MACHINE = {
    right: :up,
    up: :left,
    left: :down,
    down: :right
  }

  def initialize
    self.position = Position.new
    self.state = :right
    self.distance = 1
    self.iteration = 1
  end

  def seek(target_value)
    self.target_value = target_value

    catch(:done) do
      loop do
        tick(state)
        update_state
      end
    end
  end

  def update_state
    self.distance += 1 if [:up, :down].include?(state)
    self.state = STATE_MACHINE[state]
  end

  def value
    matrix.get(position)
  end

  def tick(state)
    distance.times do
      update_matrix
      throw(:done) if found?

      case state
      when :right
        self.position.x += 1
      when :up
        self.position.y += 1
      when :left
        self.position.x -= 1
      when :down
        self.position.y -= 1
      end

      self.iteration += 1
    end
  end

  def update_matrix
    matrix.set(position, iteration)
  end

  def found?
    matrix.get(position) == target_value
  end

  def steps
    position.x.abs + position.y.abs
  end

  def matrix
    @matrix ||= Matrix.new
  end
end

class Matrix
  attr_reader :store

  def initialize
    @store = Hash.new { |hash, key| hash[key] = Hash.new }
  end

  def get(position)
    store[position.x][position.y]
  end

  def set(position, value)
    store[position.x][position.y] = value
  end
end

class Position
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    self.x = 0
    self.y = 0
  end
end
