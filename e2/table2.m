f=[4*ones(1,3) 3*ones(1,11)];
Us=[2.77 3.25 3.78 4.24 4.77 5.26 5.77 6.27 6.73 7.27 7.76 8.26 9.39 9.90];
U0=[1.4958 1.6613 1.9408 2.185 2.463 2.722 2.988 3.252 3.492 3.773 4.030 4.291 4.877 5.146];
U=[1.5433 1.7254 2.0198 2.276 2.566 2.837 3.115 3.391 3.641 3.932 4.200 4.473 5.084 5.362];
B=2.5*1.4366e-3;
Kh=(U-U0)/B;
Kh_Us=Kh./Us;
fid=fopen('table2_1.tex','w+');
fprintf(fid,'\\begin{tabular}{|c|c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'&$U_S$ [V] $\\pm$ 0.5\\%% V & $U_0$ [V] $\\pm$ $0.5\\%% +6\\times10^{-3}$ V &$U_0$ [V] $\\pm$ $0.5\\%% +6\\times10^{-3}$ V\\\\\n');
fprintf(fid,'\\hline\n');
for i=1:length(Us)
    fprintf(fid,['%d\t&\t%.2f\t&\t%.',num2str(f(i)),'f\t&\t%.',num2str(f(i)),'f\t\\\\\n'],i,Us(i),U0(i),U(i));
    fprintf(fid,'\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fclose(fid);
u_Kh=sqrt((U0.*0.0005+6e-3).^2+(U.*0.0005+6e-3).^2)/B;
u_Kh_Us=sqrt((u_Kh./Us).^2+(0.0005./Us).^2);
fid=fopen('table2_2.tex','w+');
fprintf(fid,'\\begin{tabular}{|c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'& $K_H$ [V/T] & $K_H/U_S$ [1/T] \\\\\n');
fprintf(fid,'\\hline\n');
for i=1:length(Us)
    fprintf(fid,'%d\t&\t$%.3f\\pm%.3f$\t&\t$%.3f\\pm%.3f$\t\\\\\n',i,Kh(i),u_Kh(i),Kh_Us(i),u_Kh_Us(i));
    fprintf(fid,'\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fclose(fid);
plot(Us,Kh_Us,'.','Markersize',10);
[f,u]=fit(Us',Kh_Us','exp2');
hold on;
plot(f);
xlabel('$$K_H/U_S$$','Interpreter','latex');
ylabel('$$U_S$$','Interpreter','latex');
legend('data','fitted curve','Location','Southeast');
%title(['$$K_h=' num2str(f.p1) '\pm' num2str(u.rmse) 'V/T$$'],'Interpreter','latex');
uncertainty(Us,Kh_Us,0.005,0,0,u_Kh_Us,'b');
hold off;
saveas(gcf,'fig1.eps');

