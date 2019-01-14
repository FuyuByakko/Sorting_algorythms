def merge(arr1, arr2)
  sorted = Array.new(arr1.length + arr2.length)

  #counter in arr1
  i = 0
  #counter in arr2
  j = 0
  for pos in 0...sorted.length
    if j == arr2.length
      sorted[pos] = arr1[i].to_i      
      i += 1
      next      
    end
    if i == arr1.length
      sorted[pos] = arr2[j].to_i
      j += 1
      next
    end
    if arr1[i].to_i <= arr2[j].to_i
      sorted[pos] = arr1[i].to_i
      i += 1
      next
    end 
    sorted[pos] = arr2[j].to_i
    j += 1
  end
  #puts sorted
  return sorted
end

def merge_sort(unsorted_arr)
  if unsorted_arr.length < 2
    return unsorted_arr
  end

  #set current array start, end and midpoints
  arr_start = 0
  arr_end = arr_end = unsorted_arr.length - 1
  middle = ((arr_start + arr_end) / 2 ) + arr_start

  #divide initial array into the left and right part
  left_sort = merge_sort(unsorted_arr[arr_start..middle])
  print "left array: #{left_sort}\n" 
  right_sort = merge_sort(unsorted_arr[middle+1..arr_end])
  print "right array: #{right_sort}\n"

  #merge the 2 parts
  sorted_arr = merge(left_sort, right_sort)
  print "sorted and merged: #{sorted_arr}\n"
  return sorted_arr
end

init_array = [1,3,4,5,6,72,32, 235,23]
sorted = merge_sort(init_array)
#puts sorted