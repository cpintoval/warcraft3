require_relative 'spec_helper'

# Enhancement 1
# In most strategy games, like Warcraft III, buildings can also be attacked by units. Since a barracks is a building, it 
# has substantial more HP (500) To make matters worse, a Footman does only HALF of its AP as damage to a 
# Barracks. This is because they are quite ineffective against buildings.
# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.

describe Barracks do
  
  before :each do
    @barracks = Barracks.new
  end

  it "should be a Building" do
    expect(@barracks).to be_an_instance_of(Barracks)
    expect(@barracks).to be_a(Building)
  end

  describe "#health_points" do
    it "can be retrieved (read)" do
      expect(@barracks.health_points).to eq(500)
    end
  end

  describe "#damage" do
    it "should reduce the unit's health_points by half the attack_power of the Footman" do
      footman = Footman.new
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  end

end