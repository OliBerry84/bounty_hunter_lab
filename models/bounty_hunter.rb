require('pg')

class BountyHunter

  attr_accessor :name, :species, :homeworld, :fav_weapon
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @homeworld = options['homeworld']
    @fav_weapon = options['fav_weapon']
  end

  def save()
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
    sql =
    "INSERT INTO space_cowboys
    (
      name,
      species,
      homeworld,
      fav_weapon
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    returning *;
    "
    values = [@name, @species, @homeworld, @fav_weapon]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
    sql =
    "UPDATE space_cowboys
    SET (
      name,
      species,
      homeworld,
      fav_weapon
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5
      "
      values = [@name, @species, @homeworld, @fav_weapon, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

    def delete()
      db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
      sql = "DELETE FROM space_cowboys WHERE id = $1"
      values = [@id]
      db.prepare("delete_one", sql)
      db.exec_prepared("delete_one", values)
      db.close()
    end

    def find()
      db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
      sql =
      "SELECT * FROM space_cowboys WHERE id = $1"
      values = [@id]
      db.prepare("find_by_id", sql)
      db.exec_prepared("find_by_id", values)
      db.close()
    end

  end
