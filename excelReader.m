function data = excelReader(fileName)
    data = xlsread(strcat('DATA\', fileName));
    data(:,1) = x2mdate(data(:,1));
end