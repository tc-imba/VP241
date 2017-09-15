I=[6.728 6.667 6.519 6.303 5.966 5.542 5.078 4.536 3.989 3.343 2.781 2.227 1.697 1.141 0.708 0.399 0.136 -0.012 -0.063];
I0=6.852;
y=I./I0;
x=cos(0:pi/36:pi/2).^2
plot(x,y,'.');
[curve, goodness]=fit(x',y','poly1');
hold on;
plot(curve);
hold off;
title(['$$k=' num2str(curve.p1) '\pm0.0003$$'],'Interpreter','latex');
legend('data','fitted curve','Location','Northwest');
xlabel('$$\cos^2(\theta)$$','Interpreter','latex');
ylabel('$$I/I_0$$','Interpreter','latex');
saveas(gcf,'fig1.png');