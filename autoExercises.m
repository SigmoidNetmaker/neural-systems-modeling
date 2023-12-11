% script autoExercises.m
% this script does some of the auto-associator exercises

% % first pattern set
% P = [ 1 1 1 1 1 0 0 0 0 0
%       0 0 0 0 0 1 1 1 1 1 ];
%   
% autoConnectivity
% 
% yInitial=[0.4 0.3 0.5 0.3 0.4 0.2 0.1 0.1 0.2 0.1]';
% Yamp=AsynchUp(yInitial,HP,100);
% [r,c]=size(Yamp);
% YampIm=zeros(r,c,3);
% YampIm(:,:,1)=Yamp;
% YampIm(:,:,2)=Yamp;
% YampIm(:,:,3)=Yamp;
% 
% clf
% image(YampIm)
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% xlabel('units','fontsize',14)
% ylabel('\leftarrow updates \leftarrow','fontsize',14)
% return

% % Hopfield covariance capacity
% prob=0.5;
% nUnits=20;
% nPats=5;
% err=zeros(1,nPats);
% for iP=1:nPats
%     P=double(prob>rand(iP,nUnits));
%     autoConnectivity
%     for j=1:iP,
%         yInitial=0.5*P(j,:)';
%         Y=AsynchUp(yInitial,HP,100);
%         err(iP)=err(iP)+sum(abs(P(j,:)-Y(11,:)));
%     end
%     err(iP)=err(iP)/iP;
% end
% err
% return

% % Hebb capacity
% prob=0.1;
% nUnits=20;
% nPats=5;
% err=zeros(1,nPats);
% for iP=1:nPats
%     P=double(prob>rand(iP,nUnits));
%     autoConnectivity
%     for j=1:iP,
%         yInitial=0.5*P(j,:)';
%         Y=AsynchUp(yInitial,HB,100);
%         err(iP)=err(iP)+sum(abs(P(j,:)-Y(11,:)));
%     end
%     err(iP)=err(iP)/iP;
% end
% err
% return

% optimal capacity
prob=0.2;
nUnits=20;
nPats=5;
err=zeros(1,nPats);
for iP=1:nPats
    P=double(prob>rand(iP,nUnits));
    [m,n] = size(P);
    OP=(P'-prob)*(P-prob);
    MSK = (ones(n) - eye(n));
    OP=OP.*MSK;
    for j=1:iP,
        yInitial=0.5*P(j,:)';
        Y=AsynchUp(yInitial,OP,100);
        err(iP)=err(iP)+sum(abs(P(j,:)-Y(11,:)));
    end
    err(iP)=err(iP)/iP;
end
err




