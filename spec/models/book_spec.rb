# UNIT TESTS
require 'rails_helper'

# book addition test
RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = Book.new(title: "test", author: "kristine", price: 91.99, published_date: Date.today)
    expect(book).to be_valid
  end

  it "is not valid with blank title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end

  # added attributes
  it 'is not valid with blank author' do
    book = Book.new(title: 'author test', price: 9.99, published_date: '2011-01-01')
    expect(book).to_not be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it 'is not valid with blank price' do
    book = Book.new(title: 'price test', author: 'asdsd', published_date: '2011-01-01')
    expect(book).to_not be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it 'is not valid with no published date' do
    book = Book.new(title: 'date test', author: 'qoreidj', price: 9.99)
    expect(book).to_not be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
