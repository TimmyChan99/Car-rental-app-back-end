require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    @user = User.create(name: 'Rida', email: 'example@mail.com', password: 'password', id: 1)
    @car = Car.create(name: 'BMW', description: 'blue', price: 15, reserved: true, image: 'url', user_id: 1, id: 1)
    @reservation = Reservation.new(city: 'LA', duration: 12, date_reserved: '12-12-2021', car_id: 1, user_id: 1)
  end
  before { subject.save }

  it 'City ame should not be nil' do
    subject.city = nil
    expect(subject).to_not be_valid
  end
end
