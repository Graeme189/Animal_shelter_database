require_relative('../db/sql_runner')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@first_name, @last_name]
    owner_data = SqlRunner.run(sql, values)
    @id = owner_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners
    SET (first_name, last_name) = ($1, $2) WHERE id = $3;"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    result = owners.map { |owner| Owner.new(owner) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    owner = SqlRunner.run(sql, values)
    result = Owner.new(owner.first)
    return result
  end

  def animals()
    sql = "SELECT * FROM animals
    WHERE owner_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    animals = results.map { |animal| Animal.new(animal)}
    return animals
  end

end
