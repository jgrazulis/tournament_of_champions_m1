require 'rails_helper'
RSpec.describe 'competition index' do
  before(:each) do
    @denver = Competition.create!(name: "Mile High Soccer Championship", location: "Denver, CO", sport: "soccer")
    @rockies = @denver.teams.create!(nickname: "Little Rockies", hometown: "Denver, CO")
    @soccer5280 = @denver.teams.create!(nickname: "Soccer 5280", hometown: "Denver, CO")
    @rapids = @denver.teams.create!(nickname: "Colorado Rapids", hometown: "Denver, CO")
    @seattle = Competition.create!(name: "Pacific Northwest Soccer Championship", location: "Seattle, WA", sport: "soccer")
    @mariners = @seattle.teams.create!(nickname: "Seattle Mariners", hometown: "Seattle, WA")
  end

  scenario 'user sees competions attributes' do
    visit "/competitions/#{@denver.id}"
    expect(page).to have_content(@denver.name)
    expect(page).to have_content(@denver.location)
    expect(page).to have_content(@denver.sport)
  end

  scenario 'user sees hometown of all teams in competition' do
    visit "/competitions/#{@denver.id}"
    expect(page).to have_content(@rockies.hometown)
    expect(page).to have_content(@soccer5280.hometown)
    expect(page).to have_content(@rapids.hometown)
    expect(page).to_not have_content(@mariners.hometown)
  end 
end 