# coding: utf-8
# On the third day of christmas my calendar gave to me
def euclid_distance_in_spiral(number)
  return 0 if number == 1
  number -= 1
  multiplier, circle_size = 1, 8

  while number > circle_size
    number -= circle_size
    multiplier += 1
    circle_size = multiplier * 8
  end

  array_size = circle_size / 4
  number -= array_size while number > 0
  number = number.abs
  offset_from_center = ((array_size / 2) - number).abs
  offset_from_center + multiplier
end

def calculate_first_inner_neighbour(side, position_in_side, array_size, position)
  pside = side
  steps = 4
  position -= 1
  while steps > 0
    if side > 0
      position -= array_size
      side -= 1
    else
      position -= (array_size - 2)
    end
    steps -= 1
  end
  if pside == 3
    position -= 1 if (position_in_side + 1 == array_size)
  else
    position -= 1 if (position_in_side + 2 == array_size)
    position -= 2 if (position_in_side + 1 == array_size)
  end
  position
end

def find_first_sum_larger_than_in_sum_of_neighbours_spiral(number)
  raise "I don't support numbers that low, calculate it your self" if number < 25
  spiral = [1, 1, 2, 4, 5, 10, 11, 23, 25]

  array_size, side, position_in_side = 4, 0, 0
  while spiral.last < number
    next_insert = spiral.last
    fin = calculate_first_inner_neighbour(side, position_in_side, array_size, spiral.size + 1)
    indexes = case position_in_side
              when 0 then
                side != 0 ? [spiral.size - 2, fin, fin - 1] : [fin]
              when 1 then
                side == 0 ? [spiral.size - 2, fin, fin -1] : [fin, fin - 1, fin - 2]
              when (array_size - 2) then
                side == 3 ? [fin, fin - 1, fin - 2] : [fin, fin - 1]
              when (array_size - 1) then
                side == 3 ? [fin, fin - 1] : [fin]
              else
                [fin, fin - 1, fin - 2]
              end

    indexes.each{|index| next_insert += spiral.fetch(index, 0)}

    spiral << next_insert
    position_in_side += 1
    if position_in_side >= array_size
      position_in_side = 0
      side += 1
    end
    if side > 3
      side = 0
      array_size += 2
    end
  end
  spiral.last
end

p euclid_distance_in_spiral(361527)
p find_first_sum_larger_than_in_sum_of_neighbours_spiral(36152)7
