target_frequency = 2e3;
sound_speed = 340;
lamda = sound_speed/target_frequency;
element_distance = lamda*2;
elements = 10;

angle = 0:pi/180:2*pi;
alpha = zeros(1, length(angle));

for n=1:elements
    beta(n,:) = (n-1)*element_distance*cos(angle);
    alpha = alpha+exp(-1i*2*pi*(beta(n,:)/lamda));
end    

figure(1);
polarplot(angle, abs(alpha), 'b');
title('Directional Gain of a 10-element ULA with D = 2*wavelength');