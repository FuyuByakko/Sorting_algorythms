def partition(arr, arr_start, arr_end)
  if arr.length < 2
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
  
  #after all array is checked, the index is set right AFTER the last value less than pivot
  #if index is to the RIGHT of pivot, we need to swap pivot with the previous element (pivot - 1)
  #if the index is to the LEFT of pivot, pivot can be swapped with the element at the index itself
  if index_pos <= pivot
    arr[pivot], arr[index_pos] = arr[index_pos], arr[pivot]
    puts "returning #{index_pos}"
    puts "#{arr}"
    return index_pos
  else
    arr[pivot], arr[index_pos - 1] = arr[index_pos - 1], arr[pivot]
    puts "returning #{index_pos - 1}"
    puts "#{arr}"
    return index_pos - 1
  end
end


partition([1,6,5,4,2], 0, 4)





#def quick_sort(arr, arr_start = 0, arr_end = arr.length - 1)





#end
