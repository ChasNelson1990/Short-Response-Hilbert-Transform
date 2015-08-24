%% Demo file for the Short Response Hilbert Transform (SRHLT)

%% Example 1 - A single clean edge in 1D, i.e. a step
% Create a signal 100 elements long with a randomly positioned drop
Xr = 10*ones(100,1);
Xr(randi(100):end) = 0;

% Calculate SRHLT and HILBERT
srh = SRHLT(Xr);
h = hilbert(Xr);

% Plot for visual comparison
figure('units','normalized','outerposition',[0 0 1 1],'Name','Example 1 - A single clean edge'), hold on
subplot(221), hold on, plot(Xr), ylim([-1,11]), title('Original Signal');%Original Signal
subplot(222), hold on, plot(real(srh)), plot(imag(srh)), legend('Imaginary Component','Real Component'), ylim([-15,15]), title('SHRLT function');%SHRLT Result
subplot(223), hold on, plot(real(h)), plot(imag(h)), legend('Imaginary Component','Real Component'), ylim([-15,15]), title('MATLAB''s HILBERT function');%HILBERT Result
subplot(224), hold on, plot(real(srh-h)), plot(imag(srh-h)), legend('Imaginary Component','Real Component'), ylim([-15,15]), title('Difference between SHRLT and HILBERT');%Difference

%% Example 2 - A noisy step with different b-values
% Create a signal 100 elements long with a randomly positioned drop
Xr = 10*ones(100,1);
Xr(randi(100):end) = 0;

% Add random noise
Xr = awgn(Xr,5);%Very noisy signal

% Calculate SRHLT and HILBERT
srh1 = SRHLT(Xr,1);
srh100 = SRHLT(Xr,100);
srh10000 = SRHLT(Xr,10000);
srh1000000 = SRHLT(Xr,1000000);

% Plot for visual comparison
figure('units','normalized','outerposition',[0 0 1 1],'Name','Example 2 - A noisy step with different b-values'), hold on
bounds = [min(-max(Xr),-max(imag(srh1))),max(max(Xr),max(imag(srh1)))];
% b-value of 1
subplot(221), hold on, plot(Xr), plot(real(srh1)), plot(imag(srh1))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 1, i.e. original Hilbert');
% b-value of 100
subplot(222), hold on, plot(Xr), plot(real(srh100)), plot(imag(srh100))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 100');
% b-value of 10000
subplot(223), hold on, plot(Xr), plot(real(srh10000)), plot(imag(srh10000))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 10000');
% b-value of 1000000
subplot(224), hold on, plot(Xr), plot(real(srh1000000)), plot(imag(srh1000000))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 1000000');

%% Example 3 - Multiple noisy steps with different b-values
% Create a signal 100 elements long with a randomly positioned drop
Xr = 10*ones(100,1);
step1 = randi(50);
step2 = step1+randi(50);
Xr(step1:step2) = 5;
Xr(step2:end) = 0;

% Add random noise
Xr = awgn(Xr,5);%Very noisy signal

% Calculate SRHLT and HILBERT
srh1 = SRHLT(Xr,1);
srh100 = SRHLT(Xr,100);
srh10000 = SRHLT(Xr,10000);
srh1000000 = SRHLT(Xr,1000000);

% Plot for visual comparison
figure('units','normalized','outerposition',[0 0 1 1],'Name','Example 3 - Multiple noisy steps with different b-values'), hold on
bounds = [min(-max(Xr),-max(imag(srh1))),max(max(Xr),max(imag(srh1)))];
% b-value of 1
subplot(221), hold on, plot(Xr), plot(real(srh1)), plot(imag(srh1))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 1, i.e. original Hilbert');
% b-value of 100
subplot(222), hold on, plot(Xr), plot(real(srh100)), plot(imag(srh100))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 100');
% b-value of 10000
subplot(223), hold on, plot(Xr), plot(real(srh10000)), plot(imag(srh10000))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 10000');
% b-value of 1000000
subplot(224), hold on, plot(Xr), plot(real(srh1000000)), plot(imag(srh1000000))
legend('Input Signal', 'Imaginary Component','Real Component')
ylim(bounds), title('B-Value of 1000000');