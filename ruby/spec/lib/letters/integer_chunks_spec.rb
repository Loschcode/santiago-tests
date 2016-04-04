
require_relative '../../../app/lib/letters/integer_chunks.rb'

RSpec.describe IntegerChunks do

  context "check chunks" do

    it "should resolve letters" do

      expect(IntegerChunks.new(999888777).compose.to_letters).to eq("nine hundred and ninety-nine million eight hundred and eighty-eight thousand seven hundred and seventy-seven")

    end

    it "should raise an error" do

      expect{IntegerChunks.new(999888777666555444333222111).compose.to_letters}.to raise_error(ArgumentError)

    end

  end

end