%% UserInterface 
% Program asks user to input a listed stock to analyze and returns
% historical trends present in the stock performance. The long term trend
% of the market is also stated, which is based on the momentum of the
% stock over the tracked range of days. An annotated plot of the stock
% performance is also provided to further advise the user.
clear all
close all
stock = input(['Which of the following stocks would you like to analyze? (case sensitive)',...
            '\n AAL',...
            '\n IBM',...
            '\n MER',...
            '\n PFE',...
            '\n WMT',...
            '\n input: '], 's');
        
        
% 'patterns' is a n x 3 matrix. There are n entries, each with a pattern
% description (1st col), a start day (2nd col) and end day (3rd col).

forecastWindow = 30;

[patterns, momentum, patternMatches] = analyze(stock,1,forecastWindow); % calls function analyze with on the user-input stock
disp(strcat(stock,' Analysis:'))

fprintf("\n\n ----- HISTORICAL ANALYSIS & SHORT-TERM FORECAST ----- \n")

% loop to read through 'patterns' and print the identified trends with their
% start and end days
for i = 1:length(patterns)
    
    description = strcat(int2str(patterns(i,3)), int2str(patterns(i,4)));
    startDate = (patterns(i,1));
    endDate = (patterns(i,2));
 
    if i == length(patterns)
        fprintf("\n\n The following prediction is the most recent pattern recognized. Base any decisions off of this.")
    end
    
    %%Patterns: 1 is wedge/flag, 2 is an expanding triangle, 3 is no pattern
    %%Rec: 0 is Bearish, 1 is Bullish, 2 No Clear Signal
    switch description
        case "11"
            fprintf('\n A bullish falling wedge pattern exists from day %i to day %i',[startDate; endDate])
        case "21"
            fprintf('\n A bullish expanding triangle pattern exists from day %i to day %i',[startDate; endDate])
        case "10"
            fprintf('\n A bearish rising wedge pattern exists from day %i to day %i',[startDate; endDate])
        case "20"
            fprintf('\n A bearish expanding triangle pattern exists from day %i to day %i',[startDate; endDate])
        otherwise
            fprintf('\n No discernable pattern exists from day %i to day %i',[startDate; endDate])
    end
    
          
end

successRate = int32(round(mean(patternMatches) * 100));
fprintf("\n\n Using a %i trading day window following the end date of each pattern, actual trends matched predicted trends at a %i%% success rate", forecastWindow, successRate)

fprintf("\n\n Refer to the annotated graph for further consultation.")


fprintf("\n\n\n ----- LONG-TERM FORECAST ----- \n\n")

% assign elements of 'momentum' to their appropriate derivative 
firstDeriv = momentum(1);
secondDeriv = momentum(2);

% logical statements to print appropriate long-term trend
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