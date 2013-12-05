require_relative "./spec_helper"
require 'rspec'
require 'rspec/expectations'

describe '.initialize' do
  
  before(:each) do
    @test = Addressbook.new(name: "Eric",address: "4908 Gina Ct",phone: "(856)924-1098")
  end
  
  it 'Creates a instance of the Addressbook Class using 2 named parameters' do
    expect {@test = Addressbook.new(name: "Eric",address: "4908 Gina Ct") }.to_not raise_error  
  end
  
  it 'Creates a instance of the Addressbook Class using 1 named parameter' do
    expect {@test = Addressbook.new(name: "Eric") }.to_not raise_error  
  end
  
  describe "#name should return the name parameter from the initialized class" do
    it '#name should return the name paramter from the .initialized class' do
      @test.name.should == "Eric"
    end
    
    describe "#phone should return the phone number parameter from the initalized class" do
      it '#phone should return the phone paramter from the .initialized class' do
        @test.phone.should == '(856)924-1098'
      end
    end
  end
end
 