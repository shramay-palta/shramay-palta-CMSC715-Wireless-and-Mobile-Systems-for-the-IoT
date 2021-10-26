function arraySnapshot = generateTestData_task3(angInDeg)
    Fc = 2000;
    SpeedOfSound = 340; %m/s
    lambda = SpeedOfSound/Fc;
    d = lambda/2; %interElementDistance
    numOfElement = 100;

    arraySnapshot = getSensorSnapshot(d, lambda, numOfElement, angInDeg);
end

function mx = getSensorSnapshot(d, lambda, numElem, angInDeg)
    %rng(1279);
    randSig = (rand(1,1)-0.5) + (rand(1,1)-0.5)*1j;
    sensorId = [0:numElem-1];
    %mx = randSig * exp(-2*pi*sensorId*d*sind(angInDeg)/lambda);
    mx = exp(1j*2*pi*sensorId*d*sind(angInDeg)/lambda);
end