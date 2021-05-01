%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Circuits II
% RLC Plots
% Spring 2020
% Wilson Woods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% component values
R1 = 1;
R2 = 1;
L = 1;
C = 1;

% coefficients
A0 = R1* R2;
A1 = L * R1;
A2 = L * C * R1 * R2;

B0 = R1 + R2;
B1 = L + ( C * R1 * R2 );
B2 = L * C * R2;


% transfer function components
num = [ A2, A1, A0 ];
den = [B2 , B1, B0 ];

% determine poles and zeros
zeros = roots( num )
poles = roots( den )

% radian frequency
w = linspace( 0, 2 * pi, 100 );
s = j * w;


Zab = ( A2 * s .^ 2 + A1 * s + A0 ) ./ ( B2 * s .^ 2 + B1 * s + B0 );


plot( imag( s ) * 0.1, abs( Zab ) );
xlabel( 'Frequency (Hz)' );
ylabel( 'Voltage (V)' );

% 1D arrays for sigma and omega
SIG = -2 : 0.02 : 0;
OMG = -3 : 0.02 : 3;

[ sigma, w ] = meshgrid( SIG, OMG );

% this time w/ sigma
s = sigma+j*w;                                  

% calculate H(s)
H_of_s = ( A2 * s .^ 2 + A1 * s + A0 ) ./ ( B2 * s .^ 2 + B1 * s + B0 );  

% plot H_of_s in dB
figure ( 2 );
mesh( sigma, w, 20 * log10( abs( H_of_s ) ) );            
xlabel( 'sigma' );
ylabel( 'omega' );

figure ( 3 );

% transfer function
SYS = tf( num, den );

% pole-zero plot of transfer function
pzplot( SYS );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










