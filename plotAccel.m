function [] = plotAccel(matFile,LPFfreq)
%this function plot the accelometers data from the log files. made by
%Iftach Naftaly, 2.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.sensor_combined_0.accelerometer_m_s2_0.Time;

accel_x = Data.sysvector.sensor_combined_0.accelerometer_m_s2_0.Data;
accel_y = Data.sysvector.sensor_combined_0.accelerometer_m_s2_1.Data;
accel_z = Data.sysvector.sensor_combined_0.accelerometer_m_s2_2.Data;

accel_x_f = lowpass(accel_x,LPFfreq);
accel_y_f = lowpass(accel_y,LPFfreq);
accel_z_f = lowpass(accel_z,LPFfreq);

U = [accel_x_f;accel_y_f;accel_z_f];
NormU = zeros(1,length(accel_x));

for i = 1 : length(accel_z_f)
    NormU(i) = norm(U(i));
end

max_U = max(NormU);
str = sprintf('Maximum acceleration is %.3f [m/s^2]',max_U);

figure(1)
plot(time_ref-time_ref(1),accel_x,'k','linewidth',0.3);
hold on
plot(time_ref-time_ref(1),accel_x_f,'r','linewidth',0.8);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
legend('Raw Data - x','Filtered Data -x')
title('Accelometer Data vs Time - X')
axis tight

figure(2)
plot(time_ref-time_ref(1),accel_y,'k','linewidth',0.3);
hold on
plot(time_ref-time_ref(1),accel_y_f,'r','linewidth',0.8);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
legend('Raw Data - y','Filtered Data -y')
title('Accelometer Data vs Time - Y')
axis tight

figure(3)
plot(time_ref-time_ref(1),accel_z,'k','linewidth',0.3);
hold on
plot(time_ref-time_ref(1),accel_z_f,'r','linewidth',0.8);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
legend('Raw Data - z','Filtered Data -z')
title('Accelometer Data vs Time - Z')
axis tight

figure(4)
plot(time_ref-time_ref(1),NormU,'k','linewidth',1);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
title('Acceleration Norm')
axis tight
text((time_ref(end)-time_ref(1))/2,(max(NormU) - min(NormU))/2,str);

end

