function [xmoga, fmoga] = corr_algos_modal_thermal_structural(filename)
%PREPARED BY ADITYA VIPRADAS AND SHARAN KISHORE (TEAM 11)
    clc;
    %[xfmin, lambda] = fmincon_algo(filename, fcon, tcon, scon);
    [xmoga, fmoga] = MOGA(filename);
end
