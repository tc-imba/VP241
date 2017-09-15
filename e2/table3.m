Im=[0:50:500];
U=[0.0000 0.0214 0.0432 0.0650 0.0864 0.1085 0.1301 0.1520 0.1739 0.1956 0.2173];
fid=fopen('table3_1.tex','w+');
fprintf(fid,'\\begin{tabular}{|c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'& $I_M$ [mA] $\\pm$ 2\\%% [mA] & $U$ [V] $\\pm$ $0.05\\%%+6\\times10^{-3}$ [V] \\\\\n');
fprintf(fid,'\\hline\n');
for i=1:length(Im)
    fprintf(fid,'%d\t&\t%.3f\t&\t%.3f\t\\\\\n',i,Im(i),U(i));
    fprintf(fid,'\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fclose(fid);
B=Im./100.*1.4366e-3;
plot(B,U,'.','Markersize',10);
[f,u]=fit(B',U','poly1');
hold on;
plot(f);
xlabel('B/T');
ylabel('U/V');
axis([0 8e-3 0 0.25]);
legend('data','fitted curve','Location','Northwest');
title(['$$K_h=' num2str(f.p1) '\pm' num2str(u.rmse) 'V/T$$'],'Interpreter','latex');
uncertainty(B,U,0.02,0,0.0005,6e-3,'b');
hold off;
saveas(gcf,'fig2.eps');
