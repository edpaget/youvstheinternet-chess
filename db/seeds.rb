net_user = User.create(:name => 'tony',
                       :email => 'tmucia@gmail.com')

game = Game.create(:owner_color => 'white', 
                   :game => Chess::Game.new(:game => [['e2e4', 'e7e5']]),
                   :owner_move => true,
                   :internet_players => [net_user])

game2 = Game.create(:owner_color => 'black',
                    :game => Chess::Game.new(:game => [['e2e4', 'c7c5'], ['g1f3', 'd7d6']]),
                    :owner_move => false,
                    :internet_players => [net_user, net_user])

user = User.create(:name => 'ed', 
                   :email => 'ed.paget@gmail.com',
                   :games => [game, game2])

