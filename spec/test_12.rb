require_relative 'spec_helper'

# Units start off alive but they die if their HP hits 0 or lower. This is usually a result of receiving damage from 
# combat.

describe Unit do

  describe "#dead?" do

    before :each do
      @unit = Unit.new(30, 5)
    end

    it "has to be alive (i.e dead? = false)" do
      expect(@unit.dead?).to be_falsey
    end

    it "has to be dead" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end

  end

end