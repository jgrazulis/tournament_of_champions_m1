require 'rails_helper'
RSpec.describe 'competition index' do
  before(:each) do
    @denver = Competition.create!(name: "Mile High Soccer Championship", location: "Denver, CO", sport: "soccer")
    @chicago = Competition.create!(name: "Midwest Soccer Championship", location: "Chicago, IL", sport: "soccer")
    @seattle = Competition.create!(name: "Pacific Northwest Soccer Championship", location: "Seattle, WA", sport: "soccer")
  end

  scenario 'user sees names of all competitions as links' do
    visit "/competitions"
    expect(page).to have_link "#{@denver.name}"
    expect(page).to have_link "#{@chicago.name}"
    expect(page).to have_link "#{@seattle.name}"
  end
end