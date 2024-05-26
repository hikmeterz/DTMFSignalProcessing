[y, fs] = audioread('dtmf_mixed_sinyali.wav');
Y = fft(y);

[peak_values, peak_indices] = findpeaks(abs(Y));
frequencies = linspace(0, fs, length(Y));
matched_frequencies = frequencies(peak_indices);

dtmf_frequencies = [697, 770, 852, 941, 1209, 1336, 1477];

%matched_frequencies
% Tahminleme yap (örneğin en yakın frekanstaki iki değeri seç)
b1_frequency = dtmf_frequencies(find_closest(matched_frequencies, dtmf_frequencies));
b2_frequency = dtmf_frequencies(find_closest(matched_frequencies, dtmf_frequencies));


system1_low_pass = (735 + 1250) / 2;
system1_high_pass = (735 + 1250) / 2;

% Sistem 2 için frekans aralıkları
system2_low_pass = min(b1_frequency, b2_frequency);
system2_high_pass = (b1_frequency + b2_frequency) / 2;

% Sistem 3 için frekans aralıkları
system3_low_pass = (b1_frequency + b2_frequency) / 2;
system3_high_pass = max(b1_frequency, b2_frequency);

% Filtrelerin oluşturulması
n = 1024; % Filtre uzunluğu
fs = 44100; % Örnekleme frekansı

h_system1 = fir1(n, [system1_low_pass, system1_high_pass] / (fs / 2), 'bandpass');
h_system2 = fir1(n, [system2_low_pass, system2_high_pass] / (fs / 2), 'bandpass');
h_system3 = fir1(n, [system3_low_pass, system3_high_pass] / (fs / 2), 'bandpass');

% Ters Fourier dönüşümü ile filtrenin zaman alanındaki cevabını elde etme
h_system1_time = ifft(h_system1);
h_system2_time = ifft(h_system2);
h_system3_time = ifft(h_system3);

% Filtrelerin uygulanması
y_filtered_system1 = conv(y, h_system1_time);
y_filtered_system2 = conv(y, h_system2_time);
y_filtered_system3 = conv(y, h_system3_time);


y_filtered_system1;
y_filtered_system2;
y_filtered_system3;


