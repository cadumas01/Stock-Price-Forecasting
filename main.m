pfe = excelReader("PFE");
[maxima, maxIdx, minima, minIdx] = maxes_mins(pfe);

figure
plot(data)
hold on
plot(maxIdx,maxima,'og')
plot(minIdx,minima,'or')
