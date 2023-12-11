% pertDistributedRep.m
% this script trains three-layered pattern associating networks 
% using parallel weight perturbation via directed drift


nHid=100;
[nPat,nIn]=size(InPat); % determine number of input units
[nPat,nOut]=size(DesOut); % determine number of output units
Out=zeros(nPat,nOut); % set up output hold array
b=1;

V=randn(nHid,nIn+1);
U=randn(nOut,nHid+1);




% set output hold matrices
Hid=zeros(nHid,nPat);
Out=zeros(nOut,nPat);

% set up a bais vector
B=b*ones(nPat,1);

% stick the bias on the input
% patterns
INb=[InPat B]';

% set learning parameters
a=0.01;
tol=0.1;

% determine initial error
Qhid=V*INb;
Hid=1 ./(1+(exp(-Qhid)));
HidB=[Hid' B]';
Qout=U*HidB;
Out=1 ./(1+(exp(-Qout)));
error=sum(abs(DesOut-Out'));

% zero counter
count=0;

% trian network
while error > tol,
    pertV=randn(nHid,nIn+1)*a;
    pertU=randn(nOut,nHid+1)*a;
    holdV=V;
    holdU=U;
    V=holdV+pertV;
    U=holdU+pertU;
    Qhid=V*INb;
    Hid=1 ./(1+(exp(-Qhid)));
    HidB=[Hid' B]';
    Qout=U*HidB;
    Out=1 ./(1+(exp(-Qout))); 
    newErr=sum(abs(DesOut-Out'));
    if newErr>=error,
        V=holdV;
        U=holdU;
    elseif newErr<error,
        error=newErr;
    end
    count=count+1;
end

% determine output

Qhid=V*INb;
Hid=1 ./(1+(exp(-Qhid)));
HidB=[Hid' B]';
Qout=U*HidB;
Out=1 ./(1+(exp(-Qout)));
[DesOut Out']
error
count

% plot out responses
plot(Hid(:,2), Hid(:,3), 'k*', Out(:,2), Out(:,3), 'k+')
axis([0 1.1 0 1.1])
xlabel('response to input 1')
ylabel('response to input 2')

            
        
