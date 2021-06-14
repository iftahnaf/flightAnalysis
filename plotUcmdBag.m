function [] = plotUcmdBag(ros_bag)
%this function plot the U from the rosbag file. its inputs are
%the bagfile name (include the .bag). made by
%Iftach Naftaly, 25.8.2020
% edit on 12.6.21

bag = rosbag(ros_bag);

U = select(bag, 'topic', '/interception/u');
U_msg = readMessages(U);
t = linspace(0,bag.EndTime,length(U_msg));
u_x= zeros(1,length(U_msg));
u_y= zeros(1,length(U_msg));
u_z= zeros(1,length(U_msg));
norm_u = zeros(1,length(U_msg));

for k=1:1:length(U_msg)
    u_x(k) = vpa(U_msg{k}.Vector.X);
    u_y(k) = vpa(U_msg{k}.Vector.Y);
    u_z(k) = vpa(U_msg{k}.Vector.Z);
    norm_u(k) = sqrt(u_x(k)^2+u_y(k)^2+u_z(k)^2);
end

figure(1)
plot(t,u_x,'r','linewidth',1)
hold on
plot(t,u_y,'g','linewidth',1)
hold on
plot(t,u_z,'b','linewidth',1)
hold on
plot(t,norm_u,'k','linewidth',1)
hold off
set(gca,'fontsize',16);
set(gcf,'color','w')
xlabel('Time [sec]');
ylabel('Acceleration Command [m/s^2]');
grid minor
legend('u_x','u_y','u_z','||u||')

end
