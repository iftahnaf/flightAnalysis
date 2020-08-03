function [max_v,max_u,max_h] = getStats(matFile)
%this function gets the max vel,u and hight from the log files. made by
%Iftach Naftaly, 3.8.20

addpath(genpath('06_mat_files'));
Data = load(matFile);

vx = Data.sysvector.vehicle_local_position_0.vx.Data;
vy = Data.sysvector.vehicle_local_position_0.vy.Data;
vz = Data.sysvector.vehicle_local_position_0.vz.Data;
V = [vx vy vz];
NormV = zeros(length(vx),1);
for i = 1 : length(vx)
    NormV(i) = norm(V(i,:));
end
max_v = max(NormV);

baro_alt = Data.sysvector.vehicle_air_data_0.baro_alt_meter.Data - Data.sysvector.vehicle_air_data_0.baro_alt_meter.Data(1);
max_h = max(baro_alt);

accel_x = Data.sysvector.sensor_combined_0.accelerometer_m_s2_0.Data;
accel_y = Data.sysvector.sensor_combined_0.accelerometer_m_s2_1.Data;
accel_z = Data.sysvector.sensor_combined_0.accelerometer_m_s2_2.Data;
accel_x_f = lowpass(accel_x,0.01);
accel_y_f = lowpass(accel_y,0.01);
accel_z_f = lowpass(accel_z,0.01);
U = [accel_x_f accel_y_f accel_z_f];
NormU = zeros(length(accel_x),1);
for i = 1 : length(accel_z_f)
    NormU(i) = norm(U(i,:));
end
max_u = max(NormU);

