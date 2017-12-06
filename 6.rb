# -*- coding: utf-8 -*-
# On the sixth day of christmas my calendar gave to me
eg_input = [0, 2, 7, 0]
input = [5, 1, 10, 0, 1, 7, 13, 14, 3, 12, 8, 10, 7, 12, 0, 6]

def redistribute_banks(banks)
  redistribute = lambda do |banks|
    redistributed = banks.dup
    index = redistributed.index(redistributed.max)
    blocks, redistributed[index] = redistributed[index], 0
    while blocks > 0
      index += 1
      redistributed[index % redistributed.size] += 1
      blocks -= 1
    end
    redistributed
  end

  prev, steps = [], 0
  while !prev.any?{|p| p == banks}
    prev << banks
    banks = redistribute.(banks)
    steps += 1
  end
  [steps, prev.size - prev.index(banks)]
end

puts(format('Steps: %i, Loop size: %i', *redistribute_banks(input)))
