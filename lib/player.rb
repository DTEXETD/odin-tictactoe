# frozen_string_literal: true

# This class creates a simple player, with a name and a mark
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
