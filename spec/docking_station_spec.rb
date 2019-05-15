require 'docking_station.rb'

describe DockingStation do
  let(:my_dock) { DockingStation.new }

  it { should respond_to :release_bike }

  it 'should release a working bike' do
    bike = Bike.new
    my_dock.dock(bike)
    returned_bike = my_dock.release_bike

    expect(returned_bike).to be_working
  end

  it { should respond_to(:dock).with(1).argument }

  it { should respond_to :bikes }

  it 'should store a bike that\'s been docked' do
    my_dock.dock('pedalo')
    expect(my_dock.bikes).to eq(['pedalo'])
  end

  it 'should not release_bike if empty' do
    expect { my_dock.release_bike }.to raise_error('No bikes available in dock')
  end

end
