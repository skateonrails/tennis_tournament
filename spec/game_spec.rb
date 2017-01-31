# frozen_string_literal: true
require 'spec_helper.rb'

describe Game do
  let(:game) { Game.new('player1', 'player2') }

  describe '#score' do
    it "should return a string representing the score of the game" do
      expect(game.score).to eq('0-0')
    end

    context 'when player1 make a point' do
      it 'should return 15-0' do
        game.point_won_by('player1')
        expect(game.score).to eq('15-0')
      end
    end

    context 'when player2 make a point' do
      it 'should return 0-15' do
        game.point_won_by('player2')
        expect(game.score).to eq('0-15')
      end
    end

    context 'when a player has 4 points' do
      it 'should return player as a winner' do
        4.times { game.point_won_by('player1') }
        expect(game.score).to eq('player1 wins')
      end
    end

    context 'when the 2 players have been scored at least 3 points' do
      before :each do
        3.times do
          game.point_won_by('player1')
          game.point_won_by('player2')
        end
      end

      context 'and the scores are equal' do
        it 'should return Deuce' do
          expect(game.score).to eq('Deuce')
        end
      end

      context 'a player has one more point than his opponent' do
        it 'should return advantage for the player in lead' do
          game.point_won_by('player1')
          expect(game.score).to eq('Advantage player1')

          game.point_won_by('player2')
          game.point_won_by('player2')
          expect(game.score).to eq('Advantage player2')
        end
      end

      context 'a player has two more points than his opponent' do
        it 'should return player as winner' do
          game.point_won_by('player1')
          game.point_won_by('player1')
          expect(game.score).to eq('player1 wins')
        end
      end
    end
  end
end
