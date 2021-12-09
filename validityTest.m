matches =[];
forecastWindow = 30;

%% Building pMatches matrix
dataList = ["AAL";"IBM";"MER";"PFE";"WMT"];
for i=1:length(dataList)
    [patterns, momentum,patternMatches] = analyze(dataList(i),0,forecastWindow);
    matches = [matches;patternMatches];
end


%% Hypothesis Testing
sampleMean = mean(matches); %percent
fprintf("\nMatches represents whether our prediction for each pattern matched the actual price trend over a %i trading day period following the end of the recognized pattern",forecastWindow)

% Our sample mean of matches is:
fprintf("\nOur sample mean of succussful matches when testing over a %i day period is %g",forecastWindow, round(sampleMean,2));

n = length(matches);

%stdError of the mean = StdDev of Sample mean / sqrt(n)
stdErr = std(matches)/sqrt(n);

%Testing our sample mean against the null hyptothesis that the match rate
%is 50% (equivalent to randomly guessing)
% mu is population matches mean
% One Tailed Test where H0: is mu = .50
tStat = (sampleMean - .5)/stdErr;

p = 1-tcdf(tStat,n-1);

fprintf("Using a onetailed test where the null hypothesis is that the population mean is .50,\nthe p-value of the t statistic (testing the sample matches mean against a population matches mean of .50) is: %f \n", p);

