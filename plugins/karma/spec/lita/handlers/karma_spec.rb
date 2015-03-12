require "spec_helper"

describe Lita::Handlers::Karma, lita_handler: true do
  before(:each) do
    Lita::User.create('AAAAAAAA', mention_name: 'turbot', name: 'Turbot')
  end

  def increment
    send_message("<@AAAAAAAA>++")
  end

  def decrement
    send_message("<@AAAAAAAA>--")
  end

  it 'increments someones karma when they are @mentioned with a ++' do
    increment
    expect(replies.last).to eq "@turbot's now: 1"
  end

  it 'decrements someones karma when they are @mentioned with a --' do
    decrement
    expect(replies.last).to eq "@turbot's now: -1"
  end

  it 'sums the increments as they come in' do
    2.times { increment }
    expect(replies.last).to eq "@turbot's now: 2"
  end

  it 'displays a landmark message when the person is incremented to 10' do
    10.times { increment }
    expect(replies.last).to eq ":rooster: @turbot's a darn tootin karma machine! :rooster:"
  end

  it 'displays a different landmark at 50' do
    50.times { increment }
    expect(replies.last).to eq ":dromedary_camel: @turbot's a karma sluggin juggernaut :dromedary_camel:"
  end
end


# >> Lita::User.find_by_id('U03QUJQ7W')
# => #<Lita::User:0x007fe1e9bd6528 @id="U03QUJQ7W", @metadata={"mention_name"=>"tylerjohnst", "name"=>"Tyler Johnston"}, @name="Tyler Johnston">
