require("minitest/autorun")
require_relative("../animal")

class TestAnimal < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Susie","type" => "cat", "breed" => "moggie", "admission_date" => "12th June 2018", "owner_id" => "1", "adoption_ready" => true}

    @animal1 = Animal.new(options)
  end

  def test_id()
    result = @animal1.id.to_s
    assert_equal("1", result)
  end

  def test_name()
    result = @animal1.name
    assert_equal("Susie", result)
  end

  def test_type()
    result = @animal1.type
    assert_equal("cat", result)
  end

  def test_breed()
    result = @animal1.breed
    assert_equal("moggie", result)
  end

  def test_admission_date()
    result = @animal1.admission_date
    assert_equal("12th June 2018", result)
  end

  def test_owner_id()
    result = @animal1.owner_id.to_s
    assert_equal("1", result)
  end

end
