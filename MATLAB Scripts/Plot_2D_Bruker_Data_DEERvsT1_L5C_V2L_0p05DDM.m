clear all, clc ,clf

% This script performs background subtraction of T1 edited DEER data

%% Loading the data
path1 = 'C:\Users\tufa_\Documents\Amyloid Octamer Paper\Data\DEER\'; 
filename1 ='20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1.DTA';
filename2 ='20260113_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_T1-edited_DEER_T140us.DTA';

[T1,spec1,pars1] = eprload([path1 filename1]);
[T2,spec2,pars2] = eprload([path1 filename2]);

spec1 = spec1-26000; % offset value
spec1 = spec1-26000i; % offset value for imaginary too

spec2 = spec2-3000000; % offset value
spec2 = spec2-3000000i; % offset value for imaginary too

T1us(:,1) = T1{1,1}.';
T1us(:,2) = real(spec1(:,1));
T1us(:,3) = imag(spec1(:,1));
T2us(:,1) = T1{1,1}.';
T2us(:,2) = real(spec1(:,2));
T2us(:,3) = imag(spec1(:,2));
T3us(:,1) = T1{1,1}.';
T3us(:,2) = real(spec1(:,3));
T3us(:,3) = imag(spec1(:,3));
T4us(:,1) = T1{1,1}.';
T4us(:,2) = real(spec1(:,4));
T4us(:,3) = imag(spec1(:,4));
T5us(:,1) = T1{1,1}.';
T5us(:,2) = real(spec1(:,5));
T5us(:,3) = imag(spec1(:,5));
T6us(:,1) = T1{1,1}.';
T6us(:,2) = real(spec1(:,6));
T6us(:,3) = imag(spec1(:,6));
T7us(:,1) = T1{1,1}.';
T7us(:,2) = real(spec1(:,7));
T7us(:,3) = imag(spec1(:,7));
T8us(:,1) = T1{1,1}.';
T8us(:,2) = real(spec1(:,8));
T8us(:,3) = imag(spec1(:,8));
T9us(:,1) = T1{1,1}.';
T9us(:,2) = real(spec1(:,9));
T9us(:,3) = imag(spec1(:,9));
T10us(:,1) = T1{1,1}.';
T10us(:,2) = real(spec1(:,10));
T10us(:,3) = imag(spec1(:,10));
T11us(:,1) = T1{1,1}.';
T11us(:,2) = real(spec1(:,11));
T11us(:,3) = imag(spec1(:,11));
T12us(:,1) = T1{1,1}.';
T12us(:,2) = real(spec1(:,12));
T12us(:,3) = imag(spec1(:,12));
T13us(:,1) = T1{1,1}.';
T13us(:,2) = real(spec1(:,13));
T13us(:,3) = imag(spec1(:,13));
T14us(:,1) = T1{1,1}.';
T14us(:,2) = real(spec1(:,14));
T14us(:,3) = imag(spec1(:,14));
T15us(:,1) = T1{1,1}.';
T15us(:,2) = real(spec1(:,15));
T15us(:,3) = imag(spec1(:,15));
T16us(:,1) = T1{1,1}.';
T16us(:,2) = real(spec1(:,16));
T16us(:,3) = imag(spec1(:,16));
T17us(:,1) = T1{1,1}.';
T17us(:,2) = real(spec1(:,17));
T17us(:,3) = imag(spec1(:,17));
T18us(:,1) = T1{1,1}.';
T18us(:,2) = real(spec1(:,18));
T18us(:,3) = imag(spec1(:,18));
T19us(:,1) = T1{1,1}.';
T19us(:,2) = real(spec1(:,19));
T19us(:,3) = imag(spec1(:,19));
T20us(:,1) = T1{1,1}.';
T20us(:,2) = real(spec1(:,20));
T20us(:,3) = imag(spec1(:,20));

T21us(:,1) = T2(:,1);
T21us(:,2) = real(spec2(:,1));
T21us(:,3) = imag(spec2(:,1));

Time = T1us(:,1);

I1(:,1) = spec1(:,1);
I2(:,1) = spec1(:,2);
I3(:,1) = spec1(:,3);
I4(:,1) = spec1(:,4);
I5(:,1) = spec1(:,5);
I6(:,1) = spec1(:,6);
I7(:,1) = spec1(:,7);
I8(:,1) = spec1(:,8);
I9(:,1) = spec1(:,9);
I10(:,1) = spec1(:,10);
I11(:,1) = spec1(:,11);
I12(:,1) = spec1(:,12);
I13(:,1) = spec1(:,13);
I14(:,1) = spec1(:,14);
I15(:,1) = spec1(:,15);
I16(:,1) = spec1(:,16);
I17(:,1) = spec1(:,17);
I18(:,1) = spec1(:,18);
I19(:,1) = spec1(:,19);
I20(:,1) = spec1(:,20);

I21(:,1) = spec2(:,1);

I1 = I1';
I2 = I2';
I3 = I3';
I4 = I4';
I5 = I5';
I6 = I6';
I7 = I7';
I8 = I8';
I9 = I9';
I10 = I10';
I11 = I11';
I12 = I12';
I13 = I13';
I14 = I14';
I15 = I15';
I16 = I16';
I17 = I17';
I18 = I18';
I19 = I19';
I20 = I20';

I21 = I21';

T1i = T1us(:,3);
T2i = T2us(:,3);
T3i = T3us(:,3);
T4i = T4us(:,3);
T5i = T5us(:,3);
T6i = T6us(:,3);
T7i = T7us(:,3);
T8i = T8us(:,3);
T9i = T9us(:,3);
T10i = T10us(:,3);
T11i = T11us(:,3);
T12i = T12us(:,3);
T13i = T13us(:,3);
T14i = T14us(:,3);
T15i = T15us(:,3);
T16i = T16us(:,3);
T17i = T17us(:,3);
T18i = T18us(:,3);
T19i = T19us(:,3);
T20i = T20us(:,3);

T21i = T21us(:,3);

%% Shifting the zero time

T1us(:,1)= T1us(:,1)-120;
T2us(:,1)= T2us(:,1)-120;
T3us(:,1)= T3us(:,1)-120;
T4us(:,1)= T4us(:,1)-120;
T5us(:,1)= T5us(:,1)-120;
T6us(:,1)= T6us(:,1)-120;
T7us(:,1)= T7us(:,1)-120;
T8us(:,1)= T8us(:,1)-120;
T9us(:,1)= T9us(:,1)-120;
T10us(:,1)= T10us(:,1)-120;
T11us(:,1)= T11us(:,1)-120;
T12us(:,1)= T12us(:,1)-120;
T13us(:,1)= T13us(:,1)-120;
T14us(:,1)= T14us(:,1)-120;
T15us(:,1)= T15us(:,1)-120;
T16us(:,1)= T16us(:,1)-120;
T17us(:,1)= T17us(:,1)-120;
T18us(:,1)= T18us(:,1)-120;
T19us(:,1)= T19us(:,1)-120;
T20us(:,1)= T20us(:,1)-120;

T21us(:,1)= T21us(:,1)-120;

figure(1)
plot(Time,I1,'k',Time,I2,'k',Time,I3,'k',Time,I4,'k',Time,I5,'k',Time,I6,'k',Time,I7,'k',Time,I8,'k',Time,I9,'k',Time,I10,'k',Time,I11,'k',Time,I12,'k',Time,I13,'k',Time,I14,'k',Time,I15,'k',Time,I16,'k',Time,I17,'k',Time,I18,'k',Time,I19,'k',Time,I20,'k'); % real part of phase-corrected data is plotted as BLACK line
% 
figure(2)
plot(Time,I21,'k'); % real part of phase-corrected data is plotted as BLACK line
% 
figure(3)
plot(Time,T1i,'k',Time,T2i,'k',Time,T3i,'k',Time,T4i,'k',Time,T5i,'k',Time,T6i,'k',Time,T7i,'k',Time,T8i,'k',Time,T9i,'k',Time,T10i,'b',Time,T11i,'k',Time,T12i,'m',Time,T13i,'k',Time,T14i,'r',Time,T15i,'k',Time,T16i,'k',Time,T17i,'k',Time,T18i,'k',Time,T19i,'k',Time,T20i,'k'); % real part of phase-corrected data is plotted as BLACK line
% 

figure(4)
plot(Time,T21i,'k'); % real part of phase-corrected data is plotted as BLACK line
%

%% Phasing the data

Time = Time';
% disp(size(Time));
phasing_start=8; % starting point for automatic phasing, It is phased using this starting point to the end of the trace
indy=linspace(1,length(Time),length(Time)); % vector of indices into the data
[m,n]=size(indy);
[m1,n1]=size(Time);
data=[indy' Time' real(I1') imag(I1')];

I1tr=I1(phasing_start:length(I1)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I1tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I1ph=exp(1i*phi)*I1; % apply optimum phase correction to data

I2tr=I2(phasing_start:length(I2)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I2tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I2ph=exp(1i*phi)*I2; % apply optimum phase correction to data

I3tr=I3(phasing_start:length(I3)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I3tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I3ph=exp(1i*phi)*I3; % apply optimum phase correction to data

I4tr=I4(phasing_start:length(I4)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I4tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I4ph=exp(1i*phi)*I4; % apply optimum phase correction to data

I5tr=I5(phasing_start:length(I5)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I5tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I5ph=exp(1i*phi)*I5; % apply optimum phase correction to data

I6tr=I6(phasing_start:length(I6)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I6tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I6ph=exp(1i*phi)*I6; % apply optimum phase correction to data

I7tr=I7(phasing_start:length(I7)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I7tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I7ph=exp(1i*phi)*I7; % apply optimum phase correction to data

I8tr=I8(phasing_start:length(I8)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I8tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I8ph=exp(1i*phi)*I8; % apply optimum phase correction to data

I9tr=I9(phasing_start:length(I9)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I9tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I9ph=exp(1i*phi)*I9; % apply optimum phase correction to data

I10tr=I10(phasing_start:length(I10)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I10tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I10ph=exp(1i*phi)*I10; % apply optimum phase correction to data

I11tr=I11(phasing_start:length(I11)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I11tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I11ph=exp(1i*phi)*I11; % apply optimum phase correction to data

I12tr=I12(phasing_start:length(I12)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I12tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I12ph=exp(1i*phi)*I12; % apply optimum phase correction to data

I13tr=I13(phasing_start:length(I13)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I13tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I13ph=exp(1i*phi)*I13; % apply optimum phase correction to data

I14tr=I14(phasing_start:length(I14)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I14tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I14ph=exp(1i*phi)*I14; % apply optimum phase correction to data

I15tr=I15(phasing_start:length(I15)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I15tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I15ph=exp(1i*phi)*I15; % apply optimum phase correction to data

I16tr=I16(phasing_start:length(I16)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I16tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I16ph=exp(1i*phi)*I16; % apply optimum phase correction to data

I17tr=I17(phasing_start:length(I17)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I17tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I17ph=exp(1i*phi)*I17; % apply optimum phase correction to data

I18tr=I18(phasing_start:length(I18)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I18tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I18ph=exp(1i*phi)*I18; % apply optimum phase correction to data

I19tr=I19(phasing_start:length(I19)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I19tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I19ph=exp(1i*phi)*I19; % apply optimum phase correction to data

I20tr=I20(phasing_start:length(I20)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I20tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I20ph=exp(1i*phi)*I20; % apply optimum phase correction to data

I21tr=I21(phasing_start:length(I21)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I21tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I21ph=exp(1i*phi)*I21; % apply optimum phase correction to data

I1ph = I1ph';
I2ph = I2ph';
I3ph = I3ph';
I4ph = I4ph';
I5ph = I5ph';
I6ph = I6ph';
I7ph = I7ph';
I8ph = I8ph';
I9ph = I9ph';
I10ph = I10ph';
I11ph = I11ph';
I12ph = I12ph';
I13ph = I13ph';
I14ph = I14ph';
I15ph = I15ph';
I16ph = I16ph';
I17ph = I17ph';
I18ph = I18ph';
I19ph = I19ph';
I20ph = I20ph';

I21ph = I21ph';

I1phreal = real(I1ph);
I1phimag = imag(I1ph);
I2phreal = real(I2ph);
I2phimag = imag(I2ph);
I3phreal = real(I3ph);
I3phimag = imag(I3ph);
I4phreal = real(I4ph);
I4phimag = imag(I4ph);
I5phreal = real(I5ph);
I5phimag = imag(I5ph);
I6phreal = real(I6ph);
I6phimag = imag(I6ph);
I7phreal = real(I7ph);
I7phimag = imag(I7ph);
I8phreal = real(I8ph);
I8phimag = imag(I8ph);
I9phreal = real(I9ph);
I9phimag = imag(I9ph);
I10phreal = real(I10ph);
I10phimag = imag(I10ph);
I11phreal = real(I11ph);
I11phimag = imag(I11ph);
I12phreal = real(I12ph);
I12phimag = imag(I12ph);
I13phreal = real(I13ph);
I13phimag = imag(I13ph);
I14phreal = real(I14ph);
I14phimag = imag(I14ph);
I15phreal = real(I15ph);
I15phimag = imag(I15ph);
I16phreal = real(I16ph);
I16phimag = imag(I16ph);
I17phreal = real(I17ph);
I17phimag = imag(I17ph);
I18phreal = real(I18ph);
I18phimag = imag(I18ph);
I19phreal = real(I19ph);
I19phimag = imag(I19ph);
I20phreal = real(I20ph);
I20phimag = imag(I20ph);
I21phreal = real(I21ph);
I21phimag = imag(I21ph);

figure(5)
plot(Time,I1phreal,'k',Time,I2phreal,'k',Time,I3phreal,'k',Time,I4phreal,'k',Time,I5phreal,'k',Time,I6phreal,'k',Time,I7phreal,'r',Time,I8phreal,'k',Time,I9phreal,'k',Time,I10phreal,'k',Time,I11phreal,'k',Time,I12phreal,'k',Time,I13phreal,'k',Time,I14phreal,'k',Time,I15phreal,'k',Time,I16phreal,'k',Time,I17phreal,'k',Time,I18phreal,'k',Time,I19phreal,'k',Time,I20phreal,'k',Time,I1phimag,'r',Time,I2phimag,'r',Time,I3phimag,'r',Time,I4phimag,'r',Time,I5phimag,'r',Time,I6phimag,'r',Time,I7phimag,'r',Time,I8phimag,'r',Time,I9phimag,'r',Time,I10phimag,'r',Time,I11phimag,'r',Time,I12phimag,'r',Time,I13phimag,'r',Time,I14phimag,'r',Time,I15phimag,'r',Time,I16phimag,'r',Time,I17phimag,'r',Time,I18phimag,'r',Time,I19phimag,'r',Time,I20phimag,'r'); % real part of phase-corrected data is plotted as BLACK line
% 
figure(6)
plot(Time,I21phreal,'k',Time,I21phimag,'r'); % real part of phase-corrected data is plotted as BLACK line
% 

Time = Time';
PhaseDEER1 = [Time,I1phreal,I1phimag];
PhaseDEER2 = [Time,I2phreal,I2phimag];
PhaseDEER3 = [Time,I3phreal,I3phimag];
PhaseDEER4 = [Time,I4phreal,I4phimag];
PhaseDEER5 = [Time,I5phreal,I5phimag];
PhaseDEER6 = [Time,I6phreal,I6phimag];
PhaseDEER7 = [Time,I7phreal,I7phimag];
PhaseDEER8 = [Time,I8phreal,I8phimag];
PhaseDEER9 = [Time,I9phreal,I9phimag];
PhaseDEER10 = [Time,I10phreal,I10phimag];
PhaseDEER11 = [Time,I11phreal,I11phimag];
PhaseDEER12 = [Time,I12phreal,I12phimag];
PhaseDEER13 = [Time,I13phreal,I13phimag];
PhaseDEER14 = [Time,I14phreal,I14phimag];
PhaseDEER15 = [Time,I15phreal,I15phimag];
PhaseDEER16 = [Time,I16phreal,I16phimag];
PhaseDEER17 = [Time,I17phreal,I17phimag];
PhaseDEER18 = [Time,I18phreal,I18phimag];
PhaseDEER19 = [Time,I19phreal,I19phimag];
PhaseDEER20 = [Time,I20phreal,I20phimag];

PhaseDEER21 = [Time,I21phreal,I21phimag];

Time = Time-120;
% Timec = T1us(:,1);

% Phased T1-edited DEER
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv20us_phased.txt','PhaseDEER1','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv40us_phased.txt','PhaseDEER2','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv60us_phased.txt','PhaseDEER3','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv80us_phased.txt','PhaseDEER4','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv100us_phased.txt','PhaseDEER5','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv120us_phased.txt','PhaseDEER6','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv140us_phased.txt','PhaseDEER7','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv160us_phased.txt','PhaseDEER8','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv180us_phased.txt','PhaseDEER9','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv200us_phased.txt','PhaseDEER10','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv220us_phased.txt','PhaseDEER11','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv240us_phased.txt','PhaseDEER12','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv260us_phased.txt','PhaseDEER13','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv280us_phased.txt','PhaseDEER14','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv300us_phased.txt','PhaseDEER15','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv320us_phased.txt','PhaseDEER16','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv340us_phased.txt','PhaseDEER17','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv360us_phased.txt','PhaseDEER18','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv380us_phased.txt','PhaseDEER19','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv400us_phased.txt','PhaseDEER20','-ascii')

% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_T1-edited_DEER_T140us_phased.txt','PhaseDEER21','-ascii')

%% Monoexponential fitting

% p = expfit(I1phcreal)

Timel = Time;
Time = Time(1:end-50);
% Time1 = Time1(1:end-50);

I1ph = I1ph(1:end-50);
I2ph = I2ph(1:end-50);
I3ph = I3ph(1:end-50);
I4ph = I4ph(1:end-50);
I5ph = I5ph(1:end-50);
I6ph = I6ph(1:end-50);
I7ph = I7ph(1:end-50);
I8ph = I8ph(1:end-50);
I9ph = I9ph(1:end-50);
I10ph = I10ph(1:end-50);
I11ph = I11ph(1:end-50);
I12ph = I12ph(1:end-50);
I13ph = I13ph(1:end-50);
I14ph = I14ph(1:end-50);
I15ph = I15ph(1:end-50);
I16ph = I16ph(1:end-50);
I17ph = I17ph(1:end-50);
I18ph = I18ph(1:end-50);
I19ph = I19ph(1:end-50);
I20ph = I20ph(1:end-50);
I21ph = I21ph(1:end-50);

I1phreal1 = real(I1ph);
I1phimag1 = imag(I1ph);
I2phreal1 = real(I2ph);
I2phimag1 = imag(I2ph);
I3phreal1 = real(I3ph);
I3phimag1 = imag(I3ph);
I4phreal1 = real(I4ph);
I4phimag1 = imag(I4ph);
I5phreal1 = real(I5ph);
I5phimag1 = imag(I5ph);
I6phreal1 = real(I6ph);
I6phimag1 = imag(I6ph);
I7phreal1 = real(I7ph);
I7phimag1 = imag(I7ph);
I8phreal1 = real(I8ph);
I8phimag1 = imag(I8ph);
I9phreal1 = real(I9ph);
I9phimag1 = imag(I9ph);
I10phreal1 = real(I10ph);
I10phimag1 = imag(I10ph);
I11phreal1 = real(I11ph);
I11phimag1 = imag(I11ph);
I12phreal1 = real(I12ph);
I12phimag1 = imag(I12ph);
I13phreal1 = real(I13ph);
I13phimag1 = imag(I13ph);
I14phreal1 = real(I14ph);
I14phimag1 = imag(I14ph);
I15phreal1 = real(I15ph);
I15phimag1 = imag(I15ph);
I16phreal1 = real(I16ph);
I16phimag1 = imag(I16ph);
I17phreal1 = real(I17ph);
I17phimag1 = imag(I17ph);
I18phreal1 = real(I18ph);
I18phimag1 = imag(I18ph);
I19phreal1 = real(I19ph);
I19phimag1 = imag(I19ph);
I20phreal1 = real(I20ph);
I20phimag1 = imag(I20ph);
I21phreal1 = real(I21ph);
I21phimag1 = imag(I21ph);

PhaseDEERc1 = [Time,I1phreal1,I1phimag1];
PhaseDEERc2 = [Time,I2phreal1,I2phimag1];
PhaseDEERc3 = [Time,I3phreal1,I3phimag1];
PhaseDEERc4 = [Time,I4phreal1,I4phimag1];
PhaseDEERc5 = [Time,I5phreal1,I5phimag1];
PhaseDEERc6 = [Time,I6phreal1,I6phimag1];
PhaseDEERc7 = [Time,I7phreal1,I7phimag1];
PhaseDEERc8 = [Time,I8phreal1,I8phimag1];
PhaseDEERc9 = [Time,I9phreal1,I9phimag1];
PhaseDEERc10 = [Time,I10phreal1,I10phimag1];
PhaseDEERc11 = [Time,I11phreal1,I11phimag1];
PhaseDEERc12 = [Time,I12phreal1,I12phimag1];
PhaseDEERc13 = [Time,I13phreal1,I13phimag1];
PhaseDEERc14 = [Time,I14phreal1,I14phimag1];
PhaseDEERc15 = [Time,I15phreal1,I15phimag1];
PhaseDEERc16 = [Time,I16phreal1,I16phimag1];
PhaseDEERc17 = [Time,I17phreal1,I17phimag1];
PhaseDEERc18 = [Time,I18phreal1,I18phimag1];
PhaseDEERc19 = [Time,I19phreal1,I19phimag1];
PhaseDEERc20 = [Time,I20phreal1,I20phimag1];

PhaseDEERc21 = [Time,I21phreal1,I21phimag1];

% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv20us_phased_cut.txt','PhaseDEERc1','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv40us_phased_cut.txt','PhaseDEERc2','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv60us_phased_cut.txt','PhaseDEERc3','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv80us_phased_cut.txt','PhaseDEERc4','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv100us_phased_cut.txt','PhaseDEERc5','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv120us_phased_cut.txt','PhaseDEERc6','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv140us_phased_cut.txt','PhaseDEERc7','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv160us_phased_cut.txt','PhaseDEERc8','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv180us_phased_cut.txt','PhaseDEERc9','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv200us_phased_cut.txt','PhaseDEERc10','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv220us_phased_cut.txt','PhaseDEERc11','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv240us_phased_cut.txt','PhaseDEERc12','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv260us_phased_cut.txt','PhaseDEERc13','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv280us_phased_cut.txt','PhaseDEERc14','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv300us_phased_cut.txt','PhaseDEERc15','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv320us_phased_cut.txt','PhaseDEERc16','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv340us_phased_cut.txt','PhaseDEERc17','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv360us_phased_cut.txt','PhaseDEERc18','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv380us_phased_cut.txt','PhaseDEERc19','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv400us_phased_cut.txt','PhaseDEERc20','-ascii')

% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_T1-edited_DEER_T140us_phased_cut.txt','PhaseDEERc21','-ascii')

I1phreal = real(I1ph);
I1phimag = imag(I1ph);
I2phreal = real(I2ph);
I2phimag = imag(I2ph);
I3phreal = real(I3ph);
I3phimag = imag(I3ph);
I4phreal = real(I4ph);
I4phimag = imag(I4ph);
I5phreal = real(I5ph);
I5phimag = imag(I5ph);
I6phreal = real(I6ph);
I6phimag = imag(I6ph);
I7phreal = real(I7ph);
I7phimag = imag(I7ph);
I8phreal = real(I8ph);
I8phimag = imag(I8ph);
I9phreal = real(I9ph);
I9phimag = imag(I9ph);
I10phreal = real(I10ph);
I10phimag = imag(I10ph);
I11phreal = real(I11ph);
I11phimag = imag(I11ph);
I12phreal = real(I12ph);
I12phimag = imag(I12ph);
I13phreal = real(I13ph);
I13phimag = imag(I13ph);
I14phreal = real(I14ph);
I14phimag = imag(I14ph);
I15phreal = real(I15ph);
I15phimag = imag(I15ph);
I16phreal = real(I16ph);
I16phimag = imag(I16ph);
I17phreal = real(I17ph);
I17phimag = imag(I17ph);
I18phreal = real(I18ph);
I18phimag = imag(I18ph);
I19phreal = real(I19ph);
I19phimag = imag(I19ph);
I20phreal = real(I20ph);
I20phimag = imag(I20ph);
I21phreal = real(I21ph);
I21phimag = imag(I21ph);

Timefb = Time(49:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
I1fb = I1phreal(49:end);
I2fb = I2phreal(49:end);
I3fb = I3phreal(49:end);
I4fb = I4phreal(49:end);
I5fb = I5phreal(49:end);
I6fb = I6phreal(49:end);
I7fb = I7phreal(49:end);
I8fb = I8phreal(49:end);
I9fb = I9phreal(49:end);
I10fb = I10phreal(49:end);
I11fb = I11phreal(49:end);
I12fb = I12phreal(49:end);
I13fb = I13phreal(49:end);
I14fb = I14phreal(49:end);
I15fb = I15phreal(49:end);
I16fb = I16phreal(49:end);
I17fb = I17phreal(49:end);
I18fb = I18phreal(49:end);
I19fb = I19phreal(49:end);
I20fb = I20phreal(49:end);
I21fb = I21phreal(49:end);

  p1 = fit(Timefb,I1fb,'exp1');
bsl1 = p1.a*exp((p1.b)*Time);
  p2 = fit(Timefb,I2fb,'exp1');
bsl2 = p2.a*exp((p2.b)*Time);
  p3 = fit(Timefb,I3fb,'exp1');
bsl3 = p3.a*exp((p3.b)*Time);
  p4 = fit(Timefb,I4fb,'exp1');
bsl4 = p4.a*exp((p4.b)*Time);
  p5 = fit(Timefb,I5fb,'exp1');
bsl5 = p5.a*exp((p5.b)*Time);
  p6 = fit(Timefb,I6fb,'exp1');
bsl6 = p6.a*exp((p6.b)*Time);
  p7 = fit(Timefb,I7fb,'exp1');
bsl7 = p7.a*exp((p7.b)*Time);
  p8 = fit(Timefb,I8fb,'exp1');
bsl8 = p8.a*exp((p8.b)*Time);
  p9 = fit(Timefb,I9fb,'exp1');
bsl9 = p9.a*exp((p9.b)*Time);
  p10 = fit(Timefb,I10fb,'exp1');
bsl10 = p10.a*exp((p10.b)*Time);
  p11 = fit(Timefb,I11fb,'exp1');
bsl11 = p11.a*exp((p11.b)*Time);
  p12 = fit(Timefb,I12fb,'exp1');
bsl12 = p12.a*exp((p12.b)*Time);
  p13 = fit(Timefb,I13fb,'exp1');
bsl13 = p13.a*exp((p13.b)*Time);
  p14 = fit(Timefb,I14fb,'exp1');
bsl14 = p14.a*exp((p14.b)*Time);
  p15 = fit(Timefb,I15fb,'exp1');
bsl15 = p15.a*exp((p15.b)*Time);
  p16 = fit(Timefb,I16fb,'exp1');
bsl16 = p16.a*exp((p16.b)*Time);
  p17 = fit(Timefb,I17fb,'exp1');
bsl17 = p17.a*exp((p17.b)*Time);
  p18 = fit(Timefb,I18fb,'exp1');
bsl18 = p18.a*exp((p18.b)*Time);
  p19 = fit(Timefb,I19fb,'exp1');
bsl19 = p19.a*exp((p19.b)*Time);
  p20 = fit(Timefb,I20fb,'exp1');
bsl20 = p20.a*exp((p20.b)*Time);                                          
  p21 = fit(Timefb,I21fb,'exp1');
bsl21 = p21.a*exp((p21.b)*Time);

figure(7); clf; % in Figure 2, the baseline correction is shown
plot(Time,I1phreal,'k',Time,bsl1,'r',Time,I2phreal,'k',Time,bsl2,'r',Time,I3phreal,'k',Time,bsl3,'r',Time,I4phreal,'k',Time,bsl4,'r',Time,I5phreal,'k',Time,bsl5,'r',Time,I6phreal,'k',Time,bsl6,'r',Time,I7phreal,'k',Time,bsl7,'r',Time,I8phreal,'k',Time,bsl8,'r',Time,I9phreal,'k',Time,bsl9,'r',Time,I10phreal,'k',Time,bsl10,'r',Time,I11phreal,'k',Time,bsl11,'r',Time,I12phreal,'k',Time,bsl12,'r',Time,I13phreal,'k',Time,bsl13,'r',Time,I14phreal,'k',Time,bsl14,'r',Time,I15phreal,'k',Time,bsl15,'r',Time,I16phreal,'k',Time,bsl16,'r'); % original data are plotted BLACK
hold on;

figure(8); clf; % in Figure 2, the baseline correction is shown
plot(Time,I21phreal,'k',Time,bsl21,'r'); % original data are plotted BLACK
hold on;

figure(9); clf; % in Figure 2, the baseline correction is shown
plot(Time,I1phreal1,'k',Time,bsl1,'r',Time,I2phreal1,'k',Time,bsl2,'r',Time,I3phreal1,'k',Time,bsl3,'r',Time,I4phreal1,'k',Time,bsl4,'r',Time,I5phreal1,'k',Time,bsl5,'r',Time,I6phreal1,'k',Time,bsl6,'r',Time,I7phreal1,'k',Time,bsl7,'r',Time,I8phreal1,'k',Time,bsl8,'r'); % original data are plotted BLACK
hold on;
xmin = 0;
xmax = 1000;
% ymin = 0.8;
% ymin = (min(I1phreal)+(1-max(Ih1real)))-0.01;
% ymax = 1+0.01;
% axis([xmin xmax ymin ymax]);
set(gca,'fontsize', 24);
xlabel('t [\mus]','FontSize',24)
ylabel('V(t) / V(0)','FontSize',24)

figure(10); clf; % in Figure 2, the baseline correction is shown
plot(Time,I21phreal1,'k',Time,bsl21,'r'); % original data are plotted BLACK
hold on;
xmin = -200;
xmax = 1600;
ymin = -31800000;
% ymin = (min(I1phreal)+(1-max(Ih1real)))-0.01;
ymax = max(I21phreal1)+300000;
axis([xmin xmax ymin ymax]);
set(gca,'fontsize', 24);
xlabel('t [\mus]','FontSize',24)
ylabel('V(t) / V(0)','FontSize',24)

I1b = I1phreal-bsl1;
I2b = I2phreal-bsl2;
I3b = I3phreal-bsl3;
I4b = I4phreal-bsl4;
I5b = I5phreal-bsl5;
I6b = I6phreal-bsl6;
I7b = I7phreal-bsl7;
I8b = I8phreal-bsl8;
% I9b = I9phreal-bsl9;
% I10b = I10phreal-bsl10;
% I11b = I11phreal-bsl11;
% I12b = I12phreal-bsl12;
% I13b = I13phreal-bsl13;
% I14b = I14phreal-bsl14;
% I15b = I15phreal-bsl15;
% I16b = I16phreal-bsl16;
% I17b = I17phreal-bsl17;
% I18b = I18phreal-bsl18;
% I19b = I19phreal-bsl19;
% I20b = I20phreal-bsl20;
I21b = I21phreal-bsl21;

% Cut off leftmost side of trace to use directly in SVD
Timec = (Time(16:end)); 
I1bc = I1b(16:end);
I2bc = I2b(16:end);
I3bc = I3b(16:end);
I4bc = I4b(16:end);
I5bc = I5b(16:end);
I6bc = I6b(16:end);
I7bc = I7b(16:end);
I8bc = I8b(16:end);
% I9bc = I9b(16:end);
% I10bc = I10b(16:end);
% I11bc = I11b(16:end);
% I12bc = I12b(16:end);
% I13bc = I13b(16:end);
% I14bc = I14b(16:end);
% I15bc = I15b(16:end);
% I16bc = I16b(16:end);
% I17bc = I17b(16:end);
% I18bc = I18b(16:end);
% I19bc = I19b(16:end);
% I20bc = I20b(16:end);
I21bc = I21b(16:end);

figure(8); clf; % in Figure 2, the baseline correction is shown
plot(Timec,I1bc,'k',Timec,I2bc,'k',Timec,I3bc,'k',Timec,I4bc,'k',Timec,I5bc,'k',Timec,I6bc,'k',Timec,I7bc,'k',Timec,I8bc,'k'); % original data are plotted BLACK
hold on;

figure(50); clf; % in Figure 2, the baseline correction is shown
plot(Timec,I1bc-0.7,'k',Timec,I2bc-0.6,'k',Timec,I3bc-0.5,'k',Timec,I4bc-0.4,'k',Timec,I5bc-0.3,'k',Timec,I6bc-0.2,'k',Timec,I7bc-0.1,'k',Timec,I8bc,'k');% original data are plotted BLACK
hold on;
xmin = 0;
xmax = 1000;
% ymin = 0.8;
% ymin = (min(I1phreal)+(1-max(Ih1real)))-0.01;
ymin = min(I1bc)-0.72;
ymax = max(I8bc)+0.02;
axis([xmin xmax ymin ymax]);
set(gca,'fontsize', 24);
xlabel('t [\mus]','FontSize',24)
ylabel('V(t) / V(0)','FontSize',24)

Ibci = zeros(size(I1bc));
Ibi = zeros(size(bsl1));
T = Timec;

DEERb1 = [Time,bsl1,Ibi];
DEERb2 = [Time,bsl2,Ibi];
DEERb3 = [Time,bsl3,Ibi];
DEERb4 = [Time,bsl4,Ibi];
DEERb5 = [Time,bsl5,Ibi];
DEERb6 = [Time,bsl6,Ibi];
DEERb7 = [Time,bsl7,Ibi];
DEERb8 = [Time,bsl8,Ibi];
% DEERb9 = [Time,bsl9,Ibi];
% DEERb10 = [Time,bsl10,Ibi];
% DEERb11 = [Time,bsl11,Ibi];
% DEERb12 = [Time,bsl12,Ibi];
% DEERb13 = [Time,bsl13,Ibi];
% DEERb14 = [Time,bsl14,Ibi];
% DEERb15 = [Time,bsl15,Ibi];
% DEERb16 = [Time,bsl16,Ibi];
% DEERb17 = [Time,bsl17,Ibi];
% DEERb18 = [Time,bsl18,Ibi];
% DEERb19 = [Time,bsl19,Ibi];
% DEERb20 = [Time,bsl20,Ibi];
DEERb21 = [Time,bsl21,Ibi];

PhaseDEERb1 = [Timec,I1bc,Ibci];
PhaseDEERb2 = [Timec,I2bc,Ibci];
PhaseDEERb3 = [Timec,I3bc,Ibci];
PhaseDEERb4 = [Timec,I4bc,Ibci];
PhaseDEERb5 = [Timec,I5bc,Ibci];
PhaseDEERb6 = [Timec,I6bc,Ibci];
PhaseDEERb7 = [Timec,I7bc,Ibci];
PhaseDEERb8 = [Timec,I8bc,Ibci];
% PhaseDEERb9 = [Timec,I9bc,Ibci];
% PhaseDEERb10 = [Timec,I10bc,Ibci];
% PhaseDEERb11 = [Timec,I11bc,Ibci];
% PhaseDEERb12 = [Timec,I12bc,Ibci];
% PhaseDEERb13 = [Timec,I13bc,Ibci];
% PhaseDEERb14 = [Timec,I14bc,Ibci];
% PhaseDEERb15 = [Timec,I15bc,Ibci];
% PhaseDEERb16 = [Timec,I16bc,Ibci];
% PhaseDEERb17 = [Timec,I17bc,Ibci];
% PhaseDEERb18 = [Timec,I18bc,Ibci];
% PhaseDEERb19 = [Timec,I19bc,Ibci];
% PhaseDEERb20 = [Timec,I20bc,Ibci];
PhaseDEERb21 = [Timec,I21bc,Ibci];

% bckgcorr T1-edited DEER

% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv20us_bckg.txt','DEERb1','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv40us_bckg.txt','DEERb2','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv60us_bckg.txt','DEERb3','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv80us_bckg.txt','DEERb4','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv100us_bckg.txt','DEERb5','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv120us_bckg.txt','DEERb6','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv140us_bckg.txt','DEERb7','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv160us_bckg.txt','DEERb8','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv180us_bckg.txt','DEERb9','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv200us_bckg.txt','DEERb10','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv220us_bckg.txt','DEERb11','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv240us_bckg.txt','DEERb12','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv260us_bckg.txt','DEERb13','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv280us_bckg.txt','DEERb14','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv300us_bckg.txt','DEERb15','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv320us_bckg.txt','DEERb16','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv340us_bckg.txt','DEERb17','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv360us_bckg.txt','DEERb18','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv380us_bckg.txt','DEERb19','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv400us_bckg.txt','DEERb20','-ascii')

% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_T1-edited_DEER_T140us_bckg.txt','DEERb21','-ascii')

% % % Exp bckg subtracted T1-edited DEER
%
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv20us_mexp.txt','PhaseDEERb1','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv40us_mexp.txt','PhaseDEERb2','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv60us_mexp.txt','PhaseDEERb3','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv80us_mexp.txt','PhaseDEERb4','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv100us_mexp.txt','PhaseDEERb5','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv120us_mexp.txt','PhaseDEERb6','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv140us_mexp.txt','PhaseDEERb7','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv160us_mexp.txt','PhaseDEERb8','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv180us_mexp.txt','PhaseDEERb9','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv200us_mexp.txt','PhaseDEERb10','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv220us_mexp.txt','PhaseDEERb11','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv240us_mexp.txt','PhaseDEERb12','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv260us_mexp.txt','PhaseDEERb13','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv280us_mexp.txt','PhaseDEERb14','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv300us_mexp.txt','PhaseDEERb15','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv320us_mexp.txt','PhaseDEERb16','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv340us_mexp.txt','PhaseDEERb17','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv360us_mexp.txt','PhaseDEERb18','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv380us_mexp.txt','PhaseDEERb19','-ascii')
% save('20250727_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEERvsT1_Tinv400us_mexp.txt','PhaseDEERb20','-ascii')

% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_T1-edited_DEER_T140us_m3e6_mexp_div.txt','PhaseDEERb21','-ascii')
% 
