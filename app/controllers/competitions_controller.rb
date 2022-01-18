class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show 
    @competition = Competition.find(params[:id])
    @team_competition_players = @competition.teams.joins(:players)
  end
end