% Modified version of main. Eliminates code duplication. Make sure to pass
% fileName as a string (in quotes)
% Ex: >> analyze("PFE")
function [patterns, momentum] =  analyze(fileName)
    %% Read in Data
    data = excelReader(fileName);
   
    %% Calculate Mins and Maxes of Price
    date = data(:,1);
    date = date - date(1); 
    price = data(:,2);
    [maxima, maxDate, minima, minDate] = maxes_mins(date, price);
    max = [maxDate, maxima];
    min =[minDate, minima];
  
    
    %% Calculate Moving Average and Momentum

    k1 = 180;
    movAvg = movmean(price,k1);
    movAvgX = (1:length(movAvg));
    plot(movAvg)
    figure(1)
    hold on
    p = polyfit(movAvgX,movAvg,2);
    f = @(x) (p(1)*x.^2 + p(2)*x + p(3));
    plot(f(movAvgX))
    title('Momentum Visualization')
    xlabel('Time (days)')
    ylabel('Price ($)')
    legend('Moving Average (180 days)','Best Fit Curve')
    
    hold off
    syms x
    f2 = p(1)*x.^2 + p(2)*x + p(3);
    firstDerivSym = (diff(f2));
    firstDerivNum = double(vpa(subs(firstDerivSym,x,length(date))));
    secondDerivSym = (diff(f2,2)); 
    secondDerivNum = double(vpa(subs(secondDerivSym,x,length(date))));
    momentum = [firstDerivNum secondDerivNum];
    
 
    %% Plot Data
    figure(2)
    plot(date,price)
    hold on
    
    plot(maxDate,maxima,'-og')
    plot(minDate,minima,'-or') 
    
    title(fileName)
    xlabel('Time (days)')
    ylabel('Price ($)')
    
    [rToS, sToR] = floorCeilingCut(min,max);
    
    %% Detect Patterns
    [dates] = patternDetect(sToR,rToS);
    patterns = zeros(length(dates(:,1)),4);
    linesm = [];
    linesmi = [];
    for i = 1:length(dates(:,1))
        [rtrend, strend, linem, linemi] = Trends(dates(i,:),maxDate,minDate,maxima,minima);
        [pattern, rec] = Patterns(rtrend, strend);
        linesm = [linesm;linem];
        linesmi = [linesmi;linemi];
        patterns(i,:) = [dates(i,:) pattern rec];
    end
    plot(linesm(:,1),linesm(:,2),'k-','LineWidth',1);
    plot(linesmi(:,1),linesmi(:,2),'k-','LineWidth',1);
    legend("Price","Resistence","Support","Pattern Bounds")
end
