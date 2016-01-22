class Stylist
  attr_reader :id, :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    []
  end
end
