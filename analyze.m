% Modified version of main. Eliminates code dupllication. Make sure to pass
% fileName as a string (in quotes)
% Ex: >> analyze("PFE")
function analyze(fileName)
    %% Read in Data
    data = excelReader(fileName);
   
    %% Calculate Mins and Maxes of Price
    date = data(:,1);
    price = data(:,2);
    [maxima, maxDate, minima, minDate] = maxes_mins(date, price);
  
    
    %% Calculate Moving Average
    %k pt. movinge means

    k = fix(length(data)/20);    
    movAvg = movmean(price,k);

    
    %% Caluclate Mins and Max of Moving Avg 
    [maximaMovAvg, maxMovAvgDate, minimaMovAvg, minMovAvgDate] = maxes_mins(date,movAvg);
    
    %% Running Regressions
    regMovAvgMax1 = fitlm(maxMovAvgDate,maximaMovAvg);
    
    %% Plot Data
    figure
    plot(date,price)
    hold on
   % plot(maxDate,maxima,'og') % disabled low scale extrema for now
    %plot(minDate,minima,'or') % disabled 
    
    plot(date,movAvg,'m')
    
    plot(maxMovAvgDate,maximaMovAvg,'^g')
    plot(regMovAvgMax1);
    
    
    plot(minMovAvgDate,minimaMovAvg,'^r')
    
    title(fileName)
    xlabel('Date')
    ylabel('Price')
end

% If the new floor is equal to the old ceiling (within a interval),
% Then cut the data into two sections
function [x,y] = floorCeilingCut(x,y)
%Add code here
end
