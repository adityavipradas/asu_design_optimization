function [xfmin, ffmin, vfmin, tfmin, lambda, xmoga, fmoga, vm] = corr_algos_modal_thermal(filename, fstar, tstar, N, string1, string2)
    clc;
    [xfmin, ffmin, vfmin, tfmin, lambda] = fmincon_algo(filename, fstar, tstar, N);
    [xmoga, fmoga] = MOGA(filename);
    [fmoga_sort, a_order] = sort(fmoga(:,2));
    vmoga = fmoga(a_order,1);
    tmoga = fmoga(a_order,3);
    xreg = [fmoga_sort, tmoga];
    Xreg = [xreg, xreg.^2, ones(size(xreg,1),1)];
    %vol regression
    BV = (Xreg'*Xreg)\Xreg'*vmoga
    RV = Xreg*BV-vmoga;
    %R2 value for freq
    R2V = 1-sum(RV.^2)/sum((vmoga - mean(vmoga)).^2);
    figure();
    for i=1:length(xreg)
        for j=1:length(xreg)
            fp(i,j) = fmoga_sort(j);
            tp(i,j) = tmoga(i);
            xp = [fp(i,j), tp(i,j)];
            Xp = [xp, xp.^2, ones(1)]
            vp(i,j) = Xp*BV;
        end
    end
    fm = -1200;
    tm = 400;
    xm = [-1200, 400];
    Xm = [xm, xm.^2, ones(1)];
    vm = Xm*BV;
    
    surf(fp,tp,vp); 
    %plot(-ffmin, vfmin,'-o',fmoga_sort, vmoga,'-*');
    %grid on;
    %legend('fmincon','MOGA');
    %xlabel(string2);
    %ylabel('volume');
    %str = strcat('correlation of pareto curves for ',string1,...
        %' analysis');
    %title(str);
    figure();
    surf(-ffmin,tfmin,vfmin);
end