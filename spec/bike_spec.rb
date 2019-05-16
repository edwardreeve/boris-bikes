require 'bike.rb'

describe Bike do
  it { should respond_to :working }

  it 'should no longer be working if reported broken' do
    broken_bike = Bike.new
    broken_bike.broken
    expect(broken_bike.working).to eq(false)
  end
end
