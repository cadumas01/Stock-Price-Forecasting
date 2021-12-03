stock = input(['Which of the following stocks would you like to analyze? (case sensitive)',...
            '\n AAL',...
            '\n AES',...
            '\n AMZN',...
            '\n IBM',...
            '\n MER',...
            '\n PFE',...
            '\n WMT',...
            '\n input: '], 's');
%analyze(stock);
disp(strcat(stock,' Analysis:'))
BuFP = 23;
BeRW = 4;
if exist('BuFP','var') == 1
    disp('A bullish flag pattern exists from 1stDateInRange to LastDateInRange')
end
if exist('BuPP','var') == 1
    disp('A bullish pennant pattern exists from 1stDateInRange to LastDateInRange')
end
if exist('BuFW','var') == 1
    disp('A bullish falling wedge exists from 1stDateInRange to LastDateInRange')
end
if exist('BeFP','var') == 1
    disp('A bearish flag pattern exists from 1stDateInRange to LastDateInRange')
end
if exist('BePP','var') == 1
    disp('A bearish pennant pattern exists from 1stDateInRange to LastDateInRange')
end
if exist('BeRW','var') == 1
    disp('A bearish rising wedge exists from 1stDateInRange to LastDateInRange')
end