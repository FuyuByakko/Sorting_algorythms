def shift (array, pos, last_sorted)
  if pos >= array.length || last_sorted >= array.length
    puts "Position is outside of the array."
    puts "Kernel panic. I said PANICCCCC KERNEEEEELLLLLL"
    return  -1
  end
  for i in (last_sorted.downto(pos))
    array[i + 1] = array[i]
  end
  array[pos] = nil
end

#Add comments
def get_index(array, value)
  if array.length < 1
    puts "Empty or non-existant array"
    return nil
  end

  if array.length == 1
    puts "Array of length 1 is already sorted"
    return 0
  end

  i = 0
  while i < array.length do
    if array[i] == nil || value < array[i]
      return i
    else
      i += 1
    end
  end
end

def insert_sort(array)
  if array.length < 1
    puts "Empty or non-existant array"
    return nil
  end
  #prepare an array for the sorted numbers
  sorted_array = Array.new(array.length)
  #make the array all nil
  for n in 0...sorted_array.length
    sorted_array[n] = nil
  end
  #setup a counter for the last sorted element index
  last_sorted = 0
  #iterate over the original array elements
  for i in 0...array.length
    #get the correct destination index location in respect to the full array
    index =  get_index(sorted_array, array[i])

    #shift the destination array to open te required space
    shift(sorted_array, index, last_sorted)
    #input the value from oroginal array to the destination index in the sorter array
    sorted_array[index] = array[i]
    #change the last sorted counter to the new position
    last_sorted = i
  end
  #puts sorted_array
  return sorted_array
end

#numbers = [1]
numbers = []
#numbers = [4,2,4,25,1,0,0,3,10,7,6,5,8,8,15,2,1,0]

puts insert_sort(numbers)
