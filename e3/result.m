U=[0.18 0.92 1.78 2.32 2.81 3.21 3.76 4.47 4.94 5.95 6.65 7.30 7.69 7.69 7.85 8.04 8.26 8.52 8.70 8.78 8.89 9.34 9.66 9.82 9.92
   0.34 1.06 1.93 2.72 3.09 3.63 4.29 4.76 5.29 5.85 6.24 6.43 6.61 7.11 7.60 8.07 8.33 8.52 8.66 8.78 8.91 9.03 9.27 9.52 9.62
   0.22 1.23 2.21 3.23 4.21 5.20 6.25 7.29 8.10 8.43 9.01 9.40 10.03 10.85 11.60 12.43 13.30 14.04 14.86 15.71 16.54 17.45 17.96 18.20 18.41
   0.11 0.69 1.28 1.72 2.27 2.83 3.33 3.82 4.38 4.61 4.83 5.03 5.26 5.44 5.64 5.99 6.43 6.83 7.22 7.67 8.05 8.43 8.93 9.34 9.46];
I=[104.7 102.7 99.8 97.9 95.7 94.1 91.9 89.6 88.5 84.2 81.3 78.4 76.5 76.5 75.4 74.1 72.2 70.7 65.9 63.8 61.0 44.3 26.7 15.2 8.5
   89.9 88.1 85.7 83.9 83.0 81.7 79.5 77.6 76.2 74.0 72.2 70.3 68.5 67.2 63.9 59.5 55.6 51.9 48.5 45.3 41.4 37.1 27.6 14.9 8.2
   92.3 91.3 90.1 88.5 87.2 85.8 84.1 82.7 80.9 80.4 78.8 78.2 77.0 75.6 73.7 70.9 67.3 64.6 60.3 53.4 44.9 32.6 24.0 20.1 16.2
   184.5 180.8 177.8 175.2 172.0 169.2 166.2 162.6 159.0 157.4 156.2 154.5 152.7 150.7 148.5 143.6 136.4 128.6 119.9 108.2 95.5 79.5 50.8 20.0 8.2];
Uoc=[9.98 9.66 19.10 9.55];
Isc=[105.2 84.4 82.3 184.0];
P=U.*I;
Pc=Uoc.*Isc;
R=U./I.*1000;
Pin=[22.52 17.26 22.52*2 17.26*2];

uU=U.*0.005+0.01;
uUoc=Uoc.*0.005+0.01;
uI=I.*0.015+0.1;
uIsc=Isc.*0.015+0.1;
uP=sqrt(I.^2.*uU.^2+U.^2.*uI.^2);
uR=sqrt(1./I.^2.*uU.^2+U.^2./I.^4.*uI.^2).*1000;
uPc=sqrt(Isc.^2.*uUoc.^2+Uoc.^2.*uIsc.^2);
uPin=[0.56 0.56 1.12 1.12];

fid=fopen('result.tex','w+');

fprintf(fid,'The measurement of a solar cell was shown in Table \\ref{tab-5}.\\\\\n\n');
fprintf(fid,'\\begin{table}[!h]\n\\begin{center}\n');
fprintf(fid,'\\begin{tabular}{|c|c|c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'&\\multicolumn{2}{|c|}{100 cm}&\\multicolumn{2}{|c|}{120 cm}\\\\\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'& $U$ [V] & $I$ [mA] & $U$ [V] & $I$ [mA] \\\\\n');
fprintf(fid,'\\hline\n');
for i=1:25
    fprintf(fid,['%d\t&\t%.2f\t&\t%.1f\t&\t%.2f\t&\t%.1f\t\\\\\n'],i,U(1,i),I(1,i),U(2,i),I(2,i));
    fprintf(fid,'\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fprintf(fid,'\\caption{Measurement Data for the $U$ vs. $I$ relation (100 cm/120 cm configuration).}\n');
fprintf(fid,'\\label{tab-5}\n\\end{center}\n\\end{table}\n\n');

fprintf(fid,'\\newpage\n\n');

fprintf(fid,'The measurement of two solar cells was shown in Table \\ref{tab-6}.\\\\\n\n');
fprintf(fid,'\\begin{table}[!h]\n\\begin{center}\n');
fprintf(fid,'\\begin{tabular}{|c|c|c|c|c|}\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'&\\multicolumn{2}{|c|}{100 cm}&\\multicolumn{2}{|c|}{120 cm}\\\\\n');
fprintf(fid,'\\hline\n');
fprintf(fid,'& $U$ [V] & $I$ [mA] & $U$ [V] & $I$ [mA] \\\\\n');
fprintf(fid,'\\hline\n');
for i=1:25
    fprintf(fid,['%d\t&\t%.2f\t&\t%.1f\t&\t%.2f\t&\t%.1f\t\\\\\n'],i,U(3,i),I(3,i),U(4,i),I(4,i));
    fprintf(fid,'\\hline\n');
end
fprintf(fid,'\\end{tabular}\n');
fprintf(fid,'\\caption{Measurement Data for the $U$ vs. $I$ relation (series/parallel configuration).}\n');
fprintf(fid,'\\label{tab-6}\n\\end{center}\n\\end{table}\n\n');

fprintf(fid,'\\newpage\n\n');


for i=1:4
    switch(i)
        case 1 
            name='the first 100 cm circuit';
        case 2 
            name='the second 120 cm circuit';
        case 3 
            name='the third series circuit';
        case 4 
            name='the fourth parallel circuit';
    end
    fprintf(fid,'For %s,\\\\\n\n',name); 
    [Pm,mi]=max(P(i,:));
    uPm=uP(i,mi);
    Um=U(i,mi);uUm=uU(i,mi);
    Im=I(i,mi);uIm=uI(i,mi);
    Rm=R(i,mi);uRm=uR(i,mi);
    FF=Pm/Isc(i)/Uoc(i);
    eta=Pm/Pin(i)/10;
    uFF=sqrt(1./Pc(i).^2.*uPm.^2+Pm.^2./Pc(i).^4.*uPc(i).^2);
    ueta=sqrt(1./Pin(i).^2.*uPm.^2+Pm.^2./Pin(i).^4.*uPin(i).^2)/10;
    
    
    fig1=['IV' num2str(i) '.png'];
    fig2=['PV' num2str(i) '.png'];
    fig3=['PR' num2str(i) '.png'];
    
    fprintf(fid,'The compiled data was shown in Table \\ref{tab-com-%d}.\\\\\n\n',i);
    fprintf(fid,'\\begin{table}[!h]\n\\begin{center}\n');
    fprintf(fid,'\\begin{tabular}{|c|c|c|c|c|}\n');
    fprintf(fid,'\\hline\n');
    fprintf(fid,'& $U$ [V] & $I$ [mA] & $P$ [mW] & $R$ [$\\rm \\Omega$] \\\\\n');
    fprintf(fid,'\\hline\n');
    for j=1:25
        fprintf(fid,['%d\t&\t$%.2f \\pm %.2f$\t&\t$%.1f \\pm %.1f$\t&\t$%.2f \\pm %.2f$\t&\t$%.2f \\pm %.2f$\t\\\\\n'],j,U(i,j),uU(i,j),I(i,j),uI(i,j),P(i,j),uP(i,j),R(i,j),uR(i,j));
        fprintf(fid,'\\hline\n');
    end
    fprintf(fid,'\\end{tabular}\n');
    fprintf(fid,'\\caption{Compiled data for %s.}\n',name);
    fprintf(fid,'\\label{tab-com-%d}\n\\end{center}\n\\end{table}\n\n',i);
    
    
    fprintf(fid,'$$I_{sc}=%.1f\\pm%.1f\\,{\\rm mA},\\quad U_{oc}=%.2f\\pm%.2f\\,{\\rm V}$$\n',Isc(i),uIsc(i),Uoc(i),uUoc(i));
    fprintf(fid,'$$P_m=%.2f\\pm%.2f\\,{\\rm mW},\\quad I_m=%.1f\\pm%.1f\\,{\\rm mA},\\quad U_m=%.2f\\pm%.2f\\,{\\rm V}$$\n',Pm,uPm,Im,uIm,Um,uUm);
    fprintf(fid,'$$R_m=\\frac{U_m}{I_m}=%.2f\\pm%.2f\\,{\\rm \\Omega}$$\n',Rm,uRm);
    fprintf(fid,'$$FF=\\frac{P_m}{U_{oc}I_{sc}}=%.3f\\pm%.3f$$\n',FF,uFF);
    fprintf(fid,'$$\\eta=\\frac{P_m}{P_{in}}=%.2f\\pm%.2f\\,\\%%$$\n',eta,ueta);
    fprintf(fid,'$$$$\n\n');
    
    plot(U(i,:),I(i,:),'.','MarkerSize',10);
    xlabel('U / V');
    ylabel('I / mA');
    saveas(gcf,fig1);
    fprintf(fid,'The $I-V$ characteristics curve is plotted in Figure \\ref{IV-%d}.\n',i);
    fprintf(fid,'\\begin{figure}[H]\n');
	fprintf(fid,'\\centering\n');
	fprintf(fid,'\\includegraphics[scale=0.6]{%s}\n',fig1);
	fprintf(fid,'\\caption{The $I-V$ characteristics curve.}\n');
    fprintf(fid,'\\label{IV-%d}\n',i);
    fprintf(fid,'\\end{figure}\n');
    
    plot(U(i,:),P(i,:),'.','MarkerSize',10);
    xlabel('U / V');
    ylabel('P / mW');
    saveas(gcf,fig2);
    fprintf(fid,'The graph of the output power vs. the vlotage is plotted in Figure \\ref{PV-%d}.\n',i);
    fprintf(fid,'\\begin{figure}[H]\n');
	fprintf(fid,'\\centering\n');
	fprintf(fid,'\\includegraphics[scale=0.6]{%s}\n',fig2);
	fprintf(fid,'\\caption{The graph of the output power vs. the voltage.}\n');
    fprintf(fid,'\\label{PV-%d}\n',i);
    fprintf(fid,'\\end{figure}\n');
    
    plot(R(i,:),P(i,:),'.','MarkerSize',10);
    xlabel('$$R / \Omega$$','Interpreter','latex');
    ylabel('P / mW');
    saveas(gcf,fig3);
    fprintf(fid,'The graph of the output power vs. the resistance is plotted in Figure \\ref{PR-%d}.\n',i);
    fprintf(fid,'\\begin{figure}[H]\n');
	fprintf(fid,'\\centering\n');
	fprintf(fid,'\\includegraphics[scale=0.6]{%s}\n',fig3);
	fprintf(fid,'\\caption{The graph of the output power vs. the resistance.}\n');
    fprintf(fid,'\\label{PR-%d}\n',i);
    fprintf(fid,'\\end{figure}\n');
    
    fprintf(fid,'$$$$\n\n');
end

fclose(fid);


