#sort in assending or dessending order
#for each element in list look at element and element directly to thr right of it if out of order swap elements

def bubble_sort(array)
  array.each_with_index do |_, i|
    array.each_with_index do |_, j|

      break if j >= array.length - i - 1
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
    end
  end  
end
    
 
p  bubble_sort([100,44,3,78,2,0,2])

