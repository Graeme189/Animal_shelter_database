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

end
