function [xmoga, fmoga] = corr_algos_comb(filename)
    clc;
    %[xfmin, ffmin, vfmin] = fmincon_algo(filename, fstar, N);
    [xmoga, fmoga] = MOGA(filename);
    %[fmoga_sort, a_order] = sort(fmoga(:,2));
    %vmoga = fmoga(a_order,1);
    %figure();
%     plot(fmoga_sort, vmoga,'-*');
%     grid on;
%     legend('MOGA');
%     xlabel(string2);
%     ylabel('volume');
%     str = strcat('correlation of pareto curves for ',string1,...
%         ' analysis');
%     title(str);
end
