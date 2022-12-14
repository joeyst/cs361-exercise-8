class Poker
  attr_accessor :players, :hands

  def initialize(players)
    @players = players
    @hands = _init_hands
  end

  def _init_hands
    players.map { |player| nil }
  end

  def play
    puts "Players in the poker game:"
    players.zip(hands).each {|player, hand| puts "#{player}: #{hand}" }
    # [pretend there's code here]
  end

  def get_results
    "[pretend these are poker results]"
  end
end

class Chess
  attr_reader :players

  def initialize(players)
    @players = players
  end

  def play
    puts "Players in the chess game:"
    players.each {|player| puts "#{player[0]}: #{player[1]}"}
    # [pretend there's code here]
  end

  def get_results()
    "[pretend these are chess results]"
  end
end

class GoPlayer
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def self.init(players)
    players.map {|player| self.new(player[0], player[1])}
  end
end

class Go
  attr_reader :players

  def initialize(players)
    @players = GoPlayer.init(players)
  end

  def play
    players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

  def get_results
    "[pretend these are go results]"
  end
end

class PlayGames
  attr_reader :game_number, :player_list

  GAME_MAP = {
    1 => Poker, 
    2 => Chess,
    3 => Go
  }

  def initialize(game_number, player_list)
    @player_list = player_list
    @game_number = game_number
  end

  def play
    game = GAME_MAP[game_number].new(player_list)
    game.play
    puts game.get_results
  end
end

pg = PlayGames.new(1, ["alice", "bob", "chris", "dave"])
pg.play

puts

pg = PlayGames.new(2, [["alice", "white"], ["bob", "black"]])
pg.play

puts

pg = PlayGames.new(3, [["alice", "white"], ["bob", "black"]])
pg.play
