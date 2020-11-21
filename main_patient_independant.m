clear all;
close all;
load('data (1).mat')
param_s = [1,10,10];    %paramètre a trouver [Ka;vol;ke]

% % % % Patient 1: Quantité d'antibiotique = 1mg
% 
% %Decomanter les lignes 10 à 25 pour la simulation sur le premier patient
% 
% plot(data(:,1),data(:,2),'r');
% hold on;
% 
% q_init1 = [1,0,0]  ;    %quantité d'antibio dans chaque compartiment(le patient recoit 1mg d'antibio):
%                         %[Quantité d'antibio;Quantité d'antibio central;Quantité d'antibio périphérique]
% 
% %On va maximisé les paramètres en minimisant le Khi2 à partir de paramètre initiaux                      
% erreur                  = @(param)Fct_a_minimiser(param,data,q_init1);
% [param_optimal1,Khi2] = fminsearch(erreur,param_s);
% 
% %On trace la courbe assoscié aux paramètre optimaux
% g        = @(t,q_init1) PK_2_comp(data(:,1),q_init1,param_optimal1);
% [t,Apred]= ode45(g,data(:,1),q_init1);
% Apred    = Apred(:,2)/param_optimal1(2);
%  
% plot(data(:,1),Apred,'Color', [1 0.5 0.5]);
% 
% 
% % % Parient 2: Quantité d'antibiotique = 10mg
% 
% %Decommenter les lignes 33 à 48 pour avoir la simulation sur le second
% %patient
% 
% plot(data2(:,1),data2(:,2),'b')
% hold on;
% 
% q_init2 = [10,0,0]; %quantité d'antibio dans chaque compartiment(le patient recoit 10mg d'antibio):
%                     %[Quantité d'antibio;Quantité d'antibio central;Quantité d'antibio périphérique]
% 
% %On va maximisé les paramètres en minimisant le Khi2 à partir de paramètre initiaux    
% erreur                = @(param)Fct_a_minimiser(param,data2,q_init2);
% [param_optimal2,Khi2] = fminsearch(erreur,param_s);
% 
% %On trace la courbe assoscié aux paramètre optimaux
% g         = @(t,q_init2) PK_2_comp(data2(:,1),q_init2,param_optimal2);
% [t,Apred] = ode45(g,data2(:,1),q_init2);
% Apred     = Apred(:,2)/param_optimal2(2);
%  
% plot(data2(:,1),Apred,'Color', [0.5 0.5 1]);
% 
% 
% 
% 
% 
% % % %Patient 3 : Quantité d'antibiotique = 50mg
% % 
% 
% %%Decommenter les lignes 60 à 76 pour avoir la simulation sur le troisième
% %%patient
% 
% plot(data3(:,1),data3(:,2),'g')
% hold on;
% 
% 
% q_init3=[50,0,0]; %quantité d'antibio dans chaque compartiment(le patient recoit 10mg d'antibio):
%                  %[Quantité d'antibio;Quantité d'antibio central;Quantité d'antibio périphérique]
% 
% %On va maximisé les paramètres en minimisant le Khi2 à partir de paramètre initiaux 
% erreur=@(param)Fct_a_minimiser(param,data3,q_init3);
% [param_optimal3,Khi2]=fminsearch(erreur,param_s);
% 
% %On trace la courbe assoscié aux paramètre optimaux
% g=@(t,q_init3) PK_2_comp(data3(:,1),q_init3,param_optimal3);
% [t,Apred]=ode45(g,data3(:,1),q_init3);
% Apred=Apred(:,2)/param_optimal3(2);
% 
% plot(data3(:,1),Apred,'Color', [0.7 1 0.7]);
% 
% 
% 
% % % % Moyenne
% 
% %Decommenter les lignes 85 à 90 pour avoir la moyenne des paramètre
% %optimaux des 3 patients
% 
% ka_opti  = [param_optimal1(1),param_optimal2(1),param_optimal3(1)];
% vol_opti = [param_optimal1(2),param_optimal2(2),param_optimal3(2)];
% ke_opti  = [param_optimal1(3),param_optimal2(3),param_optimal3(3)];
% ka_opti  = mean(ka_opti)
% vol_opti = mean(vol_opti)
% ke_opti  = mean(ke_opti)