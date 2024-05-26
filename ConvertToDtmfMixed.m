function ConvertToDtmfMixed(b1, b2)
    fs = 44100; % Örnekleme frekansı (örneğin 44.1 kHz)
    t = 0:1/fs:1-1/fs; % 1 saniyelik zaman aralığı

    % b1 ve b2 tuşlarına ait frekanslar (Hz)
    tus_frekanslar = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
    
    % b1 ve b2 tuşlarına karşılık gelen DTMF sinyallerini oluştur
    sinyal_b1 = sum(sin(2*pi*t'*tus_frekanslar(b1)));
    sinyal_b2 = sum(sin(2*pi*t'*tus_frekanslar(b2)));
    
    % DTMF sinyallerini topla
    sinyal_toplam = sinyal_b1 + sinyal_b2;
    
    % Gauss gürültüsü ekle
    gurultu = 0.1 * randn(size(sinyal_toplam)); % Gürültü seviyesi ayarlanabilir
    
    sinyal_gurultulu = sinyal_toplam + gurultu;
    
    % Sinyali [-1, 1] aralığına sıkıştır
    sinyal_gurultulu = sinyal_gurultulu / max(abs(sinyal_gurultulu));

    % WAV dosyasına kaydet
    audiowrite('dtmf_mixed_sinyali.wav', sinyal_gurultulu, fs);
end

