require 'docking_station'

describe DockingStation do
  # it 'responds to release_bike' do
  #   expect(subject).to respond_to :release_bike
  # end
<<<<<<< HEAD
  # it { is_expected.to respond_to(:release_bike) }
  # it { is_expected.to respond_to(:dock).with(1).argument }
  describe '#release_bike' do
    it 'raises an error when there are no bikes' do
    expect { subject.release_bike }.to raise_error "No available bikes"
    #expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error when dock capacity is reached' do
    subject.dock(Bike.new)
    expect { subject.dock(Bike.new) }.to raise_error "Dock is full"
    end
  end

  # it 'should release a bike' do
  # bike = subject.release_bike
  # expect(bike).to be_working
  # end

  # it 'should dock a bike' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end

=======

  # it { is_expected.to respond_to(:release_bike) }
  # it { is_expected.to respond_to(:dock).with(1).argument }
  #
  # it 'should release a bike' do
  # bike = subject.release_bike
  # expect(bike).to be_working
  # end
  #
  # # it 'should dock a bike' do
  # #   bike = Bike.new
  # #   expect(subject.dock(bike)).to eq bike
  # # end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
     # Let's not dock a bike first:
     # remember subject == DockingStation.new
     expect { subject.release_bike }.to raise_error 'No bikes available'
   end
  end
  describe '#dock' do
    it 'raises an error when full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end
 end
>>>>>>> 286c698326b32e7c7b2f0cff3157dc05232f0661
end
