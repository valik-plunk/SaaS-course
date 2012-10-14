class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
    print m1, "\t", m2, "\n"
    strategies = ['R', 'P', 'S']
    if(!strategies.include?(m1) or !strategies.include?(m2))
        raise NoSuchStrategyError
    end

    pair = [m1, m2].sort.join

    #print pair , "\n"
    

    #equal decisions; 1st wins
    if m1 == m2
        #print "equal \n"
        return 0
    end

    case pair
    #Paper vs Rock; Paper Wins
    when "PR"
        #print "Paper Wins \n"
        return (m1 == 'P') ? 0 : 1
    #Paper vs Scissors; Scissors wins
    when "PS"
        #print "Scissors Wins \n"
        return (m1 == 'S') ? 0 : 1    
    #Rock vs Scissors; Rock wins
    when "RS"
        #print "Rock Wins \n"
        return (m1 == 'R') ? 0 : 1
    else
        #print "Hello from nowhere!"
    end
end

rps_result('S', 'P')

def rps_game_winner(game)
  #print game[0], " vs. ",game[1],"\n"
  raise WrongNumberOfPlayersError unless game.length == 2
  #print game[0][1], game[1][1]
  res = rps_result(game[0][1], game[1][1])
  #print game[res], "\n"
  return game[res]
end

def rps_tournament_winner(tournament)
  if(tournament[0][0].kind_of?(String))
    rps_game_winner(tournament)
  else
    rps_game_winner [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]
  end
end

A = [ ["Armando", "P"], ["Dave", "S"] ]

tourn = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

rps_game_winner(A)
rps_tournament_winner(tourn)
