function [dates] = identify(stor,rtos)
    cha = [stor ; rtos];
    [~,i] = sort(cha(:,1));
    cha = cha(i,:);
    dates = zeros(2,length(cha/2));
    while i < length(cha)
        dates(i,1) = cha(i,1);
        dates(i+1,2) = cha(i+1,1);
        i = i + 2;
    end
end

function [trends trendr] = trends(dates,max,min)
        
    
        
        