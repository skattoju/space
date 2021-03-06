            function p_e = wgslla2xyz(lat,lon,alt)
% %===========================================================%
% %           function p_e = wgslla2xyz(lat,lon,alt)          %
% %                                                           %
% %   This function returns the position vector p_e given in  %
% %   the WGS-84 Earth Centered Earth Fixed (ECEF) coordinate %
% %   for a user located at the goedetic coordinates lat,     %
% %   lon and alt.  The units of the output position vector,  %
% %   p_e, are meters while the inputs have the following     %
% %   units: latitude and longitude in degrees and            %
% %   altitude in meters.                                     %
% %                                                           %
% %   Programmer:     Demoz Gebre-Egziabher                   %
% %   Created:        July 2, 1998                            %
% %   Last Modified:  March 26, 2009                          %
% %   License:  BSD  see bsd.txt                              %
% %                                                           %
% %===========================================================%     

%   Load ellipsoid constants

wgs_84_parameters;
deg2rad = pi/180;
%   Compute East-West Radius of curvature at current position

R_E = R_0/(sqrt(1 - (e*sin(deg2rad*lat))^2));

%   Compute ECEF coordinates

p_e(1,1) = (R_E + alt)*cos(deg2rad*lat)*cos(deg2rad*lon);
p_e(2,1) = (R_E + alt)*cos(deg2rad*lat)*sin(deg2rad*lon);
p_e(3,1) = ((1 - e^2)*R_E + alt)*sin(deg2rad*lat);

%===========================================================%     

