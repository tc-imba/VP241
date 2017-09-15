x=0:10:90;
y=[0 20 40 60 80 100 118 138 156 174];
plot(x,y,'.');
[curve, goodness]=fit(x',y','poly1');
hold on;
plot(curve);
hold off;
title(['$$k=' num2str(curve.p1) '\pm0.0310$$'],'Interpreter','latex');
legend('data','fitted curve','Location','Northwest');
xlabel('$$\theta_1$$','Interpreter','latex');
ylabel('$$\theta_2$$','Interpreter','latex');
saveas(gcf,'fig2.png');