
require_relative '../../../app/lib/factorial/factorial.rb'

RSpec.describe Factorial do

  context "get factorial zero" do

    it "returns 24 from 100" do

      expect(100.to_factorial_zeros).to eq(24)

    end

    it "returns 12 from 50" do

      expect(50.to_factorial_zeros).to eq(12)

    end


    it "returns 112 from 456" do

      expect(456.to_factorial_zeros).to eq(112)

    end

  end

end