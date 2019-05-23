require 'pg'

feature 'Viewing bookmarks' do
  scenario 'index page displays title' do
    visit('/')

    expect(page).to have_content("Bookmark Manager")
  end

  scenario 'a user can view bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # connection.exec("INSERT INTO bookmarks VALUES (1, 'https://makers.tech/');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'https://en-gb.facebook.com/');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.google.co.uk/');")

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
