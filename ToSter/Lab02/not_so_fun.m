function [ou1,out2] = not_so_fun(Atemp,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
assignin('base', 'A', Atemp);
A = Atemp;
[w J]=eig(A); 
figure; hold on; grid on; 
a=0:(pi/10):(2*pi); X1=[cos(a); sin(a)]; 
X2=X1./[max(abs(X1));max(abs(X1))];M=size(X2,2); 
for l=1:M 
x0=X2(:,l); 
assignin('base', 'x0', x0);
x = sim('my_model',T);
x = x.x.Data;
plot(x(:,1),x(:,2),'k-'); 
plot([0,w(1,1)],[0,w(2,1)],'k-',[0,w(1,2)],[0,w(2,2)],'k-'); 
title(['lambda (A)=[ ',num2str(J(1,1)),', ',num2str(J(2,2)),' ]']); 
xlabel('x1');ylabel('x2'); 
end 

out1 = 1;
out2 = 2;
end