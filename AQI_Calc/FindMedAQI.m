function AverageMedAQI = FindMedAQI(Data,year)
%Returns the national AQI average by year
    for i = 1:length(Data)
        if Data(i).year == year
            AverageMedAQI = (mean([Data(i).info.MedianAQI]));%Calculates the AQI
            i = length(Data);
        end
    end
end