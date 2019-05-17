require 'docking_station.rb'

describe DockingStation do
  let(:dock) { DockingStation.new }
  let(:bike) { double :bike }
  let(:broken_bike) { double :broken_bike }
  it { should respond_to :release_bike }

  it 'should release a working bike' do
    allow(bike).to receive(:broken=)
    allow(bike).to receive(:broken).and_return(false)
    dock.dock(bike)
    returned_bike = dock.release_bike
    expect(returned_bike.broken).to eq(false)
  end

  it { should respond_to(:dock).with(1).argument }

  it { should respond_to :bikes }

  it 'should store a bike that\'s been docked' do
    allow(bike).to receive(:broken=)
    allow(bike).to receive(:broken).and_return(true)
    dock.dock(bike)
    expect(dock.bikes).to eq([bike])
  end

  it 'should store broken bikes at the start of the dock' do
    allow(bike).to receive(:broken=)
    allow(bike).to receive(:broken).and_return(false)
    allow(broken_bike).to receive(:broken).and_return(true)
    allow(broken_bike).to receive(:broken=)
    dock.dock(bike)
    dock.dock(broken_bike)
    expect(dock.bikes[0]).to eq(broken_bike)
  end
  it 'should not release_bike if empty' do
    expect { dock.release_bike }.to raise_error('No bikes available in dock')
  end

  it 'should not accept bike if at capacity' do
    allow(bike).to receive(:broken=)
    allow(bike).to receive(:broken).and_return(true)
    DockingStation::DEFAULT_CAPACITY.times { dock.dock(bike) }
    expect { dock.dock(bike) }.to raise_error('Docking station is full')
  end

  it 'should accept a capacity instance variable when created' do
    ds = DockingStation.new(30)
    expect(ds.capacity).to eq(30)
  end

  it 'should have a capacity of 20 unless otherwise specified' do
    expect(dock.capacity).to eq(20)
  end

  it 'should not release broken bikes' do
    allow(bike).to receive(:broken=)
    allow(bike).to receive(:broken).and_return(true)
    dock.dock(bike, true)
    expect { dock.release_bike }.to raise_error('Sorry, this bike is broken')
  end

  it { should respond_to :release_broken}

  it 'should return all broken bikes to release_broken' do
    # allow(bike).to receive(:broken=).and_return(true)
    # allow(bike).to receive(:broken).and_return(true)
    test_dock = DockingStation.new
    5.times { test_dock.dock(Bike.new, true) }
    test_dock.dock(Bike.new)
    broked = test_dock.release_broken
    print '&&&&&&'
    print broked
    expect(broked.length).to eq(5)
  end
end
