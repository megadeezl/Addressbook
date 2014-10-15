module Log
   
   def Log.logger(entry = "")
     File.open('./Logfile.log','a'){|line| line.puts(entry)}
   end

end
