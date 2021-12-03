function [rtrend strend] = trends(dates,maxd,mind, maxp, minp)
   s = dates(1);
   e = dates(2);
   %fprintf('Beginning: %i End: %i\n',s,e)
   maxd = maxd';
   mind = mind';
   [val,i]=min(abs(maxd-s));
   mas = i;
   [val,i]=min(abs(maxd-e));
   mae = i;
   [val,i]=min(abs(mind-s));
   mis = i;
   [val,i]=min(abs(mind-e));
   mie = i;
   strend = (minp(mie)-minp(mis))/(mind(mie)-mind(mis));
   rtrend = (maxp(mae)-maxp(mas))/(maxd(mae)-maxd(mas));
end
  