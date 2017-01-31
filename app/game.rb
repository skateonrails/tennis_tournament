# frozen_string_literal: true
# Game class is responsible for hold players names
# and display score
class Game
  POINTS_TABLE = [0, 15, 30, 40].freeze

  attr_reader :player, :adversary

  def initialize(player, adversary)
    @player = player
    @adversary = adversary
    @points = Hash.new(0)
  end

  def point_won_by(player_name)
    @points[player_name] += 1
  end

  def score
    return 'Deuce' if deuce?
    return "Advantage #{player_in_advantage}" if advantage?
    return "#{player_in_advantage} wins" if winner?
    "#{translate_score(player)}-#{translate_score(adversary)}"
  end

  private

  def translate_score(player_name)
    POINTS_TABLE[points_by(player_name)]
  end

  def advantage_stage?
    points_by_player >= 3 && points_by_adversary >= 3
  end

  def player_in_advantage
    points_by_player > points_by_adversary ? player : adversary
  end

  def deuce?
    advantage_stage? && difference_between_scores.zero?
  end

  def advantage?
    advantage_stage? && difference_between_scores < 2
  end

  def winner?
    points_by_player >= 4 || points_by_adversary >= 4
  end

  def difference_between_scores
    (points_by_player - points_by_adversary).abs
  end

  def points_by_player
    points_by(player)
  end

  def points_by_adversary
    points_by(adversary)
  end

  def points_by(player_name)
    @points[player_name]
  end
end
