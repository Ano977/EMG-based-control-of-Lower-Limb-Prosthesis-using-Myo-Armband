
while 1
m1.startStreaming;
   tempLog = m1.emg_log;
   [Rows,~] = size(tempLog);
   para = tempLog(Rows-100:Rows-0,:);
   summedPara = sum(para,2);
   amp = max(summedPara) - min(summedPara)
   if amp > 0.5
       emgSig = tempLog(Rows-100:Rows-0,:);
       emgSigTP = turningPTS(emgSig,0.05); 
        if emgSigTP>124
           emgSigTP = 124;
       end
       if emgSigTP<76
           emgSigTP = 76;
       end
       emgsigCTF = cropTransPeakFeatRT(emgSig,emgSigTP,50);
       if emgSigTP~=0
       yfit = trainedClassifier.predictFcn(emgsigCTF);
       if yfit == 1
           disp('forward')
         
       end
       if yfit== 2
           disp('back')  
          
       end
      
       
       end
       
       
   end
      disp('Rest')
end