require './lib/game'

describe Game do

let(:game) { Game.new }
let(:paul) {double :player, name: "Paul"}
let(:computer) {double :player, name: "Computer"}

  it 'enables two players to join the game' do
    game.add_player!(paul)
    game.add_player!(computer)
    expect(game.players.count).to eq 2
  end

  it 'knows that Paper beats Rock' do
    game.add_player!(paul)
    game.add_player!(computer)
    game.choose(paul.object_id, "Rock")
    game.choose(computer.object_id, "Paper")
    expect(game.winner).to eq "Computer wins"
  end

  it 'knows that Rock beats Scissors' do
    game.add_player!(paul)
    game.add_player!(computer)
    game.choose(paul.object_id, "Rock")
    game.choose(computer.object_id, "Scissors")
    expect(game.winner).to eq "Paul wins"
  end

  it 'knows that Scissors beats Paper' do
    game.add_player!(paul)
    game.add_player!(computer)
    game.choose(paul.object_id, "Scissors")
    game.choose(computer.object_id, "Paper")
    expect(game.winner).to eq "Paul wins"
  end

  it 'knows when its a draw' do
    game.add_player!(paul)
    game.add_player!(computer)
    game.choose(paul.object_id, "Paper")
    game.choose(computer.object_id, "Paper")
    expect(game.winner).to eq "Draw"
  end

end
