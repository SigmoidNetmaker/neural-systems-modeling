% forwardLatInhib.m
% this script implements the forward lateral inhibition examples

% p=zeros(1,51); 
% p(1)=2;
% p(2)=-1;
% p(51)=-1;
% pCenter=[p(27:51) p(1:26)];
% s=-25:25;

% p=-p;
% p=p*2;

% V=shiftLam(p);

% colormap([0 0 0])
% clf
% subplot(121)
% plot(s,pCenter,'k','linewidth',2)
% axis square
% axis([-25 25 -1.1 2.1])
% set(gca,'xtick',[-25 0 25])
% xlabel('space','fontsize',14)
% ylabel('weight','fontsize',14)
% text(-22,1.8,'A','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(122)
% mesh(V,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -1.1 2.1])
% set(gca,'xtick',[0 25 50])
% set(gca,'ytick',[0 25 50])
% xlabel('in num','fontsize',14)
% ylabel('out num','fontsize',14)
% zlabel('weight','fontsize',14)
% text(1,45,1.9,'B','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% return

% colormap([0 0 0])
% clf
% mesh(V,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -1.1 2.1])
% title('Figure 3.4B')
% return

% x=ones(51,1);
% x(17:36)=3;
% y=V*x;
% s=-25:25;
% 
% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 -2.5 3.5])
% legend('inputs','outputs')
% xlabel('spatial position','fontsize',14)
% ylabel('input activities and output responses','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return
% 
% q=V*x;
% y=1./(1+exp(-q));
% 
% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 0 4])
% legend('inputs','outputs')
% xlabel('spatial position','fontsize',14)
% ylabel('unit activities','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)

% return

% fsdx=diff(x);
% fsdx=[fsdx;0]-1.5;
% ssdx=diff(fsdx);
% ssdx=[ssdx;0]-6;
% clf
% plot(s,x,'k--',s,fsdx,'k-.',s,ssdx,'k','linewidth',2)
% axis([-25 25 -12 4])
% set(gca,'ytick',[])
% legend('input','first','second')
% xlabel('spatial position','fontsize',14)
% ylabel('spatial derivatives','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return

% p=zeros(1,51); 
% p(1)=2;
% p(2)=-1;
% p(51)=-1;
% p=p*2;
% V=shiftLam(p);
% x=ones(51,1);
% x(17:36)=x(17:36)*3;
% y=V*x;
% s=-25:25;

% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 -5 5])
% legend('inputs','outputs')
% xlabel('spatial position','fontsize',14)
% ylabel('unit activities','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return

% q=V*x;
% y=1./(1+exp(-q));

% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 0 4])
% legend('inputs','outputs')
% xlabel('spatial position','fontsize',14)
% ylabel('unit activities','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return

% p=zeros(1,51); 
% p(1)=-2;
% p(2)=1;
% p(51)=1;
% V=shiftLam(p);
% x=ones(51,1);
% x(17:36)=x(17:36)*3;
% y=V*x;
% s=-25:25;

% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 -2.5 3.5])
% legend('inputs','outputs')
% xlabel('spatial position','fontsize',14)
% ylabel('unit activities','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return

g=gaussPro(s,0.75);
d=gaussPro(s,1.5);

p=g-(0.5*d);
pCenter=p;
p=[p(26:51) p(1:25)];
V=shiftLam(p);
s=-25:25;

% colormap([0 0 0])
% clf
% subplot(121)
% plot(s,pCenter,'k','linewidth',2)
% axis square
% axis([-26 26 -0.22 0.55])
% set(gca,'xtick',[-20 -10 0 10 20])
% xlabel('space','fontsize',14)
% ylabel('weight','fontsize',14)
% text(-23,0.47,'A','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(122)
% mesh(V,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% set(gca,'xtick',[0 25 50])
% set(gca,'ytick',[0 25 50])
% xlabel('in num','fontsize',14)
% ylabel('out num','fontsize',14)
% zlabel('weight','fontsize',14)
% text(0,45,0.55,'B','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% return

% colormap([0 0 0])
% clf
% mesh(V,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% title('Figure 3.11B')
% return

% x=ones(51,1);
% x(17:36)=x(17:36)*3;
% y=V*x;
% 
% clf
% plot(s,x,'k--',s,y,'k','linewidth',2)
% axis([-25 25 -1.5 3.5])
% legend('input','output')
% xlabel('spatial position','fontsize',14)
% ylabel('input activities and output responses','fontsize',14)
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% return

g1=gaussPro(s,0.75);
d1=gaussPro(s,1.5);
p1=g1-(0.5*d1);
g2=gaussPro(s,1.5);
d2=gaussPro(s,3);
p2=g2-(0.5*d2);
g3=gaussPro(s,3);
d3=gaussPro(s,6);
p3=g3-(0.5*d3);

p1Center=p1;
p2Center=p2;
p3Center=p3;

p1=[p1(26:51) p1(1:25)];
p2=[p2(26:51) p2(1:25)];
p3=[p3(26:51) p3(1:25)];

V1=shiftLam(p1);
V2=shiftLam(p2);
V3=shiftLam(p3);

% colormap([0 0 0])
% clf
% subplot(221)
% plot(s,p2Center,'k','linewidth',2)
% axis square
% axis([-26 26 -0.22 0.55])
% set(gca,'xtick',[-20 -10 0 10 20])
% xlabel('space','fontsize',14)
% ylabel('weight','fontsize',14)
% text(-23,0.47,'A','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(222)
% mesh(V2,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% set(gca,'xtick',[0 25 50])
% set(gca,'ytick',[0 25 50])
% xlabel('in num','fontsize',14)
% ylabel('out num','fontsize',14)
% zlabel('weight','fontsize',14)
% text(0,45,0.55,'B','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(223)
% plot(s,p3Center,'k','linewidth',2)
% axis square
% axis([-26 26 -0.22 0.55])
% set(gca,'xtick',[-20 -10 0 10 20])
% xlabel('space','fontsize',14)
% ylabel('weight','fontsize',14)
% text(-23,0.47,'C','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(224)
% mesh(V3,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% set(gca,'xtick',[0 25 50])
% set(gca,'ytick',[0 25 50])
% xlabel('in num','fontsize',14)
% ylabel('out num','fontsize',14)
% zlabel('weight','fontsize',14)
% text(0,45,0.55,'D','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% return

% colormap([0 0 0])
% clf
% mesh(V2,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% title('Figure 3.13B')
% return

% colormap([0 0 0])
% clf
% mesh(V3,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.22 0.55])
% title('Figure 3.13D')
% return

x=ones(51,1);
x([16,17,20,21,24,25,28,29,32,33,36,37])=3;

y1=V1*x;
y2=V2*x;
y3=V3*x;
s=-25:25;

clf
plot(s,x,'k--',s,y1,'k',s,y2,'k:',s,y3,'k-.','linewidth',2.5)
axis([-25 25 -1.5 3.5])
legend('input','out1','out2','out3')
xlabel('spatial position','fontsize',14)
ylabel('input activities and output responses','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)





