require_relative 'base_decorator'

require_relative 'person'
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super().capitalize!
  end
end
