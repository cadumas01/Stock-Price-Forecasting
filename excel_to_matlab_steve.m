%% Read in Data
%Run the script and it will pull all the data into matricies. The dates
%have to use excel # dates, so must be converted into matlab format. 

pfe = xlsread('PFE');
pfe(:,1) = x2mdate(pfe(:,1));

aes = xlsread('AES');
aes(:,1) = x2mdate(aes(:,1));

mer = xlsread('MER');
mer(:,1) = x2mdate(mer(:,1));

aal = xlsread('AAL');
aal(:,1) = x2mdate(aal(:,1)); 
%% Find Local Mins and Maxes
% run to plot local mins and maxes on stock plot
data = pfe; % assign stock to 'data'
[Maxima,MaxIdx] = findpeaks(data);
[Minima,MinIdx] = findpeaks(-data);
Minima = Minima * -1;
figure
plot(data)
hold on
plot(MaxIdx,Maxima,'og')
plot(MinIdx,Minima,'or')

