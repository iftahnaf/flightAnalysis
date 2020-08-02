function [max_v] = plotVel(matFile)
%this function plot the XYZ Velocity data from the log files. made by
%Iftach Naftaly, 2.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.vehicle_local_position_0.vx.Time;

vx = Data.sysvector.vehicle_local_position_0.vx.Data;
vy = Data.sysvector.vehicle_local_position_0.vy.Data;
vz = Data.sysvector.vehicle_local_position_0.vz.Data;
V = %continue from here, calculate the norm
for i = 1 : length(vx)
    
end

figure(1)
plot(time_ref-time_ref(1),vx,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
title('Velocity Data vs Time - X')
axis tight

figure(2)
plot(time_ref-time_ref(1),vy,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
title('Velocity Data vs Time - Y')
axis tight

figure(3)
plot(time_ref-time_ref(1),vz,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
title('Velocity Data vs Time - Z')
axis tight

end

