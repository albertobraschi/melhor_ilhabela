require 'test_helper'

class RestauranteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Restaurante.new.valid?
  end
end
