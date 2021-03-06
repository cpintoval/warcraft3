# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    super(60, 10)
  end

  def attack!(enemy)
    if !dead? && enemy.is_a?(Building) && !enemy.destroyed?
      enemy.damage((attack_power / 2.0).ceil)
    else
      super
    end
  end

end