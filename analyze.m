% Modified version of main. Eliminates code duplication. Make sure to pass
% fileName as a string (in quotes)
% Ex: >> analyze("PFE")
function analyze(fileName)
    %% Read in Data
    data = excelReader(fileName);
   
    %% Calculate Mins and Maxes of Price
    date = data(:,1);
    date = date - date(1); 
    price = data(:,2);
    [maxima, maxDate, minima, minDate] = maxes_mins(date, price);
    max = [maxDate, maxima];
    min =[minDate, minima];
  
    
    %% Calculate Moving Average
    %k pt. movinge means

    k1 = fix(length(data)/20);    
    movAvg = movmean(price,k1);
    movAvgX = (1:length(movAvg));
    plot(movAvg)
    hold on
    p = polyfit(movAvgX,movAvg,1);
    f = @(x) (p(1)*x + p(2));
    plot(f(movAvgX))
    title('Trendline: Slope = Momentum')
    hold off
    
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
    
    [rToS, sToR] = floorCeilingCut(date,min,max)
    
    
end
