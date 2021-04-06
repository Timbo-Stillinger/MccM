function [cnnMasks, Rs] = runMccM(fileGA,net)
%RUNCNNCLOUDMASK Run MODIS Deep Learning cloud mask on MOD09GA data
%load('net.mat','net')
Rs=GetMOD09GA( fileGA, 'allbands' );
S=GetMOD09GA(fileGA,'state');
cm=S.cloud==1|S.cloud==2;%yes and maybe
cm=imresize(cm,2);
%physical info bands
numBands=7;
[I,ndvi]=pxFeatures(Rs,numBands);
%scale to integers for CNN
scaleFactor=10000;
I=int16(I.*scaleFactor);

tic
C = semanticseg(I,net);%,"WriteLocation",tempdir);
toc

%water test-exclude water pixels from mask (Zhe Zhu's FMask test)
nir=Rs(:,:,2);
water=(ndvi<0.01&nir<0.11)|(ndvi<0.1&ndvi>0&nir<.05);
snow=C=='snow';
cnnMasks.snow=C=='snow';
cnnMasks.cloud=C=='cloud';%&~water;
cnnMasks.neither=C=='neither';%|water;
cnnMasks.fill=C~='snow'&C~='cloud'&C~='neither';
cnnMasks.mod_opcm=cm&~snow;
cnnMasks.opcm=cm;
end

