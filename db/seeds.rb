require('pry')

require_relative('../models/animal')
# require_relative('../models/owner')

animal1 = Animal.new({
  "name" => "Lola",
  "type" => "cat",
  "breed" => "moggie",
  "admission_date" => "12042006",
  # "adoption_ready" => true
  })

  animal1.save()
