function [] = plotTgo(matFile,rho_u,rho_w,m,minTgo,R_e,V_e)
%this function plot the Tgo data from the log files. made by
%Iftach Naftaly, 10.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.vehicle_local_position_0.x.Time;

x = Data.sysvector.vehicle_local_position_0.x.Data;
y = Data.sysvector.vehicle_local_position_0.y.Data;
z = -Data.sysvector.vehicle_local_position_0.z.Data;

vx = Data.sysvector.vehicle_local_position_0.vx.Data;
vy = Data.sysvector.vehicle_local_position_0.vy.Data;
vz = Data.sysvector.vehicle_local_position_0.vz.Data;

V_p = [vx vy vz];
R_p = [x y z];

drho = rho_u - rho_w;

Tgo = zeros(1,length(x));
R = zeros(1,length(x));
V = zeros(1,length(x));

for i = 1 : length(x)
    R(i,1) = R_e(1) - R_p(i,1);
    R(i,2) = R_e(2) - R_p(i,2);
    R(i,3) = R_e(3) - R_p(i,3);
    V(i,1) = V_e(1) - V_p(i,1);
    V(i,2) = V_e(2) - V_p(i,2);
    V(i,3) = V_e(3) - V_p(i,3);
    Tgo(i) = tgo_interception(R(i,:),V(i,:),drho,m,minTgo);
end

figure(1)
plot(time_ref-time_ref(1),Tgo,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Tgo [sec]')
title('Tgo vs Time')
axis tight

end

