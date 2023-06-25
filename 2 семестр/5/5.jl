function quicksort(arr)
    if length(arr) <= 1
        return arr
    end

    pivot = arr[rand(1:length(arr))]
    lesser = [x for x in arr if x < pivot]
    equal = [x for x in arr if x == pivot]
    greater = [x for x in arr if x > pivot]

    return vcat(quicksort(lesser), equal, quicksort(greater))
end

# Пример использования:
arr = [5, 2, 9, 1, 7]
sorted_arr = quicksort(arr)
println(sorted_arr)