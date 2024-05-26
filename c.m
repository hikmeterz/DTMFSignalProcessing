[sinyal, fs] = audioread('dtmf_sinyali1.wav');

t = 0:1/fs:(length(sinyal)-1)/fs;
index_aralik1 = find(t >= 0 & t <= 0.5);
index_aralik2 = find(t > 0.5 & t <= 1);
index_aralik3 = find(t > 1 & t <= 1.5);

sinyal_aralik1 = sinyal(index_aralik1);
sinyal_aralik2 = sinyal(index_aralik2);
sinyal_aralik3 = sinyal(index_aralik3);

frekanslar = (0:length(sinyal_aralik1)-1) * fs / length(sinyal_aralik1);

fft_aralik1 = fft(sinyal_aralik1);
fft_aralik2 = fft(sinyal_aralik2);
fft_aralik3 = fft(sinyal_aralik3);

subplot(3, 1, 1);
plot(frekanslar, abs(fft_aralik1));
title('Frekans Bilesenleri [0, 0.5] s');
xlabel('Frekans (Hz)');
ylabel('Genlik');

% Use the frekanslar vector of the correct length for each subplot
frekanslar2 = (0:length(sinyal_aralik2)-1) * fs / length(sinyal_aralik2);
subplot(3, 1, 2);
plot(frekanslar2, abs(fft_aralik2));
title('Frekans Bilesenleri [0.5, 1] s');
xlabel('Frekans (Hz)');
ylabel('Genlik');

% Use the frekanslar vector of the correct length for the third subplot
frekanslar3 = (0:length(sinyal_aralik3)-1) * fs / length(sinyal_aralik3);
subplot(3, 1, 3);
plot(frekanslar3, abs(fft_aralik3));
title('Frekans Bilesenleri [1, 1.5] s');
xlabel('Frekans (Hz)');
ylabel('Genlik');

sgtitle('Ses Sinyalinin Frekans Bilesenleri');
