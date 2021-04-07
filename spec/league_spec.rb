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

  it 'can add a team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(premier.add_team(richmond)).to eq([richmond])
  end

  it 'can add more than one team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    expect(premier.add_team(manchester)).to eq([richmond, manchester])
    expect(premier.teams).to eq([richmond, manchester])
  end

  it 'can access team attributes' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)
    expect(premier.captains).to eq(["Roy Kent", "Jamie Tartt"])
    expect(premier.players_by_team).to eq({richmond => ["Roy Kent", "Sam Obisanya"], manchester => ["Jamie Tartt", "Fernandinho"]})
    #rough morning, different have time to debug method per last assertion
  end

end
