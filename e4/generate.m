function generate(I,I0,angle)
    m=min(I);
    if(m<0)
        I=I-m;
        I0=I0-m;
    end
    R=I./I0;
    uR=sqrt((0.001/I0)^2+(I.*0.001./I0^2).^2);
    fid=fopen(['table_' num2str(angle) '.tex'],'w+');
    fprintf(fid,'The measurement of current $I$ was shown in Table \\ref{tab-deg-%d}.\n',angle);
    fprintf(fid,'\\begin{table}[!h]\n');
    fprintf(fid,'\\begin{center}\n');
    fprintf(fid,'\\begin{tabular}{|c|c|c||c|c|c|}\n');
    fprintf(fid,'\\hline\n');
    fprintf(fid,'\\multicolumn{6}{|c|}{Rotation angle of 1/4-wave plate: $%d^\\circ$}\\\\\n',angle);
    fprintf(fid,'\\hline\n');
    fprintf(fid,'\\multicolumn{6}{|c|}{Maximum Electric Current $I_0$ $%.3f\\pm0.001$ [$\\mu A$]}\\\\\n',I0);
    fprintf(fid,'\\hline\n');
    fprintf(fid,'$\\theta$&$I[\\mu A]\\pm0.01[\\mu A]$&$I/I_0$&$\\theta$&$I[\\mu A]\\pm0.01[\\mu A]$&$I/I_0$\\\\\n');
    fprintf(fid,'\\hline\n');
    for i=1:18
        fprintf(fid,'$%d^\\circ$\t&\t%.3f\t&\t$%.3f\\pm%.4f$\t&\t',10*(i-1),I(i),R(i),uR(i));
        fprintf(fid,'$%d^\\circ$\t&\t%.3f\t&\t$%.3f\\pm%.4f$\t\\\\\n',10*(i+17),I(i+18),R(i+18),uR(i+18));
        fprintf(fid,'\\hline\n');
    end
    fprintf(fid,'\\end{tabular}\n');
    fprintf(fid,'\\caption{Measurement data for the 1/4-wave plate (rotation angle $%d^\\circ$).}',angle);
    fprintf(fid,'\\label{tab-deg-%d}\n',angle);
    fprintf(fid,'\\end{center}\n');
    fprintf(fid,'\\end{table}\n');
    theta=0:pi/18:35*pi/18;
    polar(theta,R,'.');
    if(angle==45)
        hold on;
        X=0:pi/72:2*pi;
        Y=spline(theta,R,X);
        polar(X,Y,'r');
        hold off;
    end
    saveas(gcf,['deg-' num2str(angle) '.png']);
    fprintf(fid,'\nThe relation between rotation angle and light intensity was plotted in Figure \\ref{fig-deg-%d}.\n',angle);
    fprintf(fid,'\\begin{figure}[H]\n');
	fprintf(fid,'\\centering\n');
	fprintf(fid,'\\includegraphics[scale=0.5]{deg-%d.png}\n',angle);
	fprintf(fid,'\\caption{$\\theta$ vs. $I/I_0$ graph.}\n');
    fprintf(fid,'\\label{fig-deg-%d}\n',angle);
    fprintf(fid,'\\end{figure}\n');
    fclose(fid);
end

