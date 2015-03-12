require "spec_helper"
require "pry"

describe Lita::Handlers::Karma, lita_handler: true do
  it 'increments someones karma when they are @mentioned with a ++' do
    send_message("@turbot++")
    expect(replies.last).to eq "@turbot's now: 1"
  end

  it 'decrements someones karma when they are @mentioned with a --' do
    send_message("@turbot--")
    expect(replies.last).to eq "@turbot's now: -1"
  end

  it 'sums the increments as they come in' do
    send_message("@turbot++")
    send_message("@turbot++")
    expect(replies.last).to eq "@turbot's now: 2"
  end

  it 'displays a landmark message when the person is incremented to 10' do
    10.times { send_message("@turbot++") }
    expect(replies.last).to eq ":rooster: @turbot's a darn tootin karma machine! :rooster:"
  end

  it 'displays a different landmark at 50' do
    50.times { send_message("@turbot++") }
    expect(replies.last).to eq ":dromedary_camel: @turbot's a karma sluggin juggernaut :dromedary_camel:"
  end
end
