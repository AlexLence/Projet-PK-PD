clear all;
close all;
load('data (1).mat')
param_s = [1,10,10];    %paramètre a trouver [Ka;vol;ke]


% % %maximisation des paramètres sur les 3 patients à la fois
% % 
% % %Decommenter les lignes 12 à 17 pour avoir les valeurs maximiser sur les
% % %3 patients à la fois
% 
% q_init1=[1,0,0]; 
% q_init2=[10,0,0]; 
% q_init3=[50,0,0]; 
% erreur=@(param)Fct_a_minimise_all(param,data,data2,data3,q_init1,q_init2,q_init3);
% [param_mean_optimal,Khi2]=fminsearch(erreur,param_s);
% param_mean_optimal;
% 
% 
% % %Decommenter les lignes 23 à 45 pour avoir la simulation des 3 patients
% % %avec des paramètres maximiser sur les 3 à la fois
% 
% plot(data(:,1),data(:,2),'r')
% hold on;
% plot(data2(:,1),data2(:,2),'b')
% hold on;
% plot(data3(:,1),data3(:,2),'g')
% hold on;
% 
% g        = @(t,q_init1) PK_2_comp(data(:,1),q_init1,param_mean_optimal);
% [t,Apred]= ode45(g,data(:,1),q_init1);
% Apred    = Apred(:,2)/param_mean_optimal(2);
% plot(data(:,1),Apred,'Color', [1 0.5 0.5]);
% hold on;
% 
% g        = @(t,q_init2) PK_2_comp(data(:,1),q_init2,param_mean_optimal);
% [t,Apred]= ode45(g,data(:,1),q_init2);
% Apred    = Apred(:,2)/param_mean_optimal(2);
% plot(data(:,1),Apred,'Color', [0.5 0.5 1]);
% hold on;
% 
% g        = @(t,q_init3) PK_2_comp(data(:,1),q_init3,param_mean_optimal);
% [t,Apred]= ode45(g,data(:,1),q_init3);
% Apred    = Apred(:,2)/param_mean_optimal(2);
% plot(data(:,1),Apred,'Color', [0.6 1 0.6]);