%Run the script and it will pull all the data into matricies. The dates
%have to use excel # dates, so must be converted into matlab format. 

pfe = xlsread('DATA\PFE');
pfe(:,1) = x2mdate(pfe(:,1));

aes = xlsread('DATA\AES');
aes(:,1) = x2mdate(aes(:,1));

mer = xlsread('DATA\MER');
mer(:,1) = x2mdate(mer(:,1));


aal = xlsread('DATA\AAL');
aal(:,1) = x2mdate(aal(:,1))

