def __icr_exec__
  ("a".."z").to_a.permutations(2)
  ("a".."z").to_a.each_permutation {|a| puts a.join}
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"