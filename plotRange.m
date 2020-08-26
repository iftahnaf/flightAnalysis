<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
function [] = plotRange(matFile,R_e,V_e)
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
=======
function [] = plotRange(matFile,R_e,V_e,interval)
>>>>>>> devel
%this function plot the Range data from the log files. made by
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

R = zeros(1,length(x));
V = zeros(1,length(x));
Range = zeros(1,length(x));
Vel_Norm = zeros(1,length(x));
for i = 1 : length(x)
    R(i,1) = R_e(1) - R_p(i,1);
    R(i,2) = R_e(2) - R_p(i,2);
    R(i,3) = R_e(3) - R_p(i,3);
    V(i,1) = V_e(1) - V_p(i,1);
    V(i,2) = V_e(2) - V_p(i,2);
    V(i,3) = V_e(3) - V_p(i,3);
    Range(i) = norm(R(i,:));
    Vel_Norm(i) = norm(V(i,:));
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
figure(1)
plot(time_ref-time_ref(1),Range,'k','linewidth',1);
=======
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
if interval == 0
    %     for k = 1 : length(Range)
    %         if (Range(k+1) > Range(k)) && (time_ref(k) - time_ref(1) > 10)
    %             break
    %         end
    %     end
    k = length(x);
else
    k = interval;
end

figure(1)
plot(time_ref(1:k)-time_ref(1),Range(1:k),'k','linewidth',1);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
=======
>>>>>>> devel
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Range [m]')
title('Range vs Time')
axis tight


figure(2)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
plot(time_ref-time_ref(1),Vel_Norm,'k','linewidth',1);
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
=======
plot(time_ref(1:k)-time_ref(1),Vel_Norm(1:k),'k','linewidth',1);
>>>>>>> devel
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
title('Velocity Norm vs Time')
axis tight
end

