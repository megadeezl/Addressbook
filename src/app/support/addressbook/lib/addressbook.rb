require "pathname"

Dir.glob(Pathname(__FILE__).dirname.expand_path + "addressbook/*.rb").each do |req|
  require  req
end

class Addressbook
  include Log
 
  attr_accessor :name, :address, :phone

  def initialize(name = "John Doe", address = "123 Any Street", phone = "(215)-123-1234")
    @name = name
    @address = address
    @phone = phone
  end

  def log(entry = "")
    Log::logger(entry: entry)
  end

end
