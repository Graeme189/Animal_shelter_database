require_relative('../db/sql_runner')

class Animal

  attr_reader :id, :name, :type, :breed, :admission_date, :adoption_ready

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @adoption_ready = options['adoption_ready'] ||=false 
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      breed,
      admission_date,
      adoption_ready
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@name, @type, @breed, @admission_date, @adoption_ready]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

end
