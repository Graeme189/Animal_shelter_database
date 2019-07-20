require("minitest/autorun")
require_relative("../owner")

class TestOwner < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Juliet", "last_name" => "Swann"}

    @owner1 = Owner.new(options)
  end

  def test_id()
    result = @owner1.id.to_s
    assert_equal("1", result)
  end

  def test_first_name()
    result = @owner1.first_name
    assert_equal("Juliet", result)
  end

  def test_last_name()
    result = @owner1.last_name
    assert_equal("Swann", result)
  end

end
