function y = conv(x, h)
    % x: Giriş sinyali
    % h: Filtre cevabı
    
    M = length(x);
    N = length(h);
    L = M + N - 1;
    
    y = zeros(1, L);
    
    for n = 1:L
        for k = max(1, n-N+1):min(M, n)
            y(n) = y(n) + x(k) * h(n - k + 1);
        end
    end
end