function [] = compareTrajectory(matFile1,str1,matFile2,str2,xt,yt,zt)
%this function plot the XYZ Position data from the log files. made by
%Iftach Naftaly, 8.9.20

addpath(genpath('06_mat_files'));
Data1 = load(matFile1);
Data2 = load(matFile2);

x1 = Data1.sysvector.vehicle_local_position_0.x.Data;
y1 = Data1.sysvector.vehicle_local_position_0.y.Data;
z1 = Data1.sysvector.vehicle_local_position_0.z.Data;

x2 = Data2.sysvector.vehicle_local_position_0.x.Data;
y2 = Data2.sysvector.vehicle_local_position_0.y.Data;
z2 = Data2.sysvector.vehicle_local_position_0.z.Data;


figure(1)
plot3(x1,y1,-z1,'--k','linewidth',1.5)
hold on
plot3(x2,y2,-z2,'k','linewidth',1.5)
hold on
plot3(xt,yt,zt,'or','linewidth',5)
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
title('Trajectory')
legend(str1, str2)
end

