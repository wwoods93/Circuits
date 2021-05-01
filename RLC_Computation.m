%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Circuits II
% RLC Computation
% Spring 2020
% Wilson Woods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [resFreq, vPhasor, iPhasor] = computeRLC( freq, magIs, argIs, R, L, C )

resFreq = 1 / ( 2 * pi * sqrt( L * C ) );

f = freq;

omega = 2 * pi * f;

Is = magIs * cosd( omega + argIs );

AC = 1j * omega * C;
AL = 1 ./ ( 1j * omega * L );
AR = 1 ./ R;
Zeq = 1 ./ sqrt( ( AR ) ^ 2 + ( ( AL ) - ( AC ) ) );

[ theta, rho ] = cart2pol( imag( Is ), real( Is ) );
iPhasor = rho .* exp( j * theta );

[ theta, rho ] = cart2pol( imag( Zeq ), real( Zeq ) );
ZeqPolar = rho .* exp( j * theta );

vPhasor = iPhasor .* ZeqPolar;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    




