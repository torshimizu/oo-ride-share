require_relative 'spec_helper'

describe "Trip class" do

  describe "initialize" do
    before do
      start_time = '2015-05-20T12:14:00+00:00'
      end_time = '2015-05-20T12:39:00+00:00' # add 25 minutes
      @trip_data = {
        id: 8,
        driver: RideShare::Driver.new(id: 3, name: "Lovelace", vin: "12345678912345678"),
        passenger: RideShare::Passenger.new(id: 1, name: "Ada", phone: "412-432-7640"),
        start_time: start_time,
        end_time: end_time,
        cost: 23.45,
        rating: 3
      }
      @trip = RideShare::Trip.new(@trip_data)
    end

    it "is an instance of Trip" do
      @trip.must_be_kind_of RideShare::Trip
    end

    it "stores an instance of passenger" do
      @trip.passenger.must_be_kind_of RideShare::Passenger
    end

    it "stores an instance of driver" do
      @trip.driver.must_be_kind_of RideShare::Driver
    end

    it "raises an error for an invalid rating" do
      [-3, 0, 6].each do |rating|
        @trip_data[:rating] = rating
        proc {
          RideShare::Trip.new(@trip_data)
        }.must_raise ArgumentError
      end
    end

    it "throws an argument error if a trip end time is before the start time" do
      start_time = '2015-05-20T12:14:00+00:00'
      end_time = '2015-05-20T12:00:00+00:00'
      test_details = {
        id: 8,
        driver: RideShare::Driver.new(id: 3, name: "Lovelace", vin: "12345678912345678"),
        passenger: RideShare::Passenger.new(id: 1, name: "Ada", phone: "412-432-7640"),
        start_time: start_time,
        end_time: end_time,
        cost: 23.45,
        rating: 3
      }
      proc { RideShare::Trip.new(test_details)}.must_raise ArgumentError
    end
  end

  describe "Trip.trip_duration" do
    before do
      start_time = '2015-05-20T12:14:00+00:00'
      end_time = '2015-05-20T12:39:00+00:00' # add 25 minutes
      @trip_data = {
        id: 8,
        driver: RideShare::Driver.new(id: 3, name: "Lovelace", vin: "12345678912345678"),
        passenger: RideShare::Passenger.new(id: 1, name: "Ada", phone: "412-432-7640"),
        start_time: start_time,
        end_time: end_time,
        cost: 23.45,
        rating: 3
      }
      @trip = RideShare::Trip.new(@trip_data)
    end

    it "calculates the amount of time for one trip in seconds" do
      @trip.trip_duration.must_equal 1500
    end
  end
end
