require 'bookmark'

reset_test_database
seed_test_database
data = get_test_database_data

describe '.all' do
  it 'returns a list of bookmarks' do
    expect(data).to include "makersacademy.com"
    expect(data).to include "destroyallsoftware.com"
    expect(data).to include "google.com"
  end
end