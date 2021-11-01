% Modified version of main. Eliminates code dupllication. Make sure to pass
% fileName as a string (in quotes)
% Ex: >> analyze("PFE")
function analyze(fileName)
    %% Read in Data
    data = excelReader(fileName);
   
    %% Calculate Mins and Maxes
    date = data(:,1);
    price = data(:,2);
    [maxima, maxIdx, minima, minIdx] = maxes_mins(price);
    
    maxDate = [];
    for i = (1:length(maxIdx))
        maxDate(i) = date(maxIdx(i));
    end
    
    minDate = [];
    for i = (1:length(minIdx))
        minDate(i) = date(minIdx(i));
    end

    %% Setting up Moving Averages
    %k pt. movinge means

    k = fix(length(data)/25);    
    movingAvg = movmean(price,k);

    %% Plot Data
    figure
    plot(date,price)
    hold on
    plot(maxDate,maxima,'og')
    plot(minDate,minima,'or')
    plot(date,movingAvg,'p')
    title(fileName)
    xlabel('Date')
    ylabel('Price')
end

