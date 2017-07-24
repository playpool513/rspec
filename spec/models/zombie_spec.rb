require 'rails_helper'

RSpec.describe Zombie, type: :model do
  it 'is invalid without a name' do
    zombie = Zombie.new
    expect(zombie).not_to be_valid
  end

  it "has a name that matches 'Ash Clone'" do
    zombie = Zombie.new(name: "Ash Clone 1")
    expect(zombie.name).to match(/Ash Clone \d/)
  end

  it 'includes tweets' do
    tweet1 = Tweet.new(status: 'Uuuuuhhhhhh')
    tweet2 = Tweet.new(status: 'Arrrrgggg')
    zombie = Zombie.new(name: 'Ash', tweets: [tweet1, tweet2])

    zombie.tweets.should include(tweet1)
    zombie.tweets.should include(tweet2)
  end
end
