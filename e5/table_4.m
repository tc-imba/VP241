UR=[132 268 416 608 816 1160 1580 2320 2680 3160 3600 3800 3680 3360 2920 2680 2080 1680 1440 1280 1140 992];
f=[500:500:4000 4250:250:6000 6500:500:9000];
w=2*pi.*f;
f_0=5032;
L=0.01;
C=102.45e-9;
R=96.95;
phi=atan((w.*L-1./(w.*C))./R);
I=UR./R;
Im=max(I);

u_L=0;
u_C=0.01e-9;
u_R=0.01;
u_w=2*pi*0.001;

u_phi=1./(1+((w.*L-1./(w.*C))./R).^2).*sqrt((w./R.*u_L).^2+(1./(w.*R.*C).*u_C).^2+((w.*L-1./(w.*C))./R.^2.*u_R).^2+(L/R-1./(w.^2*R.*C).*u_w).^2);

fid=fopen('table_4.tex','w+');
fprintf(fid,'\\hline\n');
for i=1:length(UR)
    fprintf(fid,['%d\t&\t%d\t&\t%.3f\t&\t$%.3f\\pm%.3f$\t\\\\\n'],i,UR(i),f(i),phi(i),u_phi(i));
    fprintf(fid,'\\hline\n');
end

figure(1);
x=I./Im;
y=f./f_0;
plot(x,y,'.','Markersize',10);
xlabel('$I/I_m$','Interpreter','latex');
ylabel('$f/f_0$','Interpreter','latex');
saveas(gcf,'4_1.eps');

figure(2);
plot(phi,y,'.','Markersize',10);
xlabel('$\phi$','Interpreter','latex');
ylabel('$f/f_0$','Interpreter','latex');
saveas(gcf,'4_2.eps');


fclose(fid);


