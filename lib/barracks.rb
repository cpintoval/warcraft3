class Barracks

  attr_reader :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    true
  end

  def train_footman
    if @gold >= 135 && @food >= 2
      @gold -= 135
      @food -= 2
      Footman.new
    else
      nil
    end
  end
end
