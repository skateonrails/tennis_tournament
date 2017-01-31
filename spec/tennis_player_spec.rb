# frozen_string_literal: true
require 'spec_helper.rb'
describe TennisPlayer do
  let(:player) { TennisPlayer.new('player1') }

  describe '#name' do
    it 'should return name from player' do
      expect(player.name).to eq('player1')
    end
  end

  describe '#point_won' do
    it 'should increase points attribute in player' do
      player.point_won
      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    it 'translate points into a manner peculiar to tennis' do
      expect(player.score).to eq('0')
      player.point_won
      expect(player.score).to eq('15')
      player.point_won
      expect(player.score).to eq('30')
      player.point_won
      expect(player.score).to eq('40')
    end
  end
end
