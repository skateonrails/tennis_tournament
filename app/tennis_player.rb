# frozen_string_literal: true
# TennisPlayer class is responsible for store
# players points
class TennisPlayer
  POINTS_REPRESENTATION = %w(0 15 30 40).freeze

  attr_reader :name, :points

  def initialize(player_name)
    @name = player_name
    @points = 0
  end

  def point_won
    @points += 1
  end

  def score
    POINTS_REPRESENTATION[@points] || POINTS_REPRESENTATION.last
  end
end
