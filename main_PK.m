clear all;
close all;
load('data (1).mat')
param_s = [1,10,10];    %paramètre a trouver [Ka;vol;ke]


% %Decommenter les lignes 4 à 9 pour avoir les valeurs maximiser sur les
% %3 patients à la fois

q_init1=[1,0,0]; 
q_init2=[10,0,0]; 
q_init3=[50,0,0]; 
erreur=@(param)Fct_a_minimise_all(param,data,data2,data3,q_init1,q_init2,q_init3);
[param_mean_optimal,Khi2]=fminsearch(erreur,param_s);
param_mean_optimal;



tspan=(0:24);%Durée de la simulation
param_bact = [1.25,0.0297,(5.59*10^-5),3.5,1]; %[beta,Kpa,Kap,Vm,Km]

q_bacterie_antibio1=[10^7,0,1,0,0]; %[concentration bacterie active,concentration bacterie passive,QA,QAc,QAp]
q_bacterie_antibio2=[10^7,0,10,0,0];
q_bacterie_antibio3=[10^7,0,50,0,0];

%ligne 27 a 30 cinétique de la réponse bactérienne pour le patient 1
% g        = @(t,q_bacterie_antibio1) PK_bacterie(tspan,q_bacterie_antibio1,param_bact,param_mean_optimal);
% [t,Apred]= ode45(g,tspan,q_bacterie_antibio1);
% plot(tspan,Apred(:,1),'Color',[0 0 0]);
% hold on;


%ligne 34 a 37 cinétique de la réponse bactérienne pour le patient 2
g        = @(t,q_bacterie_antibio2) PK_bacterie(tspan,q_bacterie_antibio2,param_bact,param_mean_optimal);
[t,Apred]= ode45(g,tspan,q_bacterie_antibio2);
plot(tspan,Apred(:,1),'Color',[0 0 0]);
hold on;


%ligne 41 a 43 cinétique de la réponse bactérienne pour le patient 3
% g        = @(t,q_bacterie_antibio3) PK_bacterie(tspan,q_bacterie_antibio3,param_bact,param_mean_optimal);
% [t,Apred]= ode45(g,tspan,q_bacterie_antibio3);
% plot(tspan,Apred(:,1),'Color',[0 0 0]);