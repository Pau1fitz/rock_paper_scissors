require 'sinatra/base'
require_relative '../lib/game'
require_relative '../lib/player'


class RPS < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, '..', "public") }

  game = Game.new

  enable :sessions

  get '/' do
    erb :index
  end

  get '/player_1_game' do
    erb :enter_name
  end

  post '/player_1_game' do
    @name = params[:name]
    @player = Player.new(params[:name])
    game.add_player!(@player)
    @player2 = Player.new('Computer')
    game.add_player!(@player2)
    p game.players
    @player_choice = game.choose(game.players[0].object_id, params[:weapon])
    @player2_choice = game.choose(game.players[1].object_id, ["Rock", "Paper", "Scissors"].sample)
    @winner = game.winner
    p game
    erb :player_1_game
  end

  get '/player_2_game' do
    erb :player_2_game
  end

  post '/player_2_game' do
    @player = Player.new(params[:name])
    game.add_player!(@player)
    session[:player] = @player.object_id
    @player_weapon = game.choose(session[:player], params[:weapon])
     if game.players.length == 2
      redirect '/end_player_2_game'
    else
      redirect '/wait'
    end

    erb :player_2_game
  end


  get '/end_player_2_game' do
    @name1 = game.players[0].name
    @name2 = game.players[1].name
    @player_choice1 = game.player1_weapon
    @player_choice2 = game.player2_weapon
    p params
    @winner = game.winner
    p game
    session.clear
    erb :end_player_2_game
  end

  get '/wait' do
    if game.players.length == 2
      redirect '/end_player_2_game'
      p game
    end
    erb :wait
  end

  get '/fresh' do
  if game.players.length == 2
    game.players.clear
  end
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
