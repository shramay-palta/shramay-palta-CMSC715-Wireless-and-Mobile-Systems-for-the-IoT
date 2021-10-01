[audio,sample_rate] = audioread('Data/Sound_Files/7.wav');
audio_length = length(audio)/sample_rate;
dt = 1/sample_rate;
t = 0:dt:(length(audio)*dt)-dt;

figure(1);
plot(t,audio); xlabel('Seconds'); ylabel('Amplitude');

figure(2);
spectrogram(audio(:,1),[],[],[],sample_rate,'yaxis')