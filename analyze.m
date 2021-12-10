% Modified version of main. Eliminates code duplication. Make sure to pass
% fileName as a string (in quotes)
% Ex: >> analyze("PFE")
function [patterns, momentum,patternMatches] =  analyze(fileName,displayGraphs,forecastWindow)
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
    
    p = polyfit(movAvgX,movAvg,2);
    f = @(x) (p(1)*x.^2 + p(2)*x + p(3));
    
    
    syms x
    f2 = p(1)*x.^2 + p(2)*x + p(3);
    firstDerivSym = (diff(f2));
    firstDerivNum = double(vpa(subs(firstDerivSym,x,length(date))));
    secondDerivSym = (diff(f2,2)); 
    secondDerivNum = double(vpa(subs(secondDerivSym,x,length(date))));
    momentum = [firstDerivNum secondDerivNum];
   
    %% Detect Patterns
    [rToS, sToR] = floorCeilingCut(min,max);
    
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
    
   %% Testing Validity of Patterns 
   % forecastWindow trading day interval after the pattern is realized
   
   h = 1;
   if(forecastWindow > 30)
       h = 2;
   end
   
   patternMatches = zeros(length(patterns)-h,1);
   for i=1:length(patterns)-1 %Don't test whether final prediction matches (not enough data)
       sDate = patterns(i,2);
       sIndex = find(date==sDate);
       l = polyfit(date(sIndex:sIndex+forecastWindow), price(sIndex:sIndex+forecastWindow),1)
       
       if (patterns(i,4) == 1 && l(1) > 0) || (patterns(i,4) == 0 && l(1) < 0)
           patternMatches(i) = 1;
       end
   end
   
    
   %% Plotting
     if(displayGraphs == 1)
        %plotting forecastWindow 
        figure(1)
        plot(movAvg)
        hold on

        %momentum
        plot(f(movAvgX))
        title('Momentum Visualization')
        xlabel('Time (Ordinal Day)')
        ylabel('Price ($)')
        legend('Moving Average (180 days)','Best Fit Curve','Location','southeast') 

        hold off
        %regular price data
        figure(2)
        plot(date,price)
        hold on

        %mins and maxes
        plot(maxDate,maxima,'-og')
%         hold on
        plot(minDate,minima,'-or') 

        title(fileName)
        xlabel('Time (days)')
        ylabel('Price ($)')
        
%         hold on
        %support and resitence
        plot(linesm(:,1),linesm(:,2),'k-','LineWidth',1);
%         hold on
        plot(linesmi(:,1),linesmi(:,2),'k-','LineWidth',1);
        legend("Price","Resistence","Support","Pattern Bounds")
        hold off
     end
end
