function receivedSignal = generateTestData_task1(transmitSignalFile, startIndexInRxSignal)
    %Output:
    %    receivedSignal: A simulated received signal with transmitSignal
    %    embedded in it. The starting index of the transmitSignal in this
    %    output signal is provided by the user through the
    %    "startIndexInRxSignal" variable.
    
    %Inputs:
    %    transmitSignal = The transmitted signal file name (.wav format).
    %    startIndexInRxSignal = The starting index of the transmit signal in the generated received signal.
    
    [TxSignal, Fs] = audioread(transmitSignalFile);
    
    RxSignal = zeros(1,startIndexInRxSignal+length(TxSignal)+1000);
    RxSignal(startIndexInRxSignal:startIndexInRxSignal+length(TxSignal)-1) = TxSignal;
    RxSignal = awgn(RxSignal, -10);
    RxSignal = RxSignal./max(RxSignal);
    
    receivedSignal = RxSignal;
end