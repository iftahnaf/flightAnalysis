function [] = plotTgobag(ros_bag,type)
%this function plot the Tgo from the rosbag file. its inputs are
%the bagfile name (include the .bag). made by
%Iftach Naftaly, 15.8.2020

bag = rosbag(ros_bag);

if strcmp(type,'Interception')
    time = select(bag, 'topic', '/interception/Tgo');
else
    time = select(bag, 'topic', '/softLanding/Tgo');
end
time_msg = readMessages(time);
<<<<<<< HEAD
numberOfElements = bag.NumMessages;
t = linspace(0,bag.EndTime-bag.StartTime,numberOfElements);
time_sec = zeros(1,length(time_msg));

for k=1:1:length(time_msg)
=======
time_sec = zeros(1,length(time_msg));
t = linspace(0,bag.EndTime-bag.StartTime,length(time_sec));
for k=1:1:length(time_sec)
>>>>>>> devel
    time_sec(k) = vpa(time_msg{k}.Real,10);
end

figure(1)
plot(t,time_sec,'k','linewidth',1)
set(gca,'fontsize',16);
set(gcf,'color','w')
xlabel('Time [sec]');
ylabel('Tgo  [sec]');
grid minor
<<<<<<< HEAD
<<<<<<< HEAD
=======
title('Tgo vs Time')
>>>>>>> devel
=======
title('Tgo vs Time')
>>>>>>> devel
axis tight

end
