# frozen_string_literal: true
# Game class is responsible for hold players names
# and display score
class Game
  TIE_POINTS = 3
  ADVANTAGE_DIFF_POINTS = 1
  TIE_WINNER_DIFF_POINTS = 2
  WINNER_DIFF_POINTS = 4

  attr_reader :players, :first_player, :second_player

  def initialize(first_player, second_player)
    @players = {}
    @first_player = TennisPlayer.new(first_player)
    @second_player = TennisPlayer.new(second_player)

    set_player_hash(first_player, @first_player)
    set_player_hash(second_player, @second_player)
  end

  def point_won_by(player_name)
    players[player_name].point_won
  end

  def score
    return 'Deuce' if deuce?
    return "Advantage #{winning_player_name}" if advantage?
    return "#{winning_player_name} wins" if winner?
    "#{first_player.score}-#{second_player.score}"
  end

  private

  def tie?
    first_player_points >= TIE_POINTS && second_player_points >= TIE_POINTS
  end

  def deuce?
    tie? && difference_between_scores.zero?
  end

  def advantage?
    tie? && difference_between_scores == ADVANTAGE_DIFF_POINTS
  end

  def winner?
    winner_after_tie? || winner_before_tie?
  end

  def winner_after_tie?
    tie? && difference_between_scores == TIE_WINNER_DIFF_POINTS
  end

  def winner_before_tie?
    difference_between_scores == WINNER_DIFF_POINTS
  end

  def winning_player
    first_player_points > second_player_points ? first_player : second_player
  end

  def winning_player_name
    winning_player.name
  end

  def difference_between_scores
    (first_player_points - second_player_points).abs
  end

  def first_player_points
    first_player.points
  end

  def second_player_points
    second_player.points
  end

  def set_player_hash(player_name, player_object)
    @players[player_name] = player_object
  end
end
