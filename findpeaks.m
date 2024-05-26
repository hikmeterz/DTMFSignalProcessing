function [peak_values, peak_indices] = find_peaks(vector, min_peak_distance)
    [peak_values, peak_indices] = find(vector > [vector(1)-1, vector(1:end-1)] & ...
                                        vector > [vector(2:end), vector(end)-1] & ...
                                        vector > max(vector) * 0.5); % Özelleştirilebilir eşik değeri
    if nargin > 1
        [peak_values, sort_indices] = sort(peak_values, 'descend');
        peak_indices = peak_indices(sort_indices);
        
        too_close = diff(peak_indices) < min_peak_distance;
        peak_indices(too_close) = [];
        peak_values(too_close) = [];
    end
end
