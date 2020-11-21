function [ Khi2 ] = Fct_a_minimiser( param,data,init0 )
%UNTITLED3 Summary of this function goes here
%   Calcule du Khi2 entre les donn�es cliniques et les donn�es pr�vus par le mod�les 
    A1=data(:,2);%donn�e clinique
    t=data(:,1);%temps
    
    
    g=@(t,Y) PK_2_comp(t,Y,param);%fonction a maximiser
    [t,Apred]=ode45(g,t,init0);
    Apred=Apred(:,2)/param(2);
    w=A1-Apred;
    Khi2=w.'*w;%calcule du Khi2


end

