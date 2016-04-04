
require_relative '../../../app/lib/letters/letters.rb'

RSpec.describe Letters do

  context "turn integer into letters" do

    it "process -500" do

      expect(-500.to_letters).to eq("negative five hundred")

    end

    it "process 8080" do

      expect(8080.to_letters).to eq("eight thousand eighty")

    end


    it "process 60000" do

      expect(60000.to_letters).to eq("sixty thousand")

    end

    it "process 4506778" do

      expect(4506778.to_letters).to eq("four million five hundred and six thousand seven hundred and seventy-eight")

    end

  end

end