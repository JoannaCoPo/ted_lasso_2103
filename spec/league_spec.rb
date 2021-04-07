require 'rspec'
require './lib/player'
require './lib/team'
require './lib/league'
require 'pry'

RSpec.describe League do
  it 'exists' do
    premier = League.new("Premier League")
    expect(premier).to be_instance_of(League)
  end

  it 'has attributes' do
    premier = League.new("Premier League")
    expect(premier.name).to eq("Premier League")
    expect(premier.teams).to eq([])
  end

end
