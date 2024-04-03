% (1)File format: tif
% (2)Naming rule: SM_Ascending/Descending_YYYYMMDD.tif (eg: SM_D_20160906.tif)
% (3)Spatial resolution: 1km (about 0.0089831528 degree)
% (4)Columns and rows: 40074 and 20036
% (5)Coordinate system: D_WGS_1984 (EPSG:4326)
% (6)Extent: Top 89.9887335867, Left -179.990941903, Right 179.990941903, Bottom -89.9887335867
% (7)Pixel_Type: signed integer (16Bit)
% (8)Scale: 1000
% (9)Valid range: 0.02 to 0.6 m3/m3
% (10)Backgroud value: 
% 	32767:Permanent Wetlands, Urban and Built-up Lands, Permanent Snow and Ice, Water Bodies
% 	32766:Surface teamperature < 275.15K
% 	32765:Snow cover > 10%


clc;clear;close all
file = 'XXX\SM_A_20200101.tif';
[SM,R] = readgeoraster(file);
SM = single(flipud(SM));
SM(SM>600) = NaN; 
SM = SM./1000;
figure
lon_range = [-180,180];
lat_range = [-90,90];
h = imagesc(lon_range,lat_range,SM);
set(h,'alphadata',~isnan(SM));
axis xy; 
colormap(flipud(parula));
c = colorbar;
c.Label.String = 'm^3/m^3';
caxis([0.,0.6]);
hold on;
load coastlines;
geoshow(coastlat, coastlon, 'DisplayType', 'line', 'Color', 'black');

