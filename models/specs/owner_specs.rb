require("minitest/autorun")
require_relative("../owner")

class TestOwner < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Juliet", "last_name" => "Swann"}

    @owner1 = Owner.new(options)
  end

end
