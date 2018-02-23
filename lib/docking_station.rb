require_relative 'bike'
class DockingStation
  #attr_reader :bike
  def initialize
    @bikes = []
  end


  def release_bike
    raise 'No available bikes' unless @bikes.count != 0
    @bikes.pop
  end

  def dock(bike)
    raise 'Dock is full' if @bikes.count >= 20
    @bikes << bike
  end

end
