require 'test_helper'

class TarifarioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tarifario.new.valid?
  end
end
