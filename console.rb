require('pry-byebug')
require_relative('models/bounty_hunter.rb')

bounty1 = BountyHunter.new(
  {'name' => 'Michaela',
    'species' => 'octopus',
    'homeworld' => 'Bikini Bottom',
    'fav_weapon' => 'hand-to-hand**7 combat'})
bounty2 = BountyHunter.new(
  {'name' => 'Pickle Oli',
    'species' => 'pickle cyborg',
    'homeworld' => 'Planet Pickle',
    'fav_weapon' => 'army of rats'})

binding.pry

nil
