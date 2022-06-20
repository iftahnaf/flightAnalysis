function [] = plotTrajectoryBag(ros_bag)
%this function plot the range from the rosbag file. its inputs are
%the bagfile name (include the .bag). made by
%Iftach Naftaly, 12.6.2021


bag = rosbag(ros_bag);

r_t = select(bag, 'topic', '/interception/r_e');
r_p = select(bag, 'topic', '/interception/r_p');
r_p_msg = readMessages(r_p);
r_t_msg = readMessages(r_t);

t = linspace(0,bag.EndTime,length(r_p_msg));

miss_distance = 1000;

for k=1:1:length(r_p_msg)
    x_p(k) = r_p_msg{k}.Pose.Position.X;
    y_p(k)= r_p_msg{k}.Pose.Position.Y;
    z_p(k) = r_p_msg{k}.Pose.Position.Z;
    
    x_t(k) = r_t_msg{k}.Pose.Position.X;
    y_t(k)= r_t_msg{k}.Pose.Position.Y;
    z_t(k) = r_t_msg{k}.Pose.Position.Z;
    
    range = sqrt( (x_p(k) - x_t(k))^2 + (y_p(k) - y_t(k))^2 + (z_p(k) - z_t(k))^2 );
    if miss_distance > range
        txt = sprintf("Range = %f [m]", range);
    else
        txt = sprintf("Range = %f [m]", miss_distance);
    end
        figure(1)
        plot(y_p(k),z_p(k),'*b','linewidth',1)
        hold on
        plot(y_t(k),z_t(k),'*r','linewidth',1)
        hold on
        htext = text(50,20, txt);
        pause(0.01)
        delete(htext)

    if miss_distance < range && range < 5.0
        fprintf("Final miss distance = %.3f", miss_distance)
        break
    end
    miss_distance = range;
    
end
hold off
set(gca,'fontsize',16);
set(gcf,'color','w')
xlabel('X [m]');
ylabel('Y [m]');

legend('Drone','Target');
grid minor

% figure(1)
% plot(x_p,z_p,'b','linewidth',1)
% hold on
% plot(x_t,z_t,'r','linewidth',1)
% set(gca,'fontsize',16);
% set(gcf,'color','w')
% xlabel('X [m]');
% ylabel('Y [m]');
% xlim([-20,70])
% ylim([0,65])
% legend('Drone','Target');
% grid minor
end
