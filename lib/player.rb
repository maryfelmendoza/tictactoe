# frozen_string_literal: true

class Player
  attr_reader :name, :player_number

  def initialize(name, player_number)
    @name = name
    @player_number = player_number
  end
end
