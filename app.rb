require_relative "./Addressbook"


test = Addressbook.new(name: "Eric",address: "4908 Gina Ct",phone: "(856)924-1098")
test.log(entry: "Customer: #{test.name} Address: #{test.address} Telephone Number: #{test.phone}")


