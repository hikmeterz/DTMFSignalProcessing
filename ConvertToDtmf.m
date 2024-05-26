function ConvertToDtmf(tuslar)
    fs = 128e3; % Örnekleme frekansı (Hz)
    tus_suresi = 0.5; % Her tuşa basma süresi (saniye)
    t = 0:1/fs:tus_suresi-1/fs; % Zaman aralığı

    tus_frekanslar = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; % Tus frekansları (Hz)
    dtmf_matrix = [
        1, 2, 3, 10;
        4, 5, 6, 11;
        7, 8, 9, 12;
        14, 0, 15, 13
    ]; % DTMF frekans matrisi

    sinyal = zeros(1, length(t)*length(tuslar));

    for tus = tuslar
        [row, col] = find(dtmf_matrix == tus);
        tus_sinyali = 0.5 * sin(2*pi*tus_frekanslar(row)*t) + 0.5 * sin(2*pi*tus_frekanslar(col)*t);
        sinyal((tus-1)*length(t)+1:tus*length(t)) = tus_sinyali;
    end

    audiowrite('dtmf_sinyali1.wav', sinyal, fs);
end