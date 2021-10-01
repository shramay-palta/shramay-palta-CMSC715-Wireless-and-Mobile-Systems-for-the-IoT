y = audioread('Data/Sound_Files/7.wav');

bonus = kron(eye(8), dft_matrix);
answer = bonus*y/32;
answer = reshape(answer, [1024, 8]);
bonus_answer_part2 = answer(512:1024, :);

figure(1);
imagesc(abs(bonus_answer_part2));
xlabel('Time in Seconds'); 
ylabel('Frequency');
yticklabels({'500', '450', '400', '350', '300', '250', '200', '150', '100', '50'})
set(gca, 'TickDir', 'out');
box off;

figure(2);
imagesc(real(bonus));