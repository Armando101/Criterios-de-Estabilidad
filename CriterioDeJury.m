function [J,cc,est] = CriterioDeJury(m,p)
clc
disp('Criterio de estabilidad de Jury');
%while 1 
%    n=input('Ingrese el orden de su polinomio\n');
%    home
%    if n==0
%        fprintf('Polinomio no valido, Ingrese nuevamente\n');
%    else
%        break;
%    end
%end
%p=[1:n];
%fprintf('Ingrese un polinomio\n');
%for i=0:n
%    fprintf('\nCoeficiente %d: ', i+1);
%    p(i+1)=input('');
%end
disp('Su polinomio es')
disp(p);
disp(poly2sym(p))

J = [p;flipdim(p,2)];
n = length(p)-1;

for i=3:2:(2*n+1)
        try
            alph = J(i-1,1)/J(i-2,1);
        catch
            disp('Tu polinomio no puede ser formado correctamente')
            rethrow(lasterror);
            break;
        end
        col= J(i-2,:)-alph*J(i-1,:);
        J = [J ; col ; [flipdim(col(1:end-(i-1)/2),2) , zeros(1,(i-1)/2)] ];
end
J = J(1:end-1,:)
%C = J(3:1:end,1);
% count=0;
%for i=1:2:length(C)
%    if i==length(C)
%        break
%    end
%    if C(i)<C(i+1)
%        count = count + 1;
%    end
%end
a=(real(roots(p)))';
cc=0;
for i=1:length(a)
    if a(i)>0.001
        cc=cc+1;
    end
end
est= m-cc;
m
fprintf('El numero de polos inestables es: %d\n ',cc);
fprintf('El numero de polos estables es: %d \n',est);