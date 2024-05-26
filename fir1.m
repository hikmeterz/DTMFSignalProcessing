function h = fir1(N, Wn, type)
    % N: Filtre derecesi
    % Wn: Kesme frekansı (örneğin [0.2, 0.5])
    % type: Filtre tipi ('low', 'high', 'bandpass', 'bandstop')
    
    if nargin < 3
        type = 'low';
    end
    
    h = zeros(1, N+1);
    
    switch type
        case 'low'
            m = N/2;
            wc = Wn(1) * pi;
            for n = 0:N
                if n == m
                    h(n+1) = wc / pi;
                else
                    h(n+1) = sin(wc * (n - m)) / (pi * (n - m));
                end
            end
        case 'high'
            m = N/2;
            wc = Wn(1) * pi;
            for n = 0:N
                if n == m
                    h(n+1) = 1 - wc / pi;
                else
                    h(n+1) = -sin(wc * (n - m)) / (pi * (n - m));
                end
            end
        case 'bandpass'
            m = N/2;
            wc1 = Wn(1) * pi;
            wc2 = Wn(2) * pi;
            for n = 0:N
                if n == m
                    h(n+1) = (wc2 - wc1) / pi;
                else
                    h(n+1) = (sin(wc2 * (n - m)) - sin(wc1 * (n - m))) / (pi * (n - m));
                end
            end
        otherwise
            error('Invalid filter type');
    end
end
