function [] = plotXYZ(matFile)
%this function plot the XYZ Position data from the log files. made by
%Iftach Naftaly, 2.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.vehicle_local_position_0.x.Time;

x = Data.sysvector.vehicle_local_position_0.x.Data;
y = Data.sysvector.vehicle_local_position_0.y.Data;
z = Data.sysvector.vehicle_local_position_0.z.Data;


figure(1)
plot(time_ref-time_ref(1),x,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Position [m]')
title('Position Data vs Time - X')
axis tight

figure(2)
plot(time_ref-time_ref(1),y,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Position [m]')
title('Position Data vs Time - Y')
axis tight

figure(3)
plot(time_ref-time_ref(1),-z,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Position [m]')
title('Position Data vs Time - Z')
axis tight

figure(4)
plot3(x,y,-z,'k','linewidth',1.5)
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
title('Trajectory')
end

