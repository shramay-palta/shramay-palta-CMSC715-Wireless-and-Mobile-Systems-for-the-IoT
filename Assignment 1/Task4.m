data = load('Data/Task4_AccelerometerData/sensorlog_7.mat');
x_data = data.Acceleration.X;
time_array = data.Acceleration.Timestamp;
time_duration = time_array(length(time_array)) - time_array(1);
time_in_seconds = time2num(time_duration);
fs = length(time_array)/time_in_seconds;
t=0:(1/fs):(time_in_seconds)-(1/fs);

% Because Timestamps were already given, I used that information to calculate my own 
% Sample Rate of 10.0360Hz using the code above. The value given later to us was 10Hz. 
figure(1);
plot(t, x_data);
xlabel('Time in Seconds'); ylabel('Amplitude in X Direction');

y_data = data.Acceleration.Y;

figure(2);
plot(t, y_data);
xlabel('Time in Seconds'); ylabel('Amplitude in Y Direction');

z_data = data.Acceleration.Z;

figure(3);
plot(t, z_data);  
xlabel('Time in Seconds'); ylabel('Amplitude in Z Direction');

% We will take the FFT of the acceleration data in the Y direction only. This is because of the force of 
% gravity acting in the downward direction as we walk towards the Chemistry Building.

y_modified = y_data - mean(data.Acceleration.Y);
figure(4);
plot_fft(y_modified, fs);


% Calculations:
% Dominant Frequency of walking = 2.65Hz (steps per second)
% Stride Length = 0.5 meters per step
% Therefore distance covered in one second = Dominant Frequency * Stride Length
% Speed = 2.65Hz * 0.5 meters
% Speed = 1.325 meters per second
% Distance given = 480 meters
% Therefore Time taken = Distance/Speed
% Time = 480/1.325
%      = 362.2642 seconds
%      = 6.03 minutes
