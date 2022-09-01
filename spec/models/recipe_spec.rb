require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    Recipe.new(name: 'Chapati', user:)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
