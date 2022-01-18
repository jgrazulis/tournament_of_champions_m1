require 'rails_helper'
RSpec.describe 'new team form' do
  before(:each) do
    @denver = Competition.create!(name: "Mile High Soccer Championship", location: "Denver, CO", sport: "soccer")
    @rockies = @denver.teams.create!(nickname: "Little Rockies", hometown: "Denver, CO")
    @soccer5280 = @denver.teams.create!(nickname: "Soccer 5280", hometown: "Denver, CO")
    @rapids = @denver.teams.create!(nickname: "Colorado Rapids", hometown: "Denver, CO")
    @jamie = @rapids.players.create!(name: "Jamie Tartt", age: 20)
    @roy = @rapids.players.create!(name: "Roy Kent", age: 30)
    @sam = @rapids.players.create!(name: "Sam Obisanya", age: 20)
    @ted = @rapids.players.create!(name: "Ted Lasso", age: 20)
    @seattle = Competition.create!(name: "Pacific Northwest Soccer Championship", location: "Seattle, WA", sport: "soccer")
    @mariners = @seattle.teams.create!(nickname: "Seattle Mariners", hometown: "Seattle, WA")
    @bob = @mariners.players.create!(name: "Bob Vance", age: 25)
  end

  scenario 'user clicks link and is taken to a form to register new team' do
    visit "/competitions/#{@denver.id}"
    click_link "Register a new team"
    expect(current_path).to eq("/competitions/#{@denver.id}/teams/new")
  end

  scenario 'form has field for team nickname and hometown' do
    visit "/competitions/#{@denver.id}/teams/new"
    fill_in('nickname', with: 'Porters')
    fill_in('hometown', with: 'Lockport, IL')
    click_button('Submit')
    expect(current_path).to eq("/competitions/#{@denver.id}")
    expect(page).to have_content("Porters")
    expect(page).to have_content("Lockport, IL")
  end
end 
