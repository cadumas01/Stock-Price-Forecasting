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

% [patterns, momentum] = analyze(stock);
disp(strcat(stock,' Analysis:'))
BuFP = 23;
BeRW = 4;

patterns = ["BuFP", 4, 30; "BuFW", 50, 70; "BeRW", 80, 130];
momentum = [3, -1];

fprintf("\n\n ----- HISTORICAL ANALYSIS & SHORT-TERM FORECAST ----- \n")

for i = 1:length(patterns)
    description = patterns(i,1);
    startDate = str2num(patterns(i,2));
    endDate = str2num(patterns(i,3));
 
    if i == length(patterns)
        fprintf("\n\n The following prediction the most recent pattern recognized. Base any decisions off of this.")
    end
    
    switch description
        case "BuFP"
            fprintf('\n A bullish flag pattern exists from day %i to day %i',[startDate; endDate])
        case "BuPP"
            fprintf('\n A bullish pennant pattern exists from day %i to day %i',[startDate; endDate])
        case "BuFW"
            fprintf('\n A bullish falling wedge exists from day %i to day %i',[startDate; endDate])
        case 'BeFP'
            fprintf('\n A bearish flag pattern exists from day %i to day %i',[startDate; endDate])
        case 'BePP'
            fprintf('\n A bearish pennant pattern exists from day %i to day %i',[startDate; endDate])
        case 'BeRW'
            fprintf('\n A bearish rising wedge exists from day %i to day %i',[startDate; endDate])
    end
    
          
end


fprintf("\n\n Refer to the annotated graph for further consultation.")


fprintf("\n\n\n ----- LONG-TERM FORECAST ----- \n\n")

firstDeriv = momentum(1);
secondDeriv = momentum(2);

if firstDeriv > 0
    if secondDeriv > 0 
        fprintf(" There is increasingly positive momentum. This is a long-term bullish signal.\n")
    else
        fprintf(" There is decreasingly positive momentum. This is a long-term bullish signal, however this may indicate prices are beginning to reach ceiling.\n")
    end
else
     if secondDeriv > 0 
        fprintf(" There is decreasingly negative momentum. This is a long-term bearish signal, however this may indicate prices are beginning to reach floor.\n")
    else
        fprintf(" There is increasingly negative momentum. This is a long-term bearish signal.\n")
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

