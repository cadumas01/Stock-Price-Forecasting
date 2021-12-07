%%Patterns: 1 is wedge/flag, 2 is expanding triangle, 3 is no pattern
%%Rec: 0 is Bearish, 1 is Bullish, 2 No Clear Signal

function [pattern rec] = Patterns(rtrend,strend)
    if rtrend > 0 && strend > 0
        rec = 0;
        if rtrend > strend
            pattern = 2;
        else
            pattern = 1;
        end
    elseif rtrend < 0 && strend < 0
        rec = 1;
        if rtrend > strend
            pattern = 2;
        else
            pattern = 1;
        end
    else
        rec = 2;
        pattern = 3;
    end
end