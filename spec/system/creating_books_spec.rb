# INTEGRATION TESTS
require 'rails_helper'

RSpec.describe 'Adding Books', type: :system do
  before do
    driven_by(:rack_test)
  end
  
  it 'inserts a custom book into the database and has correct flash notice' do
    visit '/books/new'

    fill_in 'Title', with: 'a title'
    fill_in 'Author', with: 'kristine'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2023-01-01'
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.') # flash notice
    expect(Book.last.title).to eq('a title')
  end

  it 'shows an error when author is blank' do
    visit new_book_path

    fill_in 'Title', with: 'test'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2023-01-01'
    click_button 'Create Book'

    expect(page).to have_content("Author can't be blank")
  end

  it 'shows an error when price is blank' do
    visit new_book_path

    fill_in 'Title', with: 'test'
    fill_in 'Author', with: 'kristine'
    fill_in 'Published date', with: '2023-01-01'
    click_button 'Create Book'

    expect(page).to have_content("Price can't be blank")
  end

  it 'shows an error when published date is blank' do
    visit new_book_path

    fill_in 'Title', with: 'test'
    fill_in 'Author', with: 'kristine'
    fill_in 'Price', with: '9.99'
    click_button 'Create Book'

    expect(page).to have_content("Published date can't be blank")
  end
end