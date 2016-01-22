class Client
  attr_accessor :name, :stylist_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @stylist_id = attributes[:stylist_id]
  end

  def save
    DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id.to_i});")
  end

  def ==(other_client)
    self.name == other_client.name
  end

  def self.find(name)
    returned_clients = DB.exec("SELECT * FROM clients WHERE name = '#{name}';")
    clients = []
    returned_clients.each do |client|
      name = client["name"]
      temp_client = Stylist.new({name: name})
      clients << temp_client
    end
    clients
  end

  def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client["name"]
      temp_client = Stylist.new({name: name})
      clients << temp_client
    end
    clients
  end
end
