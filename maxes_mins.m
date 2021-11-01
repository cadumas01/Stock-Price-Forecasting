function [maxima, maxDate, minima, minDate] = maxes_mins(x,y)

    %% Find Local Mins and Maxes
    % run to plot local mins and maxes on stock plot
    [maxima,maxIdx] = findpeaks(y);
    [minima,minIdx] = findpeaks(-y);
    minima = minima * -1;

    maxDate = alignByX(x,maxIdx);
    minDate = alignByX(x,minIdx);

    %Aligns matrix m with Dates of m's parent matrix
    function [mDate] = alignByX(x,mIdx)
        len = length(mIdx);
        mDate = zeros(len,1);
        for i = (1:len)
            mDate(i) = x(mIdx(i));
        end
    end

end