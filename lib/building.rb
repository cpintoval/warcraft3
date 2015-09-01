class Building

  attr_reader :health_points

  def initialize(health_points)
    @health_points = health_points
  end

  def damage(ap)
    if health_points - ap >= 0
      @health_points -= ap
    else
      @health_points = 0
    end
  end

end