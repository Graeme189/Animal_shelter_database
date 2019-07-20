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

owner4 = Owner.new({
  "first_name" => "Kevin",
  "last_name" => "Field"
  })

owner5 = Owner.new({
  "first_name" => "Eleanor",
  "last_name" => "Evans"
  })

owner6 = Owner.new({
  "first_name" => "Luise",
  "last_name" => "Valentiner"
  })

owner7 = Owner.new({
  "first_name" => "Gilles",
  "last_name" => "Moulin"
  })

owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()
owner6.save()
owner7.save()

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

animal4 = Animal.new({
  "name" => "Bowie",
  "type" => "dog",
  "breed" => "collie",
  "admission_date" => "15-01-2019",
  "adoption_ready" => true
  })

animal5 = Animal.new({
  "name" => "Obama",
  "type" => "dog",
  "breed" => "daschund",
  "admission_date" => "14-02-2012",
  "owner_id" => owner6.id,
  "adoption_ready" => false
  })

animal6 = Animal.new({
  "name" => "Long John Silver",
  "type" => "parrot",
  "breed" => "macaw",
  "admission_date" => "19-07-2019",
  "adoption_ready" => false
  })

animal7 = Animal.new({
  "name" => "Incy Wincy Spider",
  "type" => "spider",
  "breed" => "tarantula",
  "admission_date" => "12-11-2018",
  "adoption_ready" => true
  })

animal8 = Animal.new({
  "name" => "Henry",
  "type" => "hippo",
  "breed" => "pigmy",
  "admission_date" => "04-05-2019",
  "adoption_ready" => false
  })

  animal1.save()
  animal2.save()
  animal3.save()
  animal4.save()
  animal5.save()
  animal6.save()
  animal7.save()
  animal8.save()

  binding.pry
  nil
