% pertDistributedRep.m
% this script trains three-layered pattern associating networks 
% using parallel weight perturbation via directed drift
% input InPat and desired output DesOut patterns must be supplied

% nHid=1; % set number of hidden units
[nPat,nIn]=size(InPat); % determine number of input units
[nPat,nOut]=size(DesOut); % determine number of output units
Hid=zeros(nHid,nPat); % set up hidden unit hold array
Out=zeros(nOut,nPat); % set up output hold array
V=randn(nHid,nIn+1); % randomize input-hidden weights V
U=randn(nOut,nHid+1); % randomize hidden-output weights U
b=1; % set the bias
B=b*ones(nPat,1); % set up a bias vector
INb=[InPat B]'; % concatenate bias to the inputs
a=0.01; % set learning rate
tol=0.1; % set error tolerance within which training is adequate
count=0; % zero the counter
countLimit=10000; % set count limit over which training stops

Qhid=V*INb; % find weighted input sum to hidden units
Hid=1 ./(1+exp(-Qhid)); % squash to find hidden unit responses
HidB=[Hid' B]'; % concatenate bias to hidden unit responses
Qout=U*HidB; % find weighted input sum to output units
Out=1 ./(1+exp(-Qout)); % squash to find output unit responses
error=sum(sum(abs(DesOut-Out'))); % initial error over all patterns

while error > tol, % while actual error is over tolerance
    PertV=a*randn(nHid,nIn+1); % make perturbation matrix for V
    PertU=a*randn(nOut,nHid+1); % make perturbation matrix for U
    holdV=V; % hold the current input-hidden weight matrix V
    holdU=U; % hold the current hidden-output weight matrix U
    V=V+PertV; % apply perturbation to weights in V
    U=U+PertU; % apply perturbation to weights in U
    Qhid=V*INb; % find weighted input sum to hidden units
    Hid=1./(1+exp(-Qhid)); % squash to find hidden responses
    HidB=[Hid' B]'; % concatenate bias to hidden unit responses
    Qout=U*HidB; % find weighted input sum to output units
    Out=1./(1+exp(-Qout)); % squash to find output unit responses
    newErr=sum(sum(abs(DesOut-Out'))); % new error over all patterns
    if newErr>=error, % if the perturbation increases the error
        V=holdV; % then remove weight perturbation matrix from V
        U=holdU; % and remove weight perturbation matrix from U
    elseif newErr<error, % leave perturbation if it decreased error 
        error=newErr; % save new error as the error
    end % end conditional
    count=count+1; % increment the counter
    if count>countLimit, break, end % break if counter over limit
end % end training loop


return

Qhid=V*INb; % find weighted input sum to hidden units
Hid=1 ./(1+exp(-Qhid)); % squash to find hidden responses
HidB=[Hid' B]'; % concatenate bias to hidden unit responses
Qout=U*HidB; % find weighted input sum to output units
Out=1 ./(1+exp(-Qout)); % squash to find output unit responses
[DesOut Out'] % show desired and actual output after training
error % show error after training
count % show number of training iterations

% plot out responses
fs=18; % set font size
lw=2; % set line width
plot(Hid(:,2), Hid(:,3), 'k*', Out(:,2), Out(:,3), 'k+')
hold
plot([0 1],[0 1],'k--','linewidth',1)
hold
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('response to input one','fontsize',fs)
ylabel('response to input two','fontsize',fs)


        
