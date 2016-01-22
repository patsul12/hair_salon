require 'spec_helper'

describe Client do
  describe '.all' do
    it 'is empty initially' do
      expect(Client.all).to(eq([]))
    end

    it 'returns an array of all stylists in the database' do
      test_client = Client.new({name: 'Franz'})
      test_client.save
      expect(Client.all).to(eq([test_client]))
    end
  end

  describe '#find' do
    it 'finds a stylist(s) in the database' do
      test_client = Client.new({name: 'Franz'})
      test_client.save
      expect(Client.find("Franz")).to(eq([test_client]))
    end
  end

  describe '#==' do
    it 'returns true if two object share the same properties' do
      test_client = Client.new({name: 'Franz'})
      test_client2 = Client.new({name: 'Franz'})
      expect(test_client).to(eq(test_client2))
    end
  end
end
