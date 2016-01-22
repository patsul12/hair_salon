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

  describe '#==' do
    it 'returns true if two object share the same properties' do
      test_stylist = Stylist.new({name: 'Franz'})
      test_stylist2 = Stylist.new({name: 'Franz'})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end
end
