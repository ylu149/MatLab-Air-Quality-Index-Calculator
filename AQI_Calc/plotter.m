function plotter(Data,CountyName)
%Plots the good, moderate, and bad days of the specified county
    vec1=zeros(1,length(Data));
    vec2=zeros(1,length(Data));
    vec3=zeros(1,length(Data));
    
    for i = Data(1).year:Data(length(Data)).year %Loops from the lowest to highest of each type of day
        [CMedAQI, CGoodDays, CModDays, CBadDays]=CountyAverages(Data,i,CountyName);
        vec1(i-(Data(1).year-1))=CGoodDays;
        vec2(i-(Data(1).year-1))=CModDays;
        vec3(i-(Data(1).year-1))=CBadDays;
    end
    
    plot(Data(1).year:Data(length(Data)).year,vec1,'g-'); %County's Good Days Data
    hold on;
    plot(Data(1).year:Data(length(Data)).year,vec2,'b-'); %County's Moderate Days Data
    hold on;
    plot(Data(1).year:Data(length(Data)).year,vec3,'r-'); %County's Bad Days Data
    xticks(Data(1).year:4:Data(length(Data)).year);
    title(    sprintf('%s County''s Percent of Good, Moderate, and Bad Days Over Time'...
    ,upper(CountyName)));
    xlabel('Year');
    ylabel('Percentage(%)');
    legend('Good Days','Moderate Days','Bad Days');
end