class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def damage(ap)
    if health_points - ap >= 0
      @health_points -= ap
    else
      @health_points = 0
    end
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

  def dead?
    health_points == 0
  end

end