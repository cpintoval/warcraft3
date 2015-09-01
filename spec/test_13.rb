require_relative 'spec_helper'

# Enhancement 3
# A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already 
# dead.

describe Unit do
 
  describe "#attack!" do

    before :each do
      @unit = Unit.new(30, 5)
      @enemy = Unit.new(30, 5)
    end

    it "can attack enemy because both are alive" do
      @unit.attack!(@enemy)
      expect(@enemy.health_points).to eq(25)
    end

    it "can't attack enemy because unit is dead" do 
      expect(@unit).to receive(:health_points).and_return(0)
      @unit.attack!(@enemy)
      expect(@enemy.health_points).to eq(30)
    end

    it "can't attack enemy because enemy is dead" do 
      dead_enemy = Units.new(0, 5)
      @unit.attack!(dead_enemy)
      expect(dead_enemy.health_points).to eq(0)
    end

  end

end