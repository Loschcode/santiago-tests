
require_relative '../../../app/lib/knight_tour/knight_tour.rb'

RSpec.describe KnightTour do

  context "do a knight tour" do

    it "draw a correct specific knight tour" do

      expect(KnightTour.new.go(6,6,0,0)).to eq([" |  1 | 28 |  9 | 20 |  3 | 30",
                                                " | 10 | 21 |  2 | 29 | 16 | 19",
                                                " | 35 |  8 | 27 | 18 | 31 |  4",
                                                " | 22 | 11 | 36 | 15 | 26 | 17",
                                                " |  7 | 34 | 13 | 24 |  5 | 32",
                                                " | 12 | 23 |  6 | 33 | 14 | 25"])

    end

    it "should raise a no solution exception" do

      expect{KnightTour.new.go(3,3,0,0)}.to raise_error(ArgumentError)

    end


  end

end