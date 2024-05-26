% Ses sinyalini oku
[y, fs] = audioread('dtmf_mixed_sinyali.wav');

% Fourier dönüşümü yap
Y = fft(y);

% Frekans bileşenlerini analiz et
frequencies = linspace(0, fs, length(Y)); % Frekans aralığı
[peak_values, peak_indices] = findpeaks(abs(Y)); % Genliği en yüksek olan frekanslar

% Frekans eşleştirmesi yap
dtmf_frequencies = [697, 770, 852, 941, 1209, 1336, 1477];
matched_frequencies = frequencies(peak_indices);

%matched_frequencies
% Tahminleme yap (örneğin en yakın frekanstaki iki değeri seç)
b1_estimate = dtmf_frequencies(find_closest(matched_frequencies, dtmf_frequencies));
b2_estimate = dtmf_frequencies(find_closest(matched_frequencies, dtmf_frequencies));

% Sonuçları ekrana yazdır
fprintf('Estimated b1: %d Hz\n', b1_estimate);
fprintf('Estimated b2: %d Hz\n', b2_estimate);
