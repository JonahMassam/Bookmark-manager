feature 'bookmark page' do
  scenario 'view list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Bookmarks'
  end 
end