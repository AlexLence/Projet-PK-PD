function [ sKi2 ] = Fct_a_minimise_all( param,data,data2,data3,init10,init20,init30 )
%UNTITLED Summary of this function goes here
%   Calcule du Khi2 entre les données cliniques et les données prévus par
%   le modèles pour les 3 patients à la fois
    t=data(:,1);
    A1=data(:,2);
    A2=data2(:,2);
    A3=data3(:,2);
    
    
    g=@(t,Y1) PK_2_comp(t,Y1,param);
    [t,Apred]=ode45(g,t,init10);
    Apred=Apred(:,2)/param(2);
    w=A1-Apred;
    Khi21=w.'*w;
    
    g=@(t,Y2) PK_2_comp(t,Y2,param);
    [t,Apred]=ode45(g,t,init20);
    Apred=Apred(:,2)/param(2);
    w=A2-Apred;
    Khi22=w.'*w;
    
    g=@(t,Y3) PK_2_comp(t,Y3,param);
    [t,Apred]=ode45(g,t,init30);
    Apred=Apred(:,2)/param(2);
    w=A3-Apred;
    Khi23=w.'*w;
    
    sKi2=Khi21+Khi22+Khi23;

end

