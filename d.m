x = [1, 2, 3, 4, 5];
n = length(x);
X = zeros(1, n);

for k = 1:n
    for j = 1:n
        X(k) = X(k) + x(j) * exp(-2i * pi * (k-1) * (j-1) / n);
    end
end

disp("DFT of x:");
disp(X);

N = length(X); % Length of the DFT result
x_reconstructed = zeros(1, N);

for n = 1:N
    for k = 1:N
        x_reconstructed(n) = x_reconstructed(n) + X(k) * exp(2i * pi * (k-1) * (n-1) / N);
    end
    x_reconstructed(n) = x_reconstructed(n) / N;
end

disp("IDFT of X:");
disp(x_reconstructed);