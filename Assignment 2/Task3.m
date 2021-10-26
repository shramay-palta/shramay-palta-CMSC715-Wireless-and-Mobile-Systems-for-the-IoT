data = csvread('Data/Task3_DoA_Estimation/Data/7.csv');

figure(1);
plot(real(data));
xlabel('Number of Elements (Index)');

figure(2);
plot(imag(data));
xlabel('Number of Elements (Index)');

target_frequency = 2e3;
sound_speed = 340;
lamda = sound_speed/target_frequency;
element_distance = lamda/2;
elements = 100;
doa = zeros(1, length(-pi/2:pi/180:pi/2));
k = 0;

for angle = -pi/2:pi/180:pi/2
    alpha = [];
    for n = 1:elements
        alpha(n,:) =exp(-1i*2*pi*(n-1)*element_distance*sin(angle)/lamda);
    end
    k = k+1;
    doa(k,:) = data*alpha;
end

%[max_val max_ind]=max(doa)

phi = -90:1:90;


figure(3);
plot(phi, abs(doa), 'b');
xlabel('Possible direction of arrival in degrees');
ylabel('Absolute Value of Magnitude');