class Game

  attr_reader :players, :player, :player1_weapon, :player2_weapon

   def initialize
     @players = []
   end

   def add_player!(player)
    @players << player
    raise "Only two players allowed" if @players.length > 2
   end

   def choose(player_id, weapon)
    if @players[0].object_id == player_id
      @player1_weapon = weapon
    else @players[1].object_id == player_id
      @player2_weapon = weapon
    end
   end

   def winner
     if @player1_weapon == "Rock" && @player2_weapon== "Scissors"
      "#{players[0].name} wins"
     elsif @player1_weapon == "Paper" && @player2_weapon == "Rock"
      "#{players[0].name} wins"
     elsif @player1_weapon == "Scissors" && @player2_weapon == "Paper"
       "#{players[0].name} wins"
     elsif @player2_weapon == "Rock" && @player1_weapon == "Scissors"
       "#{players[1].name} wins"
     elsif @player2_weapon == "Paper" && @player1_weapon == "Rock"
       "#{players[1].name} wins"
     elsif @player2_weapon == "Scissors" && @player1_weapon == "Paper"
       "#{players[1].name} wins"
     else
       "Draw"
     end
   end

end