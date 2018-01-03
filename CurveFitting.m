function [answer]=CurveFitting
B=xlsread('data');
%A=sortrows(B,1);
A=B;
A(:,2)=-B(:,2);
[k,~]=size(A);
answer=zeros;
for n=2:10
    X0=zeros(n+1,k);
    for k0=1:k               %�������X0
        for n0=1:n+1
            X0(n0,k0)=A(k0,1)^(n+1-n0);
        end
    end
    X=X0';
   %ANSS=inv(X'*X)*X'*A(:,2)%ANSS=vpa((X'*X)\X'*A(:,2))
   ANSS=(X'*X)\X'*A(:,2);
   for i=1:n+1              %answer����洢ÿ����õķ���ϵ�������д洢
       answer(i,n-1)=ANSS(i);
   end
    x=-10:0.01:90;
    y=ANSS(1)*x.^n;          ;%������õ�ϵ����ʼ�����������ʽ����
    for num=2:1:n+1
        y=y+ANSS(num)*x.^(n+1-num);
    end
    subplot(3,3,n-1)
    plot(A(:,1),A(:,2),'*')
    hold on
    plot(x,y)
end
suptitle('��ͬ��������������Ͻ������2��10')