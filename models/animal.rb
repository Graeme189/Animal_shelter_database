require_relative('../db/sql_runner')
require_relative('owner')

class Animal

  attr_reader :id, :name, :type, :breed, :admission_date, :adoption_ready, :owner_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
    @adoption_ready = options['adoption_ready'] ||=false
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

  def self.delete_all()
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
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
