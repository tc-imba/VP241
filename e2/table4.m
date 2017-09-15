x=[0:0.6:27.6];
U=[ 0.0532 0.0726 0.0856 0.0938 0.0988 0.1017 0.1037 0.1050 0.1059 0.1066 0.1070 0.1074 0.1077 0.1080 0.1082 0.1083 0.1084 0.1084 0.1085 0.1085 0.1085 0.1085 0.1086 0.1086 0.1087 0.1087 0.1086 0.1085 0.1084 0.1084 0.1082 0.1080 0.1077 0.1074 0.1068 0.1063 0.1057 0.1046 0.1030 0.1007 0.0967 0.0900 0.0796 0.0629 0.0438 0.0282 0.0181];
Kh=30.2874;
B=U/Kh*1000;
plot(x-13,B,'.','Markersize',10);
B2=[1.4366 1.4363 1.4356 1.4343 1.4323 1.4292 1.4245 1.4173 1.4057 1.3856 1.3478 1.2685 1.1963 1.0863 0.9261 0.7233];
B2=[B2(16:-1:2) B2]*2.5;
x2=[-13:0.5:-11 -10:1:10 11:0.5:13];
hold on;
plot(x2,B2);
xlabel('x/cm');
ylabel('B/mT');
axis([-13 13 0 4]);
legend('data','theroretical curve','Location','South');
uncertainty(x-13,B,0,0.05,0.0005,6e-4/Kh*1000,'b');
hold off;
saveas(gcf,'fig3.eps');
fid=fopen('table4_1.tex','w+');
fprintf(fid,'\\begin{tabular}{|c|c|c||c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'&$x$[cm]$\\pm$0.05[cm]&$U$[V]$\\pm0.05\\%%+6\\times10^{-4}$[V]& &$x$[cm]$\\pm$0.05[cm]&$U$[V]$\\pm0.05\\%%+6\\times10^{-4}$[V] \\\\\n');
fprintf(fid,'\\hline\n');
for i=1:24
    fprintf(fid,'%d\t&\t%.2f\t&\t%.4f\t&\t',i,x(i),B(i));
    if i<24
        fprintf(fid,'%d\t&\t%.2f\t&\t%.4f\t',i+24,x(i+24),B(i+24));
    else
        fprintf(fid,'&\t&\t');
    end
    fprintf(fid,'\\\\\n\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fclose(fid);