function value = ReadFiles(loopvalmin)
%Reads the data and returns the desired values as a structure

clc;
%initializes values that will be looped through
loopvalmax=2018;

%Giving the user an update
fprintf('Please wait for data to be loaded\n');
fprintf('_________________________________\n\n');

%Opening the data and loading only the wanted information into a nested
%structure
for i=loopvalmax:-1:loopvalmin
    
    %Defining the file that will be opened and loading them into a table
    filename=sprintf('annual_aqi_by_county_');
    str2=num2str(i);
    filename=strcat(filename,str2);
    filename=strcat(filename,'.csv');
    
    %Updating user on the progress
    fprintf('Loading: %s\n',filename);
    temp=readtable(filename);
    temp=table2cell(temp);
    pause(1);
    %Loading only the desired information row by row into a strucuture
    [r, c] = size(temp);
    clear c;
    for j=r:-1:1
        row(j)=struct('County',temp(j,2),'DaysWithAQI',temp(j,4),...
        'GoodDays',temp(j,5),'ModerateDays',temp(j,6),'MaxAQI',temp(j,11),...
        'MedianAQI',temp(j,13));
    end
    
    %storing the structure of rows into another structure
    Data(i-(loopvalmin-1))=struct('year',i,'info',row);
    
    %Clearing unnecessary variables.
    
    clear rows;
    clear temp;
end

%Clearing the command window and updating the user on the progress
clc;
fprintf('Files have finished uploading\n');
value = Data;
end