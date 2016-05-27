function [xfmin, ffmin, vfmin, xmoga, fmoga, lambda] = corr_algos_therm(filename, fstar, N, string1, string2)
    clc;
    [xfmin, ffmin, vfmin, lambda] = fmincon_algo(filename, fstar, N);
    [xmoga, fmoga] = MOGA(filename);
    [fmoga_sort, a_order] = sort(fmoga(:,2));
    vmoga = fmoga(a_order,1);
    figure();
    plot(ffmin, vfmin,'-o',fmoga_sort, vmoga,'-*');
    grid on;
    legend('fmincon','MOGA');
    xlabel(string2);
    ylabel('volume');
    str = strcat('correlation of pareto curves for ',string1,...
        ' analysis');
    title(str);
end