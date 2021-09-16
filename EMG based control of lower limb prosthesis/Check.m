while 1
    m1.startStreaming;
pause(1);
m1.stopStreaming;
   tempLog = m1.emg_log;
   [Rows,~] = size(tempLog)
end