
% SOMoutImage.m
% this script will image the output of SOM maps
% (note: KohonenSOM must be run first)

inImage=zeros(nPat,nIn,3); % declare 3D input image array
outImage=zeros(nPat,nOut,3); % declare 3D output image array
inImage(:,:,1)=InPat; % for black-and-white, set each
inImage(:,:,2)=InPat; % dimension of the input image array
inImage(:,:,3)=InPat; % to the same intensity value
hld=Out; % place the output array in a hold array
hld=hld-min(min(hld)); % subtract the minimum value
hld=hld./max(max(hld)); % scale by the new maximal value
outImage(:,:,1)=hld; % for black-and-white, set each 
outImage(:,:,2)=hld; % dimension of the output image array
outImage(:,:,3)=hld; % to the same intensity value
subplot(121) % open a subplot
image(inImage) % image the input pattern array
set(gca,'fontsize',14) % set the fontsize
xlabel('input unit number') % add an x-axis label
ylabel('input pattern number') % add a y-axis label
text(0,0.4,'A','fontsize',14) % label panel A
subplot(122) % open another subplot
image(outImage) % image the output array
% set(gca,'xtick',[1 2 3]) % set the output unit ticks
set(gca,'fontsize',14) % set the fontsize
xlabel('output unit number') % add an x-axis label
ylabel('input pattern number') % add a y-axis label
text(0,0.4,'B','fontsize',14) % label panel B



