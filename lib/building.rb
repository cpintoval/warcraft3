class Building

  attr_reader :health_points

  def initialize(health_points)
    @health_points = health_points
  end

  def damage(ap)
    @health_points -= ap
  end

end