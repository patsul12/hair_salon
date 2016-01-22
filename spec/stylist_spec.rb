require 'spec_helper'

describe Stylist do
  describe '.all' do
    it 'is empty initially' do
      expect(Stylist.all).to(eq([]))
    end

    it 'returns an array of all stylists in the database' do
      test_stylist = Stylist.new({name: 'Franz'})
      test_stylist.save
      expect(Stylist.all).to(eq([test_stylist]))
    end
  end

  describe '#find' do
    it 'finds a stylist(s) in the database' do
      test_stylist = Stylist.new({name: 'Franz'})
      test_stylist.save
      expect(Stylist.find("Franz")).to(eq([test_stylist]))
    end
  end

  describe '#show_clients' do
    it 'returns an array of all clients that are linked to a given stylist' do
      test_stylist = Stylist.new({name: 'Franz', id: 1})
      test_stylist.save
      test_client = Client.new({name: 'Leipzeg', stylist_id: 1 })
      test_client.save
      expect(test_stylist.show_clients).to(eq([test_client]))
    end
  end

  describe '#==' do
    it 'returns true if two object share the same properties' do
      test_stylist = Stylist.new({name: 'Franz'})
      test_stylist2 = Stylist.new({name: 'Franz'})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end
end
