function grafica_raices(polinomio)
raices=roots(polinomio);
x=real(raices);
y=imag(raices);
plot(x,y, 'marker', 'x','linewidth', 2.0, 'linestyle', 'none', 'color', 'b');
title('Grafica de las raices de su polinomio');
grid on
grid minor
ylabel('Im')
xlabel('R')