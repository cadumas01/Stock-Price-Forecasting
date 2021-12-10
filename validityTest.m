%% Hypothesis Testing for pMatches
close all
forecastWindow = 30;
[sampleMean, pValue] = pMatchTest(forecastWindow);

fprintf("\nMatches represents whether our prediction for each pattern matched the actual price trend over a %i trading day period following the end of the recognized pattern",forecastWindow)

% Our sample mean of matches is:
fprintf("\nOur sample mean of succussful matches when testing over a %i day period is %g",forecastWindow, round(sampleMean,2));



fprintf("Using a onetailed test where the null hypothesis is that the population mean is .50,\nthe p-value of the t statistic (testing the sample matches mean against a population matches mean of .50) is: %f \n", pValue);

%pMatch Rate vs forecastWindow, k

ks = 1:1:40;
pMatchResults = zeros(length(ks),3);

for i=1:length(ks)
    [sampleMean, pValue] = pMatchTest(ks(i));
    pMatchResults(i,:) = [ks(i), sampleMean, pValue]
end
    
%Plotting
hold on
figure
scatter(ks,pMatchResults(:,2),30,pMatchResults(:,3),'filled')
title('P-Value and Sample Mean vs Forecast Window')
xlabel('Forecast Window (days from end of recognized pattern')
ylabel('Sample Mean (With colored P-Values, darker is better)')
c = colorbar;
xlim([0 45])
ylim([0 1])

hold on 
yline(.5,'--')

%zlabel('P- Value')
colorbar
hold off



%% pMatch Test

function [sampleMean, pValue] =  pMatchTest(forecastWindow)
    matches =[];

    % Building pMatches matrix
    dataList = ["AAL";"IBM";"MER";"PFE";"WMT"];
    for i=1:length(dataList)
        [patterns, momentum,patternMatches] = analyze(dataList(i),0,forecastWindow);
        matches = [matches;patternMatches];
    end
    
    n = length(matches)
    sampleMean = mean(matches);
    
    %stdError of the mean = StdDev of Sample mean / sqrt(n)
    stdErr = std(matches)/sqrt(n);

    %Testing our sample mean against the null hyptothesis that the match rate
    %is 50% (equivalent to randomly guessing)
    % mu is population matches mean
    % One Tailed Test where H0: is mu = .50
    tStat = (sampleMean - .5)/stdErr;

    pValue = 1-tcdf(tStat,n-1);
end 


