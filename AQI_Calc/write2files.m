function write2files(AvgMAQI,CGD,CBD,CMD,NGD,NMD,NBD,CountyName,year,Data)
%Function writes data of specific county to a .txt file 
fid = fopen('AQI_Info.txt','w'); %opens a text file AQI_Info.txt

%Prints National AQI info to file
fprintf(fid,'The average National Median AQI in %d is: %.2f\n',year,AvgMAQI);  
fprintf(fid,'The average National Good Days in %d is: %%%.2f\n',year,NGD);
fprintf(fid,'The average National Median Days in %d is: %%%.2f\n',year,NMD);
fprintf(fid,'The average National Bad Days in %d is: %%%.2f\n\n',year,NBD);

%Prints County AQI info to file
fprintf(fid,'%s County''s Median AQI in %d is: %.2f\n',upper(CountyName),year,AvgMAQI);  
fprintf(fid,'The average %s County''s Good Days in %d is: %%%.2f\n',upper(CountyName),year,CGD);
fprintf(fid,'The average %s County''s Median Days in %d is: %%%.2f\n',upper(CountyName),year,CBD);
fprintf(fid,'The average %s County''s Bad Days in %d is: %%%.2f\n',upper(CountyName),year,CMD);
fclose(fid);
end