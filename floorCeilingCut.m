% If the new floor is equal to the old ceiling (within a interval),
% Then cut the data into two sections
% rToS is resistence to support dates
% sToR is support to resistence dates
function [rToS, sToR] = floorCeilingCut(data,min,max)

    rToS = [];
    sToR = [];
    
    
    %% This section identifies changes in resistence to support
    % A break point is a point where a new minimum has a greater value than a
    % previous maximum or where a new maximum has a lower value than a
    % previous minimum.
    %A moving range along the max points is kept
    %Each min Point is compared to the front max point (greatest date) in
    %this range and then the next point and so on until the back point is
    %reached. The back point is the previously identified break point. This
    %moving back index prevents preveious maximums from triggering multiple
    %later minimums as break points
    maxIndexFront = 1
    maxIndexBack = 1
    
    minIndex = 1
    
    while minIndex <= length(min)
        if min(minIndex, 1) > max(maxIndexFront,1) 
            %the current min point is ahead of the front max point, thus 
            % there is a possible break point
            
            %Iterate through the potential range of maximums 
            % that our current minimum could be greater than;
            % this range of maximums may not be before a previously
            % identified break point.
            for i = maxIndexFront:-1:maxIndexBack 
                if min(minIndex, 2) > max(i, 2) 
                    % A break point has been identified, add this minimum
                    % to the list of resistence to support points
                    rToS = [rToS; min(minIndex,1), min(minIndex,2)]
                    
                    % The back index (the oldest maximum that is a
                    % contender for the next breakpoint) is now the next
                    % maximum after the one just identified.
                    maxIndexBack = i + 1;
                    break;
                end 
            end
            %Iterate the front index forward
            maxIndexFront = maxIndexFront + 1
        else % if the current minDate is behind the front maxDate 
            % then increase minIndex
          minIndex = minIndex + 1;
        end
    end
    
    
    
    
    %% This section identifies changes in support to resistence 
    minIndexFront = 1
    minIndexBack = 1
    
    maxIndex = 1
    
    while maxIndex <= length(max)
        if min(maxIndex, 1) > max(minIndexFront,1) 
            %the current max point is ahead of the front min point, thus 
            % there is a possible break point
            
            %Iterate through the potential range of minmums 
            % that our current maximum could be less than;
            % this range of minimums may not be before a previously
            % identified break point.
            for i = minIndexFront:-1:minIndexBack 
                if max(maxIndex, 2) < min(i, 2) 
                    % A break point has been identified, add this maximum
                    % to the list of support to resistence 
                    sToR = [sToR; max(maxIndex,1), max(maxIndex,2)]
                    
                    % The back index (the earliest minimum that is a
                    % contender for the next breakpoint) is now the next
                    % minimum after the one just identified.
                    minIndexBack = i + 1;
                    break;
                end 
            end
            %Iterate the front index forward
            minIndexFront = minIndexFront + 1
        else 
          maxIndex = maxIndex + 1;
        end
    end
    
    
    
end
