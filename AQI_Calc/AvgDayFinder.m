function [GoodDays,ModerateDays,BadDays] = AvgDayFinder(Data,year)
%Finds national Averages of good, bad, and moderate days in percentages by year
    for i = 1:length(Data)
        if Data(i).year == year
            GoodDays = (sum([Data(i).info.GoodDays])/sum([Data(i).info.DaysWithAQI])) * 100;
            ModerateDays = (sum([Data(i).info.ModerateDays])/sum([Data(i).info.DaysWithAQI])) * 100;
            BadDays = (100 - (GoodDays + ModerateDays));
            i=length(Data);
        end
    end
end