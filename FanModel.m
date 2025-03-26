clear all;
close all;
clc;

%% Parameter assignment
%% Pulse Width Modulation Parameters:
Va = 240; % Armature voltage [V] 
f = 50; % Frequency [Hz]
T = 1/f; % Time period [secs]
t_on = 40; % Pulsation [in %]

%% Supply Voltage for field circuit
Vf = 300; % Field voltage [V]

%% DC Machine Parameters
Kt = 0.9483; % Torque constant
Ra = 2.581; % Armature resistance [ohm]
La = 0.028; % Armature inductance [H]
Rf = 281.2; %Field resistance [ohm]
Lf = 1.56; % Field inductance [H]
Mi = 0.0222; % Moment of inertia [kgm^2]
C = 0.003; % Coefficient of viscous friction [Nms]

%% Simulation of the model
Data = sim("FanModel_BJT.slx");

%% Assigning variables to parameters
N_rpm = Data.RPM;
LoadTorque = Data.Tl;

S1 = Data.S1;
S2 = Data.S2;
S3 = Data.S3;
S4 = Data.S4;

%% Plotting the results
figure(1)
plot(N_rpm, LoadTorque, 'k-')
xlabel("Rotational Speed [RPM]")
ylabel("Load Torque [Nm]")
title("Torque-Speed characteristics")
grid on

%% Figure 2
figure(2)
plot(N_rpm, Data.Ia, 'k-')
xlabel("Rotational Speed [RPM]")
ylabel("Armature Current [A]")
title("Current-Speed characteristics")
grid on

%% Figure 3
figure(3)
t = tiledlayout(2, 2);

nexttile
plot(Data.tout, S1, 'k-')
xlabel("Simulation time [sec]")
ylabel("Switch Voltage S1 [V]")
title("S1")
grid on

nexttile
plot(Data.tout, S2, 'k-')
xlabel("Simulation time [sec]")
ylabel("Switch Voltage S2 [V]")
title("S2")
grid on

nexttile
plot(Data.tout, S3, 'k-')
xlabel("Simulation time [sec]")
ylabel("Switch Voltage S3 [V]")
title("S3")
grid on

nexttile
plot(Data.tout, S4, 'k-')
xlabel("Simulation time [sec]")
ylabel("Switch Voltage S4 [V]")
title("S4")
grid on

%% Figure 4
figure(4)
tiledlayout(2,1);

nexttile
plot(Data.tout, LoadTorque, 'k-')
xlabel("Simulation time [sec]")
ylabel("Load Torque [Nm]")
grid on

nexttile
plot(Data.tout, N_rpm, 'k-')
xlabel("Simulation time [sec]")
ylabel("Rotational Speed [RPM]")
grid on

%% Figure 5
figure(5)
plot(Data.tout, Data.Ia, 'k-')
xlabel("Simulation time [sec]")
ylabel("Armature Current [A]")
grid on