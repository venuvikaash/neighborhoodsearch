clc
close all
clear all

S.size = 100;               % Number of drones
S.power = 0.01;              % Inital drone energy ie., Battery
S.dead(1:S.size) = 0;       % initial  drone    
S.priority(1:S.size) = 0;   % Priority to Elect Header
S.radius = 30;              % Cluster Radius
S.drone=40;
S.ro = 2000;                 % total rounds
S.E(1:S.size) = S.power;    % all drone init energy
S.Eout(1:S.size) = 0;       % energy consume

S.Etx=50*0.000000001;
S.Efs=10*0.000000000001;
S.Emp=0.0013*0.000000000001;
S.Ecom=5*0.000000001;
S.do = sqrt(S.Efs/S.Emp);
S.packets(1:S.size) = 10000;

%% Create random drone
S = create_random_drone(S);

%% plot random drones
plot_random_drone(S, 'Random drone', 1);
%% existing
e = drone_mobility_r(S);
S.size = 100;               % Number of drones
S.power = 0.01;              % Inital drone energy ie., Battery
S.dead(1:S.size) = 0;       % initial no dead drone    
S.priority(1:S.size) = 0;   % Priority to Elect Header
S.radius = 30;              % Cluster Radius
S.drone=40;
S.ro = 10000;                 % total rounds
S.E(1:S.size) = S.power;    % all drone init energy
S.Eout(1:S.size) = 0;       % energy consume
S.Etx=50*0.000000001;
S.Efs=10*0.000000000001;
S.Emp=0.0013*0.000000000001;% Data Aggregation Energy 
S.Ecom=5*0.000000001; 
S.do = sqrt(S.Efs/S.Emp);
S.packets(1:S.size) = 10000;
p =drone_mobility(S);
%droun
figure
hold on;
plot(e.Eout,'b')
plot(p.Eout,'r')
hold off;
xlabel('Number of Rounds')
ylabel('Total Energy/Tranmission (J)')
legend('Existing','Proposed','location','best')
hold on;
figure
hold on;
plot(e.Eco,'b')
plot(p.Eco,'r')
hold off;
xlabel('Number of Rounds')
ylabel('Total Energy/Tranmission (J)')
legend('Existing','Proposed','location','best')
hold on;
clear a
a(2,1) = e.tx;
a(2,2) = p.tx;
figure
bar(a)
ylabel('Total Tranmission')
legend('Existing','Proposed','location','best')
b(2,1) = e.Eco;
b(2,2) = p.Eco;
figure
bar(b)
ylabel('Total energy')
legend('Existing','Proposed','location','best')
figure
hold on;
plot(e.live,'b')
plot(p.live,'r')
xlabel('Number of Rounds')
ylabel('Live drones')
legend('Existing','Proposed','location','best')
axis([1 100 0 100])

SS=e.packets/a(2,1)
SS1=p.packets/a(2,2)
figure
subplot(211)
plot(SS,'b')
xlabel('Number of Rounds')
ylabel('Latency')
legend('Existing')

subplot(212)
plot(SS1,'r')
xlabel('Number of Rounds')
ylabel('Latency')
legend('Proposed')
drone_moment
