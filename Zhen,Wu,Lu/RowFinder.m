function [RowLocation,RowData] = RowFinder(Data, CountyName,year) 
%Returns the location of a term by searching through county name
CountyName=string(lower(CountyName)); 
row=0;
for i = 1:length(Data)
        if Data(i).year == year
            temp=i;
            i=length(Data);
        end
end
RowData=temp;
[x, y]=size(Data(temp).info);
clear x;
for k = 1:y
    if(CountyName==string(lower(Data(temp).info(k).County)))
        row=k;
        k=y;
    end
end
RowLocation = row;
end