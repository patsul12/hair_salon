class Client
  attr_accessor :name, :stylist_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @stylist_id = attributes[:stylist_id]
  end

  def save
    DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id.to_i});")
  end

  def ==(other_client)
    self.name == other_client.name
  end

  def self.find(id)
    found_client = nil
    Client.all.each do |client|
      if client.id == id
        found_client = client
      end
    end
    found_client
  end

  def self.all
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client["name"]
      id = client["id"]
      stylist_id = client["stylist_id"]
      temp_client = Client.new({name: name, id: id, stylist_id: stylist_id})
      clients << temp_client
    end
    clients
  end
end
