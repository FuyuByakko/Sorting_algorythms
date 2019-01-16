def partition(arr, arr_start, arr_end)
  #check if array is empty or of length 1. if Yes, no partitioning or sorting required
  if arr.length < 2
    return
  end
  #if end of array is the same as start - 1 element array already sorted, otherwise no values to check
  if arr_end <= arr_start
    return
  end

  #select a pivot point - in our case the element in the middle of the array as base
  pivot = (arr_end - arr_start) / 2 + arr_start
  #for test can check any of the below as well
  #pivot = arr_start
  #pivot = arr_end

  i = arr_start
  j = arr_end
  finish = false

  #start counting from both sides
  while !finish do
    #iterate from left to right till we find a value that is larger than our pivot
    while arr[i] <= arr[pivot] do
      if i == j
        finish = true
        break
      end
      i += 1
    end
    #iterate from right to left till we find a value that needs to be switched
    while arr[j] >= arr[pivot] do
      if i == j
        finish = true
        break
      end
      j -= 1
    end
    #swap the elements and increment
    arr[i], arr[j] = arr[j], arr[i]
    if !finish
      i += 1
      j -= 1
    end
  end

  #after we go through the whole array and our i and j meet, we check the meeting point
  #if meeting point is located at the same index as pivot, no actions needed

  #if meeting point is LEFT of pivot and is larger, we need to swap pivot with last element
  if i < pivot && arr[i] >= arr[pivot]
    arr[i], arr[pivot] = arr[pivot], arr[i]
    return i
  #if meeting point is LEFT of pivot and is smaller, we need to swap pivot with NEXT element    
  elsif i < pivot && arr[i] < arr[pivot] 
    arr[i + 1], arr[pivot] = arr[pivot], arr[i + 1]
    return i + 1
  #if meeting point is RIGHT of pivot and is larger, we need to swap pivot with PREVIOUS element
  elsif i > pivot && arr[i] > arr[pivot]
    arr[i - 1], arr[pivot] = arr[pivot], arr[i - 1]
    return i - 1
  #if meeting point is LEFT of pivot and is smaller, we need to swap pivot with NEXT element    
  else 
    arr[i], arr[pivot] = arr[pivot], arr[i]
    return i        
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
# puts "partitioning: [1,6,5,4,2]"
# partition([1,6,5,4,2], 0, 4)

# checking quick_sort
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
# end

# sorting_checks()
