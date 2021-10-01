y = audioread('Data/Sound_Files/7.wav');
matrix_zeroes = zeros(1024, 7168);
shifted_matrix = [dft_matrix matrix_zeroes];
final_dft = [shifted_matrix];

for l=1:1:14
    shifted_matrix = circshift(shifted_matrix, 512, 2);
    final_dft = [final_dft; shifted_matrix];
end

bonus_answer = final_dft*y/32;
bonus_answer = reshape(bonus_answer, [1024, 15]);
bonus_answer_part3 = bonus_answer(512:1024, :);

figure(1);
imagesc(abs(bonus_answer_part3));
xlabel('Time in Seconds'); 
xticklabels({'1', '2', '3', '4', '5', '6', '7', '8'})
yticklabels({'500', '450', '400', '350', '300', '250', '200', '150', '100', '50'})
ylabel('Frequency');
set(gca, 'TickDir', 'out');
box off;

figure(2);
imagesc(real(final_dft));