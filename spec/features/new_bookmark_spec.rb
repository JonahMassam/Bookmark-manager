feature 'new bookmark page' do
  scenario 'add a new bookmark' do
    visit '/bookmarks'
    click_link("Add a new bookmark!")
    fill_in("bookmark_url", with: "test bookmark")
    click_button("submit_button")
    expect(page).to have_content("test bookmark")
  end 
end