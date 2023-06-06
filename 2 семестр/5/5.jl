function counting_sort(arr)
    min_value = minimum(arr)
    max_value = maximum(arr)
    count = zeros(Int, max_value - min_value + 1)
    
    for val in arr
        count[val - min_value + 1] += 1
    end
    
    sorted_arr = []
    for (val, freq) in enumerate(count)
        push!(sorted_arr, fill(val + min_value - 1, freq))
    end
    
    return vcat(sorted_arr...)
end

# Пример использования
arr = [5, 2, 9, 5, 2, 3]
sorted_arr = counting_sort(arr)
println(sorted_arr)