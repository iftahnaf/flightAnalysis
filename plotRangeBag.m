function [] = plotRangeBag(ros_bag)
%this function plot the range from the rosbag file. its inputs are
%the bagfile name (include the .bag). made by
%Iftach Naftaly, 12.6.2021


bag = rosbag(ros_bag);

r_t = select(bag, 'topic', '/interception/r_e');
r_p = select(bag, 'topic', '/interception/r_p');
r_p_msg = readMessages(r_p);
r_t_msg = readMessages(r_t);

t = linspace(0,bag.EndTime,length(r_p_msg));

for k=1:1:length(r_p_msg)
    x_p(k) = r_p_msg{k}.Pose.Position.X;
    y_p(k)= r_p_msg{k}.Pose.Position.Y;
    z_p(k) = r_p_msg{k}.Pose.Position.Z;
    
    r_p_vec = [x_p(k) y_p(k) z_p(k)];
    
    x_t(k) = r_t_msg{k}.Pose.Position.X;
    y_t(k)= r_t_msg{k}.Pose.Position.Y;
    z_t(k) = r_t_msg{k}.Pose.Position.Z;
    
    r_t_vec = [x_t(k) y_t(k) z_t(k)];
    
    r(k) = norm(r_t_vec - r_p_vec);
end

figure(1)
plot(t,r,'k','linewidth',1)
set(gca,'fontsize',16);
set(gcf,'color','w')
xlabel('Time [sec]');
ylabel('Range [m]');
grid minor
end
