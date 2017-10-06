require "proc_source"

proc1 = Proc.new do |i|
  puts i
end

puts proc1.proc_source
