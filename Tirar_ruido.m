Y = fft(data); %Transformada de Fourrier do �udio
tamanho = length(data); %Pega o n�mero de amostras do �udio
t = tamanho - 1
n = [0:t]
w = 2*pi/tamanho*n %Velocidade angular
%//stem(w,abs(Y)) % Gr�fico dos valores absolutos de Y
P = abs(Y); %Transforma os valores de Y em sua forma absoluta

indices = P > 1.8*10^4 %indices adquire os valores que sejam maiores que 1.8*10^4
%//stem (w, indices) %Gr�fico dos valores de indices 

denoise = P .* indices %Multiplica os valores de P por indices
stem(w, denoise) %Gr�fico de denoise

audio = ifft(denoise); %Transformada inversa de Fourrier

audiowrite ("semruido.wav", audio, fs) %Cria��o do �udio

% Fmax = Fo(amostragem)/2
% Fmax = 8000/2 = 4000

% F <-> w 
% Fmax <-> pi 

% F <-> 0.3927
% 4000 <-> pi

% F = 4000*0.3927/pi F = 500

