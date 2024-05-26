function closest_index = find_closest(value, array)
    [~, closest_index] = min(abs(array - value));
end
