function [rToS, sToR] = compressFloorCeiling(rToS, sToR)
    
    rToSindex = 1;
    sToRindex = 1;
    
    while rToSindex < length(rToS)
         % if the next rToS is still before the next current sToR
         fprintf("Here is rToSindex")
        if rToS(rToSindex,1) < sToR(sToRindex, 1) && rToS(rToSindex + 1,1) < sToR(sToRindex, 1)
            rToS(rToSindex + 1,:) = [] % remove the next rToS 
        else
            rToSindex = rToSindex + 1;
            sToRindex = sToRindex + 1;
        end
    end 
end