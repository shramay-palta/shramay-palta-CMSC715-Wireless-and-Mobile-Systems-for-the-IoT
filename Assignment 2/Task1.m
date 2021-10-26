[transmitted_signal, sample_rate_t] = audioread('Data/Task1_SignalDetection/Data/transmitSignal.wav');
[received_signal, sample_rate_r] = audioread('Data/Task1_SignalDetection/Data/7.wav');

dt_t = 1/sample_rate_t;
t_t = 0:dt_t:(length(transmitted_signal)*dt_t)-dt_t;

figure(1);
plot(t_t,transmitted_signal); xlabel('Time in Seconds'); ylabel('Amplitude');
title('Transmitted Signal');

dt_r = 1/sample_rate_r;
t_r = 0:dt_r:(length(received_signal)*dt_r)-dt_r;

figure(2);
plot(t_r,received_signal); xlabel('Time in Seconds'); ylabel('Amplitude');
title('Received Signal');

% I wrote a code in Python to find the sliding window correlation
% Between the transmitted and the received signal
% I cross checked with findsignal
% Which is an inbuilt function in Matlab and got the same answer

[start_index,stop_index,sim_dist] = findsignal(received_signal, transmitted_signal);