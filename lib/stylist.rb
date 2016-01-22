class Stylist
  attr_reader :id, :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def save
    DB.exec("INSERT INTO stylists (name) VALUES ('#{self.name}');")
  end

  def ==(other_stylist)
    self.name == other_stylist.name
  end

  def self.find(name)
    returned_stylists = DB.exec("SELECT * FROM stylists WHERE name = '#{name}';")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist["name"]
      temp_stylist = Stylist.new({name: name})
      stylists << temp_stylist
    end
    stylists
  end

  def self.all
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist["name"]
      temp_stylist = Stylist.new({name: name})
      stylists << temp_stylist
    end
    stylists
  end

end
