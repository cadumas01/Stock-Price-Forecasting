clear all

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

[patterns, momentum] = analyze(stock);
disp(strcat(stock,' Analysis:'))

fprintf("\n\n ----- HISTORICAL ANALYSIS & SHORT-TERM FORECAST ----- \n")

for i = 1:length(patterns)
    
    description = strcat(int2str(patterns(i,3)), int2str(patterns(i,4)));
    startDate = (patterns(i,1));
    endDate = (patterns(i,2));
 
    if i == length(patterns)
        fprintf("\n\n The following prediction the most recent pattern recognized. Base any decisions off of this.")
    end
    
    %%Patterns: 1 is wedge/flag, 2 is expanding triangle, 3 is no pattern
    %%Rec: 0 is Bearish, 1 is Bullish, 2 No Clear Signal
    switch description
        case "11"
            fprintf('\n A bullish flag pattern exists from day %i to day %i',[startDate; endDate])
        case "21"
            fprintf('\n A bullish expanding triangle pattern exists from day %i to day %i',[startDate; endDate])
        case "10"
            fprintf('\n A bearish flag pattern exists from day %i to day %i',[startDate; endDate])
        case "20"
            fprintf('\n A bearish expanding triangle pattern exists from day %i to day %i',[startDate; endDate])
        otherwise
            fprintf('\n No discernable pattern exists from day %i to day %i',[startDate; endDate])
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

