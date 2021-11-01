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
    
    maxDate = alignByDate(date,maxIdx);
    minDate = alignByDate(date,minIdx);
   
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

%Aligns matrix m with Dates of m's parent matrix
function [mDate] = alignByDate(date,mIdx)
    len = length(mIdx);
    mDate = zeros(len,1);
    for i = (1:len)
        mDate(i) = date(mIdx(i));
    end
end