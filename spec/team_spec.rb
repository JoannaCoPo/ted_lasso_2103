require 'rspec'
require './lib/player'
require './lib/team'
require 'pry'

RSpec.describe Team do
  it 'exists' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(richmond).to be_instance_of(Team)
  end

  it 'has attributes' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(richmond.name).to eq("AFC Richmond")
    expect(richmond.coach).to eq("Ted Lasso")
    expect(richmond.players).to eq([roy, sam])
  end

  it 'has total_salary' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(richmond.total_salary).to eq(1600000)
  end

  it 'has a captain' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(richmond.captain).to eq("Roy Kent")
  end

  it 'has filled positions' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    expect(richmond.positions_filled).to eq(["Center Midfielder", "Right-back Defender"])
  end


end
