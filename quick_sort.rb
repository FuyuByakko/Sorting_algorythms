def partition(arr, arr_start, arr_end)
  #check if array is empty or of length 1. if Yes, no partitioning or sorting required
  if arr.length < 2
    return
  end
  #if end of array is the same as start - 1 element array already sorted, otherwise no values to check
  if arr_end <= arr_start
    return
  end

  #set index where the pivot will be shifted (all elements to the left of index are less than pivot)
  index_pos = arr_start
  #select a pivot point - in our case the element in the middle of the array
  pivot = (arr_end - arr_start) / 2 + arr_start
  #iterate over the array and swap the currently checked element with the index_pos element if < pivot
  for i in arr_start..arr_end
    #need to skip the pivot item in the comparison
    if i == pivot
      next
    end
    #need to skip the the possible change of the pivot item
    if index_pos == pivot
      index_pos += 1
    end
    #compare the current item value with the pivot value
    if arr[i] <= arr[pivot]
      #if i is the same as index pos, all values before are less than pivot and no swapping was done
      if i != index_pos
        arr[i], arr[index_pos] = arr[index_pos], arr[i]
      end
      index_pos += 1
    end
  end
    if index_pos > arr_end
      index_pos = arr_end
    end
  
  #after all array is checked, the index is set right AFTER the last value less than pivot
  #if index is to the RIGHT of pivot, we need to swap pivot with the previous element (pivot - 1)
  #if the index is to the LEFT of pivot, pivot can be swapped with the element at the index itself
  if index_pos <= pivot || index_pos > pivot && (arr[index_pos] <= arr[pivot])
    arr[pivot], arr[index_pos] = arr[index_pos], arr[pivot]
   # puts "returning #{index_pos}"
   # puts "#{arr[arr_start..arr_end]}"
    return index_pos
  else
    arr[pivot], arr[index_pos - 1] = arr[index_pos - 1], arr[pivot]
   # puts "returning #{index_pos - 1}"
   # puts "#{arr[arr_start..arr_end]}"
    return index_pos - 1
  end
end

#function received an array, default values for first iteration is the full array
def quick_sort(arr, arr_start = 0, arr_end = arr.length - 1)
  #if end of array is the same as start - 1 element array already sorted, otherwise no values to check
  if arr_end <= arr_start
    return
  end

  #partition the received array and receive the pivot point index to divide it further
  pivot = partition(arr, arr_start, arr_end)
  #sort the remaining halves to the left and right of pivot
  quick_sort(arr, arr_start, pivot - 1)
  quick_sort(arr, pivot + 1, arr_end)
  return
end


#checking partition function
  #partition([1,6,5,4,2], 0, 4)
  partition([4,1,2,7,5,9], 0,5)

def sorted(arr)
  for i in 0...arr.length
    if arr[i] > arr[i+1]
      return false
    end
    return true
  end
end

loop do
  arr = (0..1000).to_a.shuffle
  quick_sort(arr)
  puts 'wtf' if !sorted(arr)
  puts "ok"
end


#checking quick_sort
# def sorting_checks()
#   puts "sorting empty array []"
#   s1 = []
#   quick_sort([])
#   puts "#{s1}"

#   puts "sorting 1 element array [3]"
#   s2 = [3]
#   quick_sort(s2)
#   puts "#{s2}"

#   puts "sorting already sorted array [1,2,3,4,5]"
#   s3 = [1,2,3,4,5]
#   quick_sort(s3)
#   puts "#{s3}"

#   puts "sorting array already in descending order [3,1,-2]"
#   s4 = [3,1,-2]
#   quick_sort(s4)
#   puts "#{s4}"

#   puts "sorting random array [5,2,1,6,4,2,5,2,8,1,3,7]"
#   s5 = [5,2,1,6,4,2,5,2,8,1,3,7]
#   quick_sort(s5)
#   puts "#{s5}"

#   puts "sorting random array [5,2,1,6,4,2,5,2,8,1,3,7]"
#   s6 = [4,1,2,7,5,9]
#   quick_sort(s6)
#   puts "#{s6}"
# end

# sorting_checks()
