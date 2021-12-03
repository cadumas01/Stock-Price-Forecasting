function [dates] = identify(stor,rtos)
    cha = [stor ; rtos];
    [~,i] = sort(cha(:,1));
    cha = cha(i,:);
    dates = zeros(length(cha(:,1))/2,2);
    i = 1;
    j = 1;
    while i < length(cha)
        dates(j,1) = cha(i,1);
        dates(j,2) = cha(i+1,1);
        i = i + 2;
        j = j + 1;
    end
end


        
    
        
        