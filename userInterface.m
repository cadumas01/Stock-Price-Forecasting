stock = input(['Which of the following stocks would you like to analyze? (case sensitive)',...
            '\n AAL',...
            '\n AES',...
            '\n AMZN',...
            '\n IBM',...
            '\n MER',...
            '\n PFE',...
            '\n WMT',...
            '\n input: '], 's');
        
        
% patterns is a n by 3 matrix. There are n entries, each with pattern
% description (1st col), a start date (2nd col) and end date (3rd col)

% patterns = analyze(stock);
disp(strcat(stock,' Analysis:'))
BuFP = 23;
BeRW = 4;

patterns = ["BuFP", 4, 30; "BuFW", 50, 70; "BeRW", 80, 130]

for i = 1:length(patterns)
    description = patterns(i,1);
    startDate = str2num(patterns(i,2));
    endDate = str2num(patterns(i,3));
 
    if i == length(patterns)
        print("\n\n This is the final pattern recognized. Base any decisions off of this")
    end
    
    switch description
        case "BuFP"
            fprintf('A bullish flag pattern exists from %f to %f',[startDate; endDate])
        case "BuPP"
            fprintf('A bullish pennant pattern exists from %f to %f',[startDate; endDate])
        case "BuFW"
            fprintf('A bullish falling wedge exists from %f to %f',[startDate; endDate])
        case 'BeFP'
            fprintf('A bearish flag pattern exists from %f to %f',[startDate; endDate])
        case 'BePP'
            fprintf('A bearish pennant pattern exists from %f to %f',[startDate; endDate])
        case 'BeRW'
            fprintf('A bearish rising wedge exists from %f to %f',[startDate; endDate])
    end
    
          
end


% if exist('BuFP','var') == 1
%         disp('A bullish flag pattern exists from 1stDateInRange to LastDateInRange')
%     end
%     if exist('BuPP','var') == 1
%         disp('A bullish pennant pattern exists from 1stDateInRange to LastDateInRange')
%     end
%     if exist('BuFW','var') == 1
%         disp('A bullish falling wedge exists from 1stDateInRange to LastDateInRange')
%     end
%     if exist('BeFP','var') == 1
%         disp('A bearish flag pattern exists from 1stDateInRange to LastDateInRange')
%     end
%     if exist('BePP','var') == 1
%         disp('A bearish pennant pattern exists from 1stDateInRange to LastDateInRange')
%     end
%     if exist('BeRW','var') == 1
%         disp('A bearish rising wedge exists from 1stDateInRange to LastDateInRange')
%     end

