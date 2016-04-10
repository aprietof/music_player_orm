class Song

  attr_accessor :name, :album, :id

  def initialize
    @name = name
    @album = album
  end

  def self.new_from_db(row)
    new_song = self.new  # self.new is the same as running Song.new
    new_song.id = row[0]
    new_song.name =  row[1]
    new_song.album = row[2]
    new_song  # return the newly created instance
  end

  def self.all
    sql = <<-SQL
      SELECT *
      FROM songs
    SQL

    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM songs WHERE name = ? LIMIT 1
    SQL

    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
      );
    SQL

    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO songs (name, album)
      VALUES (?,?)
    SQL

    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end

  def self.create(name:, album:)
    song = Song.new(name, album)
    song.save
    song
  end

end
