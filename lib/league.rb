class League
  attr_reader :name, :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.captain
    end
  end

  def players_by_team
    @teams.map do |team|
      {teams => team.players}
    end
  end

end
