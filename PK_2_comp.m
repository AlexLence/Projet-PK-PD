function [ dY ] = PK_2_comp( t,q_init,param)
%UNTITLED2 Summary of this function goes here
%   Calcule des equations différentielles de la cinétique de l'antibiotique
%   dans les différent compartiement
    ka=param(1);
    vol=param(2);
    ke=param(3);
    
    kcp=1.59;
    kpc=2.26;
    
    QA=q_init(1);
    QAc=q_init(2);
    QAp=q_init(3);
    
    
    dQA=-ka*QA;
    dQAc=((ka*QA)+kpc*QAp-kcp*QAc-ke*QAc);
    dQAp=(kcp*QAc-kpc*QAp);
    dC1=(1/vol)*dQAc;
    
    
    dY=[dQA;dQAc;dQAp];

end

