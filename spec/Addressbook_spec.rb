require "spec_helper"


  describe Addressbook do

		it "should create entry" do

      test = Addressbook.new("Eric","400 Jena Ct","(865)943-1111")
      test.log(entry: "Customer: #{test.name} Address: #{test.address} Telephone Number: #{test.phone}")
      test.name.should == "Eric"
		end

  end
