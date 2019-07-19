require('pry')

require_relative('../models/animal')
require_relative('../models/owner')

Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  "first_name" => "Richard",
  "last_name" => "Trist"
  })

owner2 = Owner.new({
  "first_name" => "Andy",
  "last_name" => "McKay"
  })

owner3 = Owner.new({
  "first_name" => "Eve",
  "last_name" => "Bramley"
  })

owner1.save()
owner2.save()
owner3.save()

animal1 = Animal.new({
  "name" => "Lola",
  "type" => "cat",
  "breed" => "moggie",
  "admission_date" => "12-04-2019",
  "owner_id" => owner1.id,
  "adoption_ready" => true
  })

animal2 = Animal.new({
  "name" => "Dixie",
  "type" => "cat",
  "breed" => "shorthair",
  "admission_date" => "17-05-2019",
  "owner_id" => owner1.id,
  "adoption_ready" => false
  })

animal3 = Animal.new({
  "name" => "Alba",
  "type" => "dog",
  "breed" => "beagle",
  "admission_date" => "07-06-2019",
  "owner_id" => owner3.id,
  "adoption_ready" => true
  })

  animal1.save()
  animal2.save()
  animal3.save()

  binding.pry
  nil
