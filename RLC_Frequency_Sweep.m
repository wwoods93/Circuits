%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Circuits II
% RLC Frequency Sweep
% Spring 2020
% Wilson Woods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i0 = 0.030;
R = 2200;
C = 200e-9;
L = 0.1;
f = 2000;
phi = 60;
omega = 2 * pi * f;

Is = i0 * cosd( omega + phi );

ZC = 1 / ( 1j * omega * C );
ZL = 1j * omega * L;


AC = 1 / ZC;
AL = 1 / ZL;
AR = 1 / R;

Aeq = AC + AL + AR;
Zeq = 1 / sqrt( ( AR ) ^ 2 + ( ( AL ) - ( AC ) ) );

Vs = Is * Zeq
Ic = Is * ( AC / Aeq )
Il = Is * ( AL / Aeq )
Ir = Is * ( AR / Aeq )

resonance_freq = 1 / ( 2 * pi * sqrt( L * C ) )
disp( 'Vs (frequency sweep):\n\n' );
f_array = 100 : 100 : 30000;
for m = 1 : length( f_array )
   f = f_array( m );
   Is = i0 * cosd( 2 * pi * f + 60 );
   Vs(m) = abs( Is * ( 0.0052 + 0.0052i ) );
   disp(Vs(m))
   
end

for i = 1 : 300
    x( i ) = f_array( i );
    y( i ) = Vs( i );
end
plot( x, y )
axis( [ 0 30000 0 0.5e-3 ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    