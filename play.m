% script play.m
% this script just does some
% of the intorductory exercises
%

% Gauss busywork problem
x=1:100;
y=x';
z=reshape(y,50,2);
z(:,2)=flipud(z(:,2));
s=sum(z')';
sprintf('Gauss busywork problem')
B=[z s]

pause

% inner/outer product problem
v=[1 2 3]'
v=v/norm(v)
v'*v

pause

v1=[1 0 1 0 1 0]'
v2=[0 1 0 1 0 1]'
v1'*v2

pause

v=[1 2 3]'
cm=v*v'
v3=[9 8 7]'
v4=cm*v3
[v/norm(v) v4/norm(v4)]

pause

% sine-cosine dot product 
th=linspace(0,8*pi,100);
s1=sin(th);
c1=cos(th);
clf
plot(th,s1,th,c1)
axis([0 25 -1.1 1.1])
xlabel('theta')
ylabel('sine or cosine')
title('Four Cycles of a Sine and Cosine')
s1*c1'

pause

% exponentially decaying sine
s2=sin(2*th);
e2=exp(-th/10);
es2=s2.*e2;
n2=randn(1,100)*0.1;
nes2=es2+n2;
clf
subplot(411)
plot(th,s2)
axis([0 25 -1.1 1.1])
ylabel('sine')
title('Decaying Sine with Noise')
subplot(412)
plot(th,e2)
axis([0 25 0 1.1])
ylabel('decay')
subplot(413)
plot(th,es2)
axis([0 25 -1.1 1.1])
ylabel('sine decay')
subplot(414)
plot(th,nes2)
axis([0 25 -1.1 1.1])
ylabel('plus noise')
xlabel('radians (or "time")')

pause
 
% probability problem
n4=rand(10);
prob=0.5;
d4=n4>prob;
clf
subplot(211)
mesh(n4)
xlabel('column')
ylabel('row')
zlabel('value')
subplot(212)
spy(d4)
xlabel('column')
ylabel('row') 

pause

% running average
m3=5;
v3=20;
sd3=sqrt(v3);
its=100;
n3=randn(1,its)*sd3+m3;
mean(n3)
ct=1;
ra=zeros(1,its);
ra(1)=n3(1);
for i=2:its;
    ra(i)=ra(i-1) + (n3(i)-ra(i-1))/(ct+1);
    ct=ct+1;
end
ra(100)
clf
subplot(211)
plot(1:its,n3)
ylabel('noise')
title('Noise and Running Average')
subplot(212)
plot(1:its,ra)
ylabel('running average')
xlabel('time (or index number)')






