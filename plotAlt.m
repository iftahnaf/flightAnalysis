function [] = plotAlt(matFile)
%this function plot the altitude from the barometer data from the log files. made by
%Iftach Naftaly, 2.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.vehicle_air_data_0.baro_alt_meter.Time;
baro_alt = Data.sysvector.vehicle_air_data_0.baro_alt_meter.Data;

figure(1)
plot(time_ref-time_ref(1),lowpass(baro_alt - baro_alt (1),0.01),'k','linewidth',0.3);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Altitude [m]')
title('Baro Altitude vs Time - X')
axis tight
end

