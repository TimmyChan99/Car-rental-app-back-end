require 'rails_helper'

RSpec.describe Car, type: :model do
  subject do
    @user = User.create(name: 'Rida', email: 'example@mail.com', password: 'password', id: 1)
    @car = Car.new(name: 'BMW', description: 'blue', price: 15, reserved: true, image: 'url', user_id: 1)
  end
  before { subject.save }
  
  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should not be nil' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
