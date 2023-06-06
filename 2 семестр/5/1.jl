# Функция сортировки вставками
function insertion_sort(arr)
    n = length(arr)
    for i in 2:n
        j = i
        while j > 1 && arr[j] < arr[j-1]
            arr[j], arr[j-1] = arr[j-1], arr[j]
            j -= 1
        end
    end
    return arr
end

# Функция, аналогичная sort
function my_sort(arr)
    return insertion_sort(copy(arr))
end

# Функция, аналогичная sort!
function my_sort!(arr)
    insertion_sort!(arr)
end

# Функция, аналогичная sortperm
function my_sortperm(arr)
    sorted_arr = insertion_sort(copy(arr))
    return sortperm(sorted_arr)
end

# Функция, аналогичная sortperm!
function my_sortperm!(arr)
    sorted_arr = insertion_sort(arr)
    return sortperm!(sorted_arr)
end

arr = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sorted_arr = my_sort(arr)
println("Sorted array: ", sorted_arr)

my_sort!(arr)
println("Sorted array (in-place): ", arr)

perm = my_sortperm(arr)
println("Sort permutation: ", perm)

my_sortperm!(arr)
println("Sort permutation (in-place): ", arr)
