N=1024;
for i=0:N-1
    for j=0:N-1
        w(i+1,j+1)=cos((2*pi*i*j)/N)-1i*sin((2*pi*i*j)/N);
    end
end
dft_matrix = w;

figure(1);
imagesc(real(dft_matrix));

figure(2);
imagesc(imag(dft_matrix));

% For plotting DFT, don't using scaling factor of sqrt(n)
% use it for calculations in stft.

% Need to break audio sample into 8 equal parts. 

y = audioread('Data/Sound_Files/7.wav');

data = audioinfo('Data/Sound_Files/7.wav');
Fs = data.SampleRate;
split_duration = 1; % 1 sec
samples_per_split = split_duration*Fs;
stft_ans = [];
split_count = 1;

for begin = 1:samples_per_split:data.TotalSamples
    end_point = min(begin + samples_per_split - 1, data.TotalSamples);
    y_clip = y(begin:end_point);
    %need to append the multiplication column to the final matrix
    stft_ans(:,split_count) = (dft_matrix/sqrt(N)) * y_clip;
    split_count = split_count + 1;
end

%Display only the positive frequencies
shifted_stft = stft_ans(512:1024, :);

figure(3);
imagesc(abs(shifted_stft));
xlabel('Time in Seconds'); 
ylabel('Frequency');
yticklabels({'500', '450', '400', '350', '300', '250', '200', '150', '100', '50'})
set(gca, 'TickDir', 'out');
box off;
