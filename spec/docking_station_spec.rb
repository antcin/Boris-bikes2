require 'docking_station'

describe DockingStation do
  describe '#release_bike' do
    it 'raises an error when there are no bikes' do
    expect { subject.release_bike }.to raise_error "No available bikes"

    end
  end

  describe '#dock' do
    it 'raises an error when dock capacity is reached' do
    subject.dock(Bike.new)
    expect { subject.dock(Bike.new) }.to raise_error "Dock is full"
    end
  end

end
