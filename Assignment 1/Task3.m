y = audioread('Data/Sound_Files/7.wav');
data = audioinfo('Data/Sound_Files/7.wav');
Fs = data.SampleRate;
split_duration = 1; % 1 sec
samples_per_split = split_duration*Fs;
stft_ans_overlap = [];
split_count = 1;

%time window 1024
%time windows should have 512 point overlap
%0-1024, 512-1536, ....

for begin = 1:512:7169
    end_point = min(begin + samples_per_split - 1, data.TotalSamples);
    y_clip = y(begin:end_point);
    %need to append the multiplication column to the final matrix
    stft_ans_overlap(:,split_count) = (dft_matrix/sqrt(N)) * y_clip;
    split_count = split_count + 1;
end

%Display only the positive frequencies
shifted_stft_overlap = stft_ans_overlap(512:1024, :);

figure(1);
imagesc(abs(shifted_stft_overlap));
xlabel('Time in Seconds'); 
xticklabels({'1', '2', '3', '4', '5', '6', '7', '8'})
ylabel('Frequency');
yticklabels({'500', '450', '400', '350', '300', '250', '200', '150', '100', '50'})
set(gca, 'TickDir', 'out');
box off;
