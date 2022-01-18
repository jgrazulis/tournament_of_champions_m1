class TeamsController < ApplicationController

  def new 
  end

  def create
    @team = Team.new(params[:team])
  end 

  def redirect_to 
    @team.submit
      redirect_to action: "show", id:"/competitions/#{@competition.id}"
  end 
end 
