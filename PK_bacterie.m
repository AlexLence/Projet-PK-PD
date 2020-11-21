function [ dY ] = PK_bacterie( t,q_bacterie_antibio,param_bacterie,param_antibio)
%UNTITLED5 Summary of this function goes here
%   Calcule de la cinétique des colonies bactérienne en fonction des
%   différentes concentration en antibiotique dans les différents
%   compartiments
    
    
    Ba=q_bacterie_antibio(1);
    Bp=q_bacterie_antibio(2);
    QA=q_bacterie_antibio(3);
    QAc=q_bacterie_antibio(4);
    QAp=q_bacterie_antibio(5);
    
    
    
    beta=param_bacterie(1);
    Kpa=param_bacterie(2);
    Kap=param_bacterie(3);
    Vm=param_bacterie(4);
    Km=param_bacterie(5);
    
   
    ka=param_antibio(1);
    vol=param_antibio(2);
    ke=param_antibio(3);
    kcp=1.59;
    kpc=2.26;
    
    
   
    
    dQA=-ka*QA;
    %dQA=0; % Cas d'une perfusion
    dQAc=((ka*QA)+kpc*QAp-kcp*QAc-ke*QAc);
    dQAp=(kcp*QAc-kpc*QAp);
    C_antibio=QAc/vol;
    
    dBp=Kap*Ba-Kpa*Bp;
    dBa=beta*Ba+Kpa*Bp-((Vm*C_antibio/(Km+C_antibio))*Ba)-Ba*Kap;
     
    
    dY=[dBa;dBp;dQA;dQAc;dQAp];

end

