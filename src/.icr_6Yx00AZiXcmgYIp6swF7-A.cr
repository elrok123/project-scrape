def __icr_exec__
  ("a".."z").to_a.each_permutation {|perm| perm }.not_nil!.map {|a| a }
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"