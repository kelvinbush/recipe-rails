require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    Food.new(name: 'Chapati', measurement_unit: 'kg', price: 5, quantity: 2, user:)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have valid price' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'should have valid quantity' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end

  it 'should have valid measurement_unit' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
end
