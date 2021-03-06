require "pry"
class Stylist
  attr_reader :id, :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    DB.exec("INSERT INTO stylists (name) VALUES ('#{self.name}');")
  end

  def remove
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

  def update(name)
    DB.exec("UPDATE stylists SET name = '#{name}' WHERE id = #{self.id};")
  end

  def ==(other_stylist)
    self.name == other_stylist.name
  end

  def show_clients
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
    clients = []
    returned_clients.each do |client|
      name = client["name"]
      temp_client = Client.new({name: name})
      clients << temp_client
    end
    clients
  end

  def self.find(id)
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id == id
        found_stylist = stylist
      end
    end
    found_stylist
  end

  def self.find_by_name(name)
    returned_stylists = DB.exec("SELECT * FROM stylists WHERE name = '#{name}';")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist["name"]
      id = stylist["id"]
      temp_stylist = Stylist.new({name: name, id: id})
      stylists << temp_stylist
    end
    stylists
  end

  def self.all
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist["name"]
      id = stylist["id"]
      temp_stylist = Stylist.new({name: name, id: id})
      stylists << temp_stylist
    end
    stylists
  end

end
