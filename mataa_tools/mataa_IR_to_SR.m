function [s,t] = mataa_IR_to_SR (h,t);

% function [s,t] = mataa_IR_to_SR (h,t);
%
% DESCRIPTION:
% calculates the step response of a system with impulse response h(t)
%
% INPUT:
% h: impulse response
% t: time coordinates of samples in h (vector, in seconds) or sampling rate of h (scalar, in Hz)
%
% OUTPUT:
% s: step response
% t: time (seconds)
% 
% DISCLAIMER:
% This file is part of MATAA.
% 
% MATAA is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% MATAA is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with MATAA; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
% 
% Copyright (C) 2006, 2007, 2008 Matthias S. Brennwald.
% Contact: info@audioroot.net
% Further information: http://www.audioroot.net/MATAA

if isscalar(t)
    t = [0:1/t:(length(h)-1)/t];
end


dt = (max(t)-min(t))/(length(t)-1);

s = cumsum(h)*dt;
s=s-s(1); % offset = first sample of s
