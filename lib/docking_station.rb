require_relative 'bike'
class DockingStation
  #attr_reader :bike
  def initialize
    @bikes = []
  end

  def release_bike
<<<<<<< HEAD
    raise 'No available bikes' unless @bike
    @bike
  end

  def dock(bike)
    raise 'Dock is full' if @bike
    @bike = bike
  end
=======
    fail 'No bikes available' unless @bike
    @bikes.pop
  end

  def dock(bike)
     fail 'Docking station full' if @bikes.count >= 20
     @bikes << bike
   end
>>>>>>> 286c698326b32e7c7b2f0cff3157dc05232f0661

end
