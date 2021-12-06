function [rtrend strend linem, linemi] = trends(dates,maxd,mind, maxp, minp)
   s = dates(1);
   e = dates(2);
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
   fprintf("\n Here is mie: %i | here is mis: %i ", mie, mis)
   strend = (minp(mie)-minp(mis))/(mind(mie)-mind(mis));
   rtrend = (maxp(mae)-maxp(mas))/(maxd(mae)-maxd(mas));
   linem = [maxd(mas) maxp(mas); maxd(mae) maxp(mae)];
   linemi = [mind(mis) minp(mis); mind(mie) minp(mie)];
end
  