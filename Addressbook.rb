require_relative "./my_module"

class Addressbook
  include Log
  # Mutators and Accessors
  %i(name address phone).each do |mutator| 
    attr_accessor mutator
  end
  
  def initialize(name: "John Doe",address: "123 Any Street",phone: "(215)-123-1234")
    @name = name
    @address = address
    @phone = phone
  end
  
  def log(entry: "")
    Log::logger(entry: entry)
  end
  
end

   
