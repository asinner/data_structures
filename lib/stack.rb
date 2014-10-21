class Stack
  attr_accessor :frame

  def push(value)
    frame = Frame.new(value, self.frame)
    self.frame = frame
    frame.value
  end

  def pop
    return nil if frame.nil?
    current = frame
    self.frame = current.previous
    current.value
  end
end

class Frame
  attr_accessor :value, :previous

  def initialize(value, previous = nil)
    self.value = value
    self.previous = previous
  end
end
