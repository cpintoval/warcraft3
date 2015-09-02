require_relative 'spec_helper'

# Enhancement 5
# Introduced SiegeEngine Unit

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a siege engine" do
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

  describe "#train_siege_engine" do
    it "does not train a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end
    it "trains a siege engine if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end

end

describe SiegeEngine do

  describe "#attack!" do

    before :each do
      @siege_engine = SiegeEngine.new
    end

    it "has to double attack any building" do
      barracks = Barracks.new
      @siege_engine.attack!(barracks)
      expect(barracks.health_points).to eq(400)
    end

    it "can't attack any other unit" do
      footman = Footman.new
      @siege_engine.attack!(footman)
      expect(footman.health_points).to eq(60)
    end

    it "can attack other siege engines" do
      other_siege = SiegeEngine.new
      @siege_engine.attack!(other_siege)
      expect(other_siege.health_points).to eq(350)
    end

  end

end