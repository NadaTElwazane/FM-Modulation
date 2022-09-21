clear
%close all
% Read attached audio file 
wav_file = 'Input.wav';
[msg_t,Fs] = audioread(wav_file);
%---------------------------FILTERING-------------------------------------%
% plot the audio file in time domain and in frequency domain
msg_f = fftshift(fft(msg_t));
x=-Fs/2:Fs/length(msg_t):Fs/2-Fs/length(msg_t); % frequency axis
filter_4k=ideal_filter(x,4000,1); % filter for 4000 Hz
msg_filtered=msg_f.*filter_4k'; % filter the audio file
msg_t=ifft(ifftshift(msg_filtered)); % inverse fft to get the filtered audio file
time=0:1/Fs:length(msg_t)/Fs-1/Fs;
%--------------PLOT THE FILTERED AUDIO FILE AND PLAY SOUND----------------%
figure
subplot(2,1,1)
plot(time,msg_t);   % plot the filtered audio file in time domain
title('Filtered audio file in time domain') 
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(x,abs(msg_filtered))    % filtered audio file in frequency domain
title('Filtered audio file in frequency domain') 
xlabel('Frequency (Hz)')
ylabel('Amplitude')
disp('Playing the filtered audio file')
sound(ifft(ifftshift(msg_filtered)),Fs)
pause(length(msg_t)/Fs)
%---------------FM MODULATION-------------------------------------------%
fc=100000; % new sampling frequency
new_Fs=5*fc; % new sampling frequency
msg_t=resample(msg_t,new_Fs,Fs); % resample the audio file
t=0:1/new_Fs:length(msg_t)/new_Fs-1/new_Fs; % time axis
x=-new_Fs/2:new_Fs/length(msg_t):new_Fs/2-new_Fs/length(msg_t);%frequency axis
y_int=cumsum(msg_t); % integrate the audio file
kf=0.01; % frequency sensitivity of the FM modulation
theta=2*pi*y_int*kf; % phase angle of the carrier signal
msg_fm=cos(2*pi*fc*t+theta.'); % FM modulation

%-----------------PLOT THE FM MODULATED AUDIO FILE---------------------%
figure
subplot(2,1,1)
plot(t,msg_fm) % plot the FM modulated audio file in time domain
title('FM modulated audio file in time domain')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(x,abs(fftshift(fft(msg_fm)))) % plot the FM modulated audio file in frequency domain
title('FM modulated audio file in frequency domain')
xlabel('Frequency (Hz)')
ylabel('Amplitude')
%-----------------FM DEMODULATION---------------------------------------%
% differentiating the FM modulated signal
msg_diff=diff(msg_fm); %differentiating FM to AM signal
envelope=abs(hilbert(msg_diff)); % envelope detection
msg_demod=envelope-mean(envelope); % DC blocking
msg_demod=msg_demod/(2*pi*kf);
%-----------------PLAY THE FM DEMODULATED AUDIO FILE--------------------%
msg_resample=resample(msg_demod,Fs,new_Fs); % resample the audio file
disp('Playing the FM demodulated audio file')
sound(msg_resample,Fs)
pause(length(msg_resample)/Fs)
%-----------------PLOT THE FM DEMODULATED AUDIO FILE---------------------%
t=0:1/Fs:length(msg_resample)/Fs-1/Fs; % time axis
x=-Fs/2:Fs/length(msg_resample):Fs/2-Fs/length(msg_resample);%frequency axis
figure
subplot(2,1,1)
plot(t,msg_resample) % plot the FM demodulated audio file in time domain
title('FM demodulated audio file in time domain')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(x,abs(fftshift(fft(msg_resample)))) % plot the FM demodulated audio file in frequency domain
title('FM demodulated audio file in frequency domain')
xlabel('Frequency (Hz)')
ylabel('Amplitude')



    