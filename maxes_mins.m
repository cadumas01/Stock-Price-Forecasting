function [maxima, maxIdx, minima, minIdx] = maxes_mins(data)

%% Find Local Mins and Maxes
% run to plot local mins and maxes on stock plot
[maxima,maxIdx] = findpeaks(data);
[minima,minIdx] = findpeaks(-data);
minima = minima * -1;

end