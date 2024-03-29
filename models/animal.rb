require_relative('../db/sql_runner')
require_relative('owner')

class Animal

  attr_reader :id
  attr_accessor :name, :type, :breed, :admission_date, :owner_id, :adoption_ready

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
    @adoption_ready = options['adoption_ready']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      admission_date,
      owner_id,
      adoption_ready
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @type, @breed, @admission_date, @owner_id, @adoption_ready]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals
    SET (name, type, breed, admission_date, owner_id, adoption_ready) = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7;"
    values = [@name, @type, @breed, @admission_date, @owner_id, @adoption_ready, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
  sql = "DELETE FROM animals;"
  SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first)
    return result
  end

  def self.find_breed(breed)
    sql = "SELECT * FROM animals
    WHERE breed = $1"
    values = [breed]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.find_type(type)
    sql = "SELECT * FROM animals
    WHERE type = $1"
    values = [type]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.sort_by_type()
    sql = "SELECT * FROM animals
    ORDER BY type ASC;"
    animals = SqlRunner.run(sql)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.sort_by_breed()
    sql = "SELECT * FROM animals
    ORDER BY breed ASC;"
    animals = SqlRunner.run(sql)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.find_adoption_ready(adoption_ready)
    sql = "SELECT * FROM animals
    WHERE adoption_ready = $1"
    values = [adoption_ready]
    animals = SqlRunner.run(sql, values)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def adoption_ready_to_string()
    return "Yes" if @adoption_ready == 't'
    return "No" if @adoption_ready == 'f'
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    owner_data = results[0]
    owner = Owner.new(owner_data)
    return owner
  end

end
