% Ses dosyasını yükle
[sinyal, fs] = audioread('1.wav');

% Zaman aralığı
t = (0:length(sinyal)-1) / fs;

% Sinyalin parçalara bölünmesi (her biri 1 saniye)
parca_uzunlugu = fs; % 1 saniye
parca_sayisi = floor(length(sinyal) / parca_uzunlugu);

tuslar = zeros(1, parca_sayisi);

for i = 1:parca_sayisi
    % Parçayı al
    parca = sinyal((i-1)*parca_uzunlugu + 1 : i*parca_uzunlugu);
    
    % Parçanın Fourier dönüşümünü hesapla
    fft_parca = fft(parca);
    
    % İlgili frekans aralığındaki genliği bul
    tus_frekanslar = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; % Tuş frekansları
    genlikler = abs(fft_parca(tus_frekanslar));
    
    % En yüksek genliğe sahip frekansı bul
    [max_genlik, en_yuksek_frekans_index] = max(genlikler);
    
    % En yüksek genliğe sahip frekansın hangi tuşa karşılık geldiğini belirle
    tuslar(i) = tus_frekanslar(en_yuksek_frekans_index);
end

% Bulunan tusları yazdır
disp('Tespit edilen tuşlar:');
disp(tuslar);
