require('pry')

require_relative('../models/animal')
require_relative('../models/owner')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  "first_name" => "Juliet",
  "last_name" => "Swann"
  })

owner1.save()

animal1 = Animal.new({
  "name" => "Lola",
  "type" => "cat",
  "breed" => "moggie",
  "admission_date" => "12042006",
  "owner_id" => owner1.id,
  "adoption_ready" => true
  })

  animal1.save()

  binding.pry
  nil
