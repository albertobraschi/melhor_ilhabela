require 'test_helper'

class HoteisPousadaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HoteisPousada.new.valid?
  end
end
