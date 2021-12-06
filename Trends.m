%%
%Finds the nearest max or min to the trend reversal by minimizing the
%difference from the date. We then find the slope of the trend lines and
%output

function [rtrend strend linem linemi] = trends(dates, maxd, mind, maxp, minp)
   s = dates(1);
   e = dates(2);
   maxd = maxd';
   mind = mind';
   [~,i] = min(abs(maxd-s));
   mas = i;
   [~,i] = min(abs(maxd-e));
   mae = i;
   [~,i] = min(abs(mind-s));
   mis = i;
   [~,i] = min(abs(mind-e));
   mie = i;
   strend = (minp(mie) - minp(mis))/(mind(mie) - mind(mis));
   rtrend = (maxp(mae) - maxp(mas))/(maxd(mae) - maxd(mas));
   linem = [maxd(mas) maxp(mas); maxd(mae) maxp(mae)];
   linemi = [mind(mis) minp(mis); mind(mie) minp(mie)];
end
  