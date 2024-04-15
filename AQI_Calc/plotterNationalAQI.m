function plotterNationalAQI(Data)
    vec1=zeros(1,length(Data));
    vec2=zeros(1,length(Data));
    vec3=zeros(1,length(Data));
    
    for i = Data(1).year:Data(length(Data)).year %Least to greatest
        [GoodDays,ModDays,BadDays] = AvgDayFinder(Data,i);
        vec1(i-(Data(1).year-1))=GoodDays;
        vec2(i-(Data(1).year-1))=ModDays;
        vec3(i-(Data(1).year-1))=BadDays;
    end
    
    plot(Data(1).year:Data(length(Data)).year,vec1,'g-'); %National Good Days Data
    hold on;
    plot(Data(1).year:Data(length(Data)).year,vec2,'b-'); %Natianal Moderate Days Data
    hold on;
    plot(Data(1).year:Data(length(Data)).year,vec3,'r-'); %National Bad Days Data
    xticks(Data(1).year:4:Data(length(Data)).year);
    title('Average Percent of Good, Moderate, and Bad Days in the U.S');
    xlabel('Year');
    ylabel('Percentage(%)');
    legend('Good Days','Moderate Days','Bad Days');
end