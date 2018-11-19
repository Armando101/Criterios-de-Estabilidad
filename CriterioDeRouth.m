clear all;
clc
disp('Criterio de estabilidad de Routh');
while 1 
    n=input('Ingrese el orden de su polinomio\n');
    home
    if n==0
        fprintf('Polinomio no valido, Ingrese nuevamente\n');
    else
        break;
    end
end
p=[1:n];
fprintf('Ingrese un polinomio\n');
for i=0:n
    fprintf('\nCoeficiente %d: ', i+1);
    p(i+1)=input('');
end
disp('Su polinomio es')
disp(p);
disp(poly2sym(p))
r=mod(n+1,2);
g(1,:)=p(1:2:n+1);

if r==0
    g(2,:)=p(2:2:n+1);
else
    N=n+2;
    p(N)=0;
    g(2,:)=p(2:2:N);
end
lim=round((n+1)/2);
for i=3:1:n+1
        m=1;
        for j=1:1:lim
            m=m+1;
            if m<=lim
                g(i,j)=((g(i-1,1)*g(i-2,m))-(g(i-2,1)*g(i-1,m)))/g(i-1,1);  
            end
        end        
end

fprintf('La matriz obtenida es: ');
g
h=size(g);
for i=1:h(1)
    if g(i)==0
        disp('El arreglo correspondiente no se puede formar correctamente');
        return
    end
end
for i=1:h(1)
    Aux=g(i,:);
    if Aux==zeros(1,h(2))
        disp('El arreglo correspondiente no se puede formar correctamente');
        return
    end
end


a=(real(roots(p)))';
cc=0;
for i=1:length(a)
    if a(i)>0.001
        cc=cc+1;
    end
end
fprintf('El numero de polos inestables es: %d\n ',cc);
fprintf('El numero de polos estables es: %d \n',length(a)-cc);