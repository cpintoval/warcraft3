require_relative 'spec_helper'

# Enhancement 4
# Aside from gold and food, there is also the concept of lumber. Add lumber as a resource that the barracks can 
# handle.

describe Barracks do
  
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its lumber" do
    expect(@barracks.lumber).to eq(500)
  end

end