def bubbling(array)
  stop = array.length - 2 #since we are comparing 2 items, last we will compare indexes (n-1) and (n-2)
  swap = 1
  while swap != 0 do
    swap = 0
    for i in 0..stop
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        #puts "swapped #{array[i]} and #{array[i+1]}"
        swap += 1
      end
    end
  end 
end


numbers = [1,3,2,6,5,4]
bubbling(numbers)
puts numbers