class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    
    if !dead?
      if enemy.is_a?(Building) && !enemy.destroyed?
        enemy.damage(attack_power * 2)
      elsif enemy.is_a?(SiegeEngine) && !enemy.dead?
        super
      end
    end

  end

end