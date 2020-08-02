function [] = plotAccel(matFile)
%this function plot the accelometers data from the log files. made by
%Iftach Naftaly, 2.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

time_ref = Data.sysvector.sensor_combined_0.accelerometer_m_s2_0.Time;

accel_x = Data.sysvector.sensor_combined_0.accelerometer_m_s2_0.Data;
accel_y = Data.sysvector.sensor_combined_0.accelerometer_m_s2_1.Data;
accel_z = Data.sysvector.sensor_combined_0.accelerometer_m_s2_2.Data;

accel_x_f = smoothdata(accel_x,'gaussian');
accel_y_f = smoothdata(accel_y,'gaussian');
accel_z_f = smoothdata(accel_z,'gaussian');

figure(1)
plot(time_ref-time_ref(1),accel_x,'k','linewidth',0.3);
hold on
% plot(time_ref-time_ref(1),accel_x_f,'r','linewidth',0.8);
grid minor
set(gca,'fontsize',16)
set(gcf,'color','w')
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
% legend('Raw Data','Filtered')

end

