def reset_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test', user: 'JMMakers', password: '1234')
  connection.exec('TRUNCATE TABLE bookmarks')
end

def seed_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test', user: 'JMMakers', password: '1234')
  connection.exec("INSERT INTO bookmarks VALUES (1, 'google.com');")
  connection.exec("INSERT INTO bookmarks VALUES (2, 'destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmarks VALUES (3, 'makersacademy.com');")
end

def get_test_database_data
  connection = PG.connect(dbname: 'bookmark_manager_test', user: 'JMMakers', password: '1234')
  result = connection.exec('SELECT * FROM bookmarks')
  result.map { |bookmark| bookmark["url"] }
end