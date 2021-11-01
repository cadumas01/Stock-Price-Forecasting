%% Read in Data
pfe = excelReader("PFE");
mer = excelReader("MER"); % issue with mer data, dates overlap after price drops from 90 % I cut MERdata after the issue - Cole
aes = excelReader("AES");
%aal = excelReader("AAL"); % commented out temporarily;
aal = ones(5,2);

%% Calculate Mins and Maxes
pfeDate = pfe(:,1);
pfePrice = pfe(:,2);
[maximaPfe, maxIdxPfe, minimaPfe, minIdxPfe] = maxes_mins(pfePrice);
pfeMaxDate = [];

for i = (1:length(maxIdxPfe))
    pfeMaxDate(i) = pfeDate(maxIdxPfe(i));
end
pfeMinDate = [];
for i = (1:length(minIdxPfe))
    pfeMinDate(i) = pfeDate(minIdxPfe(i));
end

merDate = mer(:,1);
merPrice = mer(:,2);
[maximaMer, maxIdxMer, minimaMer, minIdxMer] = maxes_mins(merPrice);
merMaxDate = [];
for i = (1:length(maxIdxMer))
    merMaxDate(i) = merDate(maxIdxMer(i));
end
merMinDate = [];
for i = (1:length(minIdxMer))
    merMinDate(i) = merDate(minIdxMer(i));
end

aesDate = aes(:,1);
aesPrice = aes(:,2);
[maximaAes, maxIdxAes, minimaAes, minIdxAes] = maxes_mins(aesPrice);
aesMaxDate = [];
for i = (1:length(maxIdxAes))
    aesMaxDate(i) = aesDate(maxIdxAes(i));
end
aesMinDate = [];
for i = (1:length(minIdxAes))
    aesMinDate(i) = aesDate(minIdxAes(i));
end

aalDate = aal(:,1);
aalPrice = aal(:,2);
[maximaAal, maxIdxAal, minimaAal, minIdxAal] = maxes_mins(aalPrice);
aalMaxDate = [];

for i = (1:length(maxIdxAal))
    aalMaxDate(i) = aalDate(maxIdxAal(i));
end
aalMinDate = [];
for i = (1:length(minIdxAal))
    aalMinDate(i) = aalDate(minIdxAal(i));
end

%% Setting up Moving Averages
%k pt. movinge means

k1 = 10;
k2 = 20; %pfe has approx double the data points as the others
pfeMovingAvg = movmean(pfePrice,k2);
merMovingAvg = movmean(merPrice,k1);
aesMovingAvg = movmean(aesPrice,k1);
aalMovingAvg = movmean(aalPrice,k1);



%% Plot Data
figure
plot(pfeDate,pfePrice)
hold on
plot(pfeMaxDate,maximaPfe,'og')
plot(pfeMinDate,minimaPfe,'or')
plot(pfeDate,pfeMovingAvg,'p')
title('PFE')
xlabel('Date')
ylabel('Price')

figure
plot(merDate,merPrice)
hold on
plot(merMaxDate,maximaMer,'og')
plot(merMinDate,minimaMer,'or')
plot(merDate,merMovingAvg,'p')
title('MER')
xlabel('Date')
ylabel('Price')

figure
plot(aesDate,aesPrice)
hold on
plot(aesMaxDate,maximaAes,'og')
plot(aesMinDate,minimaAes,'or')
plot(aesDate,aesMovingAvg,'p')
title('AES')
xlabel('Date')
ylabel('Price')

%{
figure
plot(aalDate,aalPrice)
hold on
plot(aalMaxDate,maximaAal,'og')
plot(aalMinDate,minimaAal,'or')
title('AAL')
xlabel('Date')
ylabel('Price') 

%}

