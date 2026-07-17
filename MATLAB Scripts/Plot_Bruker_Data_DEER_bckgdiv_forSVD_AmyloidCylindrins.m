clear all, clc ,clf

% This script performs exponential background correction of DEER data and
% outputs in a format directly usable for the SF-SVD software at
% www.denoising.cornell.edu

%% Loading the data

path1 = 'C:\Users\tufa_\Documents\Amyloid Octamer Paper\Data\DEER\'; 
filename1 ='20250714_K11V_L5C_Rx_V2L_batch2_500uM_DEER_1p6us.DTA';
filename2 ='20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_2p4us.DTA';
filename3 ='20251226_K11V_L5C_Rx_batch2_500uM_rep_DEER_1p6us_3hrs.DTA';
filename4 ='20260113_K11V_L5C_Rx_V2L_batch2_500uM_1pcTritonX_DEER_1p6us.DTA';
filename5 ='20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcCHAPS_DEER_1p6us.DTA';
filename6 ='20260115_Anthraflavic_DEER_1p6us_30ns.DTA';
filename7 ='20260116_Triradical_NO_30ns_DEER_1p6us.DTA';
filename8 ='20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_1p6us.DTA';
filename9 ='20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_2p4us.DTA';
filename10 ='20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_1p6us.DTA';

[T1,spec1,pars1] = eprload([path1 filename1]);
[T2,spec2,pars2] = eprload([path1 filename2]);
[T3,spec3,pars3] = eprload([path1 filename3]);
[T4,spec4,pars4] = eprload([path1 filename4]);
[T5,spec5,pars5] = eprload([path1 filename5]);
[T6,spec6,pars6] = eprload([path1 filename6]);
[T7,spec7,pars7] = eprload([path1 filename7]);
[T8,spec8,pars8] = eprload([path1 filename8]);
[T9,spec9,pars9] = eprload([path1 filename9]);
[T10,spec10,pars10] = eprload([path1 filename10]);

T1us(:,1) = T1(:,1);
T1us(:,2) = real(spec1(:,1));
T1us(:,3) = imag(spec1(:,1));
T2us(:,1) = T2(:,1);
T2us(:,2) = real(spec2(:,1));
T2us(:,3) = imag(spec2(:,1));
T3us(:,1) = T3(:,1);
T3us(:,2) = real(spec3(:,1));
T3us(:,3) = imag(spec3(:,1));
T4us(:,1) = T4(:,1);
T4us(:,2) = real(spec4(:,1));
T4us(:,3) = imag(spec4(:,1));
T5us(:,1) = T5(:,1);
T5us(:,2) = real(spec5(:,1));
T5us(:,3) = imag(spec5(:,1));
T6us(:,1) = T6(:,1);
T6us(:,2) = real(spec6(:,1));
T6us(:,3) = imag(spec6(:,1));
T7us(:,1) = T7(:,1);
T7us(:,2) = real(spec7(:,1));
T7us(:,3) = imag(spec7(:,1));
T8us(:,1) = T8(:,1);
T8us(:,2) = real(spec8(:,1));
T8us(:,3) = imag(spec8(:,1));
T9us(:,1) = T9(:,1);
T9us(:,2) = real(spec9(:,1));
T9us(:,3) = imag(spec9(:,1));
T10us(:,1) = T10(:,1);
T10us(:,2) = real(spec10(:,1));
T10us(:,3) = imag(spec10(:,1));

Time = T1us(:,1);
Time1 = T2us(:,1);

I1(:,1) = spec1(:,1);
I2(:,1) = spec2(:,1);
I3(:,1) = spec3(:,1);
I4(:,1) = spec4(:,1);
I5(:,1) = spec5(:,1);
I6(:,1) = spec6(:,1);
I7(:,1) = spec7(:,1);
I8(:,1) = spec8(:,1);
I9(:,1) = spec9(:,1);
I10(:,1) = spec10(:,1);

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

%% Cutting off the zero time

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

%% Phasing the data

Time = Time';
phasing_start=8;

I1tr=I1(phasing_start:length(I1)); % part of the data used for phasing
phi=fminbnd(@rms_phi,-pi/2+1e-4,pi/2,[],I1tr); % find out optimum phase (imaginary part zero)
disp(180*phi/pi); % display phase correction in degree in the command window
I1ph=exp(1i*phi)*I1; % apply optimum phase correction to data
% 
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
% 
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

Timeraw = Time-120;
Time1raw = Time1-120;

% figure(1) % Phasing result
% plot(Time,I1phreal,'k',Time1,I2phreal,'k',Time,I3phreal,'k',Time,I4phreal,'k',Time,I5phreal,'k',Time,I5phimag,'r',Time,I6phreal,'k',Time,I7phreal,'r',Time,I8phreal,'k',Time,I1phimag,'r',Time1,I2phimag,'r',Time,I3phimag,'r',Time,I4phimag,'r',Time,I6phimag,'r',Time,I7phimag,'r',Time,I8phimag,'r',Time1,I9phreal,'k',Time1,I9phimag,'r',Time,I10phreal,'k',Time,I10phimag,'r'); % real part of phase-corrected data is plotted as BLACK line

Time = Time';
% Time1 = Time1;
PhaseDEER1 = [Time,I1phreal,I1phimag];
PhaseDEER2 = [Time1,I2phreal,I2phimag];
PhaseDEER3 = [Time,I3phreal,I3phimag];
PhaseDEER4 = [Time,I4phreal,I4phimag];
PhaseDEER5 = [Time,I5phreal,I5phimag];
PhaseDEER6 = [Time,I6phreal,I6phimag];
PhaseDEER7 = [Time,I7phreal,I7phimag];
PhaseDEER8 = [Time,I8phreal,I8phimag];
PhaseDEER9 = [Time1,I9phreal,I9phimag];
PhaseDEER10 = [Time,I10phreal,I10phimag];

% save('20250714_K11V_L5C_Rx_V2L_batch2_500uM_DEER_1p6us_phased.txt','PhaseDEER1','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_2p4us_phased.txt','PhaseDEER2','-ascii')
% save('20251226_K11V_L5C_Rx_batch2_500uM_rep_DEER_1p6us_3hrs_phased.txt','PhaseDEER3','-ascii')
% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_1pcTritonX_DEER_1p6us_phased.txt','PhaseDEER4','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcCHAPS_DEER_1p6us_phased.txt','PhaseDEER5','-ascii')
% save('20260115_Anthraflavic_DEER_1p6us_30ns_phased.txt','PhaseDEER6','-ascii')
% save('20260116_Triradical_NO_30ns_DEER_1p6us_phased.txt','PhaseDEER7','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_1p6us_phased.txt','PhaseDEER8','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_2p4us_phased.txt','PhaseDEER9','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_1p6us_phased.txt','PhaseDEER10','-ascii')


%% Polynomial fitting

Time = Time(1:end-50);
Time1 = Time1(1:end-50);

Timec = Time(:,1)-120;
Time1c = Time1(:,1)-120;

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

PhaseDEER1 = [Time,I1phreal,I1phimag];
PhaseDEER2 = [Time1,I2phreal,I2phimag];
PhaseDEER3 = [Time,I3phreal,I3phimag];
PhaseDEER4 = [Time,I4phreal,I4phimag];
PhaseDEER5 = [Time,I5phreal,I5phimag];
PhaseDEER6 = [Time,I6phreal,I6phimag];
PhaseDEER7 = [Time,I7phreal,I7phimag];
PhaseDEER8 = [Time,I8phreal,I8phimag];
PhaseDEER9 = [Time1,I9phreal,I9phimag];
PhaseDEER10 = [Time,I10phreal,I10phimag];

% Phased DEER

% save('20250714_K11V_L5C_Rx_V2L_batch2_500uM_DEER_1p6us_phased_cut.txt','PhaseDEER1','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_2p4us_phased_cut.txt','PhaseDEER2','-ascii')
% save('20251226_K11V_L5C_Rx_batch2_500uM_rep_DEER_1p6us_3hrs_phased_cut.txt','PhaseDEER3','-ascii')
% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_1pcTritonX_DEER_1p6us_phased_cut.txt','PhaseDEER4','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcCHAPS_DEER_1p6us_phased_cut.txt','PhaseDEER5','-ascii')
% save('20260115_Anthraflavic_DEER_1p6us_30ns_phased_cut.txt','PhaseDEER6','-ascii')
% save('20260116_Triradical_NO_30ns_DEER_1p6us_phased_cut.txt','PhaseDEER7','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_1p6us_phased_cut.txt','PhaseDEER8','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_2p4us_phased_cut.txt','PhaseDEER9','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_1p6us_phased_cut.txt','PhaseDEER10','-ascii')

Timefb1 = Timec(46:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb2 = Time1c(34:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb3 = Timec(46:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb4 = Timec(51:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb5 = Timec(49:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb6 = Timec(37:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb7 = Timec(53:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb8 = Timec(34:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb9 = Time1c(43:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs
Timefb10 = Timec(43:end); % to polyfit the end of trace, cut leftmost points (8ns each) 42 for 120ns zt 49 for 60obs

I1fb = I1phreal(46:end);
I2fb = I2phreal(34:end);
I3fb = I3phreal(46:end);
I4fb = I4phreal(51:end);
I5fb = I5phreal(49:end);
I6fb = I6phreal(37:end);
I7fb = I7phreal(53:end);
I8fb = I8phreal(34:end);
I9fb = I9phreal(43:end);
I10fb = I10phreal(43:end);

  p1 = fit(Timefb1,I1fb,'exp1');
bsl1 = p1.a*exp((p1.b)*Timec);
  p2 = fit(Timefb2,I2fb,'exp1');
bsl2 = p2.a*exp((p2.b)*Time1c);
  p3 = fit(Timefb3,I3fb,'exp1');
bsl3 = p3.a*exp((p3.b)*Timec);
  p4 = fit(Timefb4,I4fb,'exp1');
bsl4 = p4.a*exp((p4.b)*Timec);
  p5 = fit(Timefb5,I5fb,'exp1');
bsl5 = p5.a*exp((p5.b)*Timec);
  p6 = fit(Timefb6,I6fb,'exp1');
bsl6 = p6.a*exp((p6.b)*Timec);
  p7 = fit(Timefb7,I7fb,'exp1');
bsl7 = p7.a*exp((p7.b)*Timec);
  p8 = fit(Timefb8,I8fb,'exp1');
bsl8 = p8.a*exp((p8.b)*Timec);
  p9 = fit(Timefb9,I9fb,'exp1');
bsl9 = p9.a*exp((p9.b)*Time1c);
  p10 = fit(Timefb10,I10fb,'exp1');
bsl10 = p10.a*exp((p10.b)*Timec);

bsl1n = bsl1;
bsl2n = bsl2;
bsl3n = bsl3;
bsl4n = bsl4;
bsl5n = bsl5;
bsl6n = bsl6;
bsl7n = bsl7;
bsl8n = bsl8;
bsl9n = bsl9;
bsl10n = bsl10;

bsl1 = bsl1/max(I1phreal);
I1phreal = I1phreal/max(I1phreal);
bsl2 = bsl2/max(I2phreal);
I2phreal = I2phreal/max(I2phreal);
bsl3 = bsl3/max(I3phreal);
I3phreal = I3phreal/max(I3phreal);
bsl4 = bsl4/max(I4phreal);
I4phreal = I4phreal/max(I4phreal);
bsl5 = bsl5/max(I5phreal);
I5phreal = I5phreal/max(I5phreal);
bsl6 = bsl6/max(I6phreal);
I6phreal = I6phreal/max(I6phreal);
bsl7 = bsl7/max(I7phreal);
I7phreal = I7phreal/max(I7phreal);
bsl8 = bsl8/max(I8phreal);
I8phreal = I8phreal/max(I8phreal);
bsl9 = bsl9/max(I9phreal);
I9phreal = I9phreal/max(I9phreal);
bsl10 = bsl10/max(I10phreal);
I10phreal = I10phreal/max(I10phreal);

figure(2); clf; % The background fit is shown
plot(Timec,I1phreal,'k',Timec,bsl1,'r',Time1c,I2phreal,'k',Time1c,bsl2,'r',Timec,I3phreal,'k',Timec,bsl3,'r',Timec,I4phreal,'k',Timec,bsl4,'r', Timec,I5phreal,'k',Timec,bsl5,'r',Timec,I6phreal,'k',Timec,bsl6,'r',Timec,I7phreal,'k',Timec,bsl7,'r',Timec,I8phreal,'k',Timec,bsl8,'r',Time1c,I9phreal,'k',Time1c,bsl9,'r',Timec,I10phreal,'k',Timec,bsl10,'r'); % original data are plotted BLACK
hold on;

%% Baseline Correction
I1b = (((1./(I1phreal)./(1./bsl1))-1).*-1);
I2b = (((1./(I2phreal)./(1./bsl2))-1).*-1);
I3b = (((1./(I3phreal)./(1./bsl3))-1).*-1);
I4b = (((1./(I4phreal)./(1./bsl4))-1).*-1);
I5b = (((1./(I5phreal)./(1./bsl5))-1).*-1);
I6b = (((1./(I6phreal)./(1./bsl6))-1).*-1);
I7b = (((1./(I7phreal)./(1./bsl7))-1).*-1);
I8b = (((1./(I8phreal)./(1./bsl8))-1).*-1);
I9b = (((1./(I9phreal)./(1./bsl9))-1).*-1);
I10b = (((1./(I10phreal)./(1./bsl10))-1).*-1);

MD1 = I1b(16) % Print out the modulation depth
MD2 = I2b(16)
MD3 = I3b(16)
MD4 = I4b(16)
MD5 = I5b(16)
MD6 = I6b(16)
MD7 = I7b(16)
MD8 = I8b(16)
MD9 = I9b(16)
MD10 = I10b(16)

% figure(3); clf; % Baseline corrected data all shown together
% plot(Timec,I1b,'k',Time1c,I2b,'k',Timec,I3b,'k',Timec,I4b,'k', Timec,I5b,'k',Timec,I6b,'k',Timec,I7b,'k',Timec,I8b,'k',Time1c,I9b,'k',Timec,I10b,'k'); % original data are plotted BLACK
% hold on;

% Cut off leftmost side of trace to use directly in SVD software
I1bc = I1b(16:end);
I2bc = I2b(16:end);
I3bc = I3b(16:end);
I4bc = I4b(16:end);
I5bc = I5b(16:end);
I6bc = I6b(16:end);
I7bc = I7b(16:end);
I8bc = I8b(16:end);
I9bc = I9b(16:end);
I10bc = I10b(16:end);

Ibci = zeros(size(I1bc));
Ibci1 = zeros(size(I2bc));
Ibc3i = zeros(size(I8bc));

Ibi = zeros(size(bsl1));
Ibi1 = zeros(size(bsl2));
Ib3i = zeros(size(bsl8));

T = Time-120; 
T2p4 = Time1-120; 

% Save I1phreal (Normalized raw data), with bsl (Exponential background)
% and I1b (baseline corrected trace (division)

DEERb1 = [T,bsl1,Ibi];
DEERb2 = [T2p4,bsl2,Ibi1];
DEERb3 = [T,bsl3,Ibi];
DEERb4 = [T,bsl4,Ibi];
DEERb5 = [T,bsl5,Ibi];
DEERb6 = [T,bsl6,Ibi];
DEERb7 = [T,bsl7,Ibi];
DEERb8 = [T,bsl8,Ib3i];
DEERb9 = [T2p4,bsl9,Ibi1];
DEERb10 = [T,bsl10,Ibi];

Timec = (Time(16:end))-120; 
Time1c = (Time1(16:end))-120; 

PhaseDEERb1 = [Timec,I1bc,Ibci];
PhaseDEERb2 = [Time1c,I2bc,Ibci1];
PhaseDEERb3 = [Timec,I3bc,Ibci];
PhaseDEERb4 = [Timec,I4bc,Ibci];
PhaseDEERb5 = [Timec,I5bc,Ibci];
PhaseDEERb6 = [Timec,I6bc,Ibci];
PhaseDEERb7 = [Timec,I7bc,Ibci];
PhaseDEERb8 = [Timec,I8bc,Ibc3i];
PhaseDEERb9 = [Time1c,I9bc,Ibci1];
PhaseDEERb10 = [Timec,I10bc,Ibci];

% bckgcorr DEER
% 
% save('20250714_K11V_L5C_Rx_V2L_batch2_500uM_DEER_1p6us_bckg.txt','DEERb1','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_2p4us_bckg.txt','DEERb2','-ascii')
% save('20251226_K11V_L5C_Rx_batch2_500uM_rep_DEER_1p6us_3hrs_bckg.txt','DEERb3','-ascii')
% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_1pcTritonX_DEER_1p6us_bckg.txt','DEERb4','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcCHAPS_DEER_1p6us_bckg.txt','DEERb5','-ascii')
% save('20260115_Anthraflavic_DEER_1p6us_30ns_bckg.txt','DEERb6','-ascii')
% save('20260116_Triradical_NO_30ns_DEER_1p6us_bckg.txt','DEERb7','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_1p6us_bckg.txt','DEERb8','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_2p4us_bckg.txt','DEERb9','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_1p6us_bckg.txt','DEERb10','-ascii')

% % % Expfit corrected DEER

% save('20250714_K11V_L5C_Rx_V2L_batch2_500uM_DEER_1p6us_bckgcorr.txt','PhaseDEERb1','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_2p4us_bckgcorr.txt','PhaseDEERb2','-ascii')
% save('20251226_K11V_L5C_Rx_batch2_500uM_rep_DEER_1p6us_3hrs_bckgcorr.txt','PhaseDEERb3','-ascii')
% save('20260113_K11V_L5C_Rx_V2L_batch2_500uM_1pcTritonX_DEER_1p6us_bckgcorr.txt','PhaseDEERb4','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcCHAPS_DEER_1p6us_bckgcorr.txt','PhaseDEERb5','-ascii')
% save('20260115_Anthraflavic_DEER_1p6us_30ns_bckgcorr.txt','PhaseDEERb6','-ascii')
% save('20260116_Triradical_NO_30ns_DEER_1p6us_bckgcorr.txt','PhaseDEERb7','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_1pcOG_DEER_1p6us_bckgcorr.txt','PhaseDEERb8','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_2p4us_bckgcorr.txt','PhaseDEERb9','-ascii')
% save('20250719_K11V_L5C_Rx_V2L_batch2_500uM_0p05pcDDM_DEER_1p6us_bckgcorr.txt','PhaseDEERb10','-ascii')
