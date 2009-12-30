require 'test_helper'

class ImovelLocacaoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ImovelLocacao.new.valid?
  end
end
