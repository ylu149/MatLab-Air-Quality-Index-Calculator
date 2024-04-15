function [CMedAQI, CGoodDays, CModDays, CBadDays] = CountyAverages(Data,year,CountyName)
%Returns the good, bad, and moderate day percentage by year and county name
[row,temp]=RowFinder(Data,CountyName,year);

CMedAQI=Data(temp).info(row).MedianAQI;
CGoodDays=(Data(temp).info(row).GoodDays/Data(temp).info(row).DaysWithAQI)*100;
CModDays=(Data(temp).info(row).ModerateDays/Data(temp).info(row).DaysWithAQI)*100;
CBadDays=100-(CGoodDays+CModDays);

end
