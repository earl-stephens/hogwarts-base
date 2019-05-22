require "rails_helper"

describe 'can get a list of students' do
# You are the new web developer for Hogwarts. The IT staff has provided an API where you can get a listing of students.
#
# `http://hogwarts-it.herokuapp.com`
#
# You are to create an app and complete this following user story:
#
# Your key is: alohamora
  xit 'user can see Slytherin students' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I select "Slytherin" from the dropdown
    select "Slytherin", :from => :house
    # And I click on "Get Students"
    click_on "Get Students"
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(current_path).to eq('/search')
    expect(current_url).to include('house=Slytherin')
    # And I should see a message "22 Students"
    expect(page).to have_content('22 Students')
    expect(page).to have_css('.members', count: 22)
    # And I should see a list of the 22 members of Slytherin
    within (first('.members')) do
      expect(page).to have_css('.id')
      expect(page).to have_css('.name')
    end
    # save_and_open_page
    # And I should see a name and id for each student.
  end

  it 'user can see Slytherin students using HaaS' do
    # As a user
    # When I visit "/"
    visit '/'
    # And I select "Slytherin" from the dropdown
    select "Slytherin", :from => :house
    # And I click on "Get Students"
    click_on "Get Students"
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(current_path).to eq('/search')
    expect(current_url).to include('house=Slytherin')
    # And I should see a message "22 Students"
    expect(page).to have_content('22 Students')
    expect(page).to have_css('.members', count: 22)
    # And I should see a list of the 22 members of Slytherin
    within (first('.members')) do
      expect(page).to have_css('.id')
      expect(page).to have_css('.name')
    end
    # save_and_open_page
    # And I should see a name and id for each student.
  end

end
