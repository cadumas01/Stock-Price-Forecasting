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

    k1 = fix(length(data)/20);    
    movAvg = movmean(price,k1);

    
    %% Caluclate Mins and Max of Moving Avg - maybe delete
    % [maximaMovAvg, maxMovAvgDate, minimaMovAvg, minMovAvgDate] = maxes_mins(date,movAvg);
    
 
    
    %% Running Regressions
    %regMovAvgMax1 = fitlm(maxMovAvgDate,maximaMovAvg);
    regMax = fitlm(maxDate, maxima);
 
    
    
    %% Plot Data
    figure
    plot(date,price)
    hold on
    
    plot(maxDate,maxima,'-og')
    plot(minDate,minima,'-or') 
    
    
   plot(regMax)
    
    %plot(date,movAvg,'m')
    
   % plot(maxMovAvgDate,maximaMovAvg,'^g')
   % plot(regMovAvgMax1);
   
   % plot(minMovAvgDate,minimaMovAvg,'^r')
   
   
    
    title(fileName)
    xlabel('Date')
    ylabel('Price')
    
    [rToS, sToR] = floorCeilingCut(price, date, maxDate, maxima, minDate, minima)
    p = 6
    minima(p) > maxima
    minima(p)
    maxima 
    
    q = 4
    maxima(q) < minima
    maxima(q)
    minima 
end

% If the new floor is equal to the old ceiling (within a interval),
% Then cut the data into two sections
% rToS is resistence to support dates
% sToR is support to resistence dates
function [rToS, sToR] = floorCeilingCut(price, date, maxDate, maxima, minDate, minima)

    rToS = [1 ];
    sToR = [2];
    
    for i = 1: length(minDate) %maybe refactor to start at first date and just go to endDate
        if minima(i) > maxima 
            rToS = [rToS; minDate(i)];
        end
    end
    
    
    
end
