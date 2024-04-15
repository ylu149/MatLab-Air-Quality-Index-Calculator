function PlotterAQI(Data,CountyName)
%
vec1=zeros(1,length(Data));
vec2=zeros(1,length(Data));
    for i = Data(1).year:Data(length(Data)).year %Least to greatest of AQI quantity
        vec1(i-(Data(1).year-1)) = FindMedAQI(Data,i);
        [RowLocation,RowData] = RowFinder(Data, CountyName,i);
        vec2(i-(Data(1).year-1)) = Data(RowData).info(RowLocation).MedianAQI;
    end
plot(Data(1).year:Data(length(Data)).year,vec1); % Plots National AQI Data
hold on;
plot(Data(1).year:Data(length(Data)).year,vec2); % Plots County AQI data
title(sprintf('%s County AQI vs Average National AQI',upper(CountyName)));
xlabel('Years');
ylabel('AQI');
xticks(Data(1).year:4:Data(length(Data)).year);
legend('National U.S.A AQI',sprintf('%s AQI',upper(CountyName)));
end