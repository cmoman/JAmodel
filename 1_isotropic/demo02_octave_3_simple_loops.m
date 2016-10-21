% The MIT License (MIT)
%
% Copyright (c) 2016 Roman Szewczyk
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% 
%
% DESCRIPTION:
% Demonstration of solving Jiles-Atherton model of three hysteresis loops with increase of magnetizing field amplitude
% 
% AUTHOR: Roman Szewczyk, rszewczyk@onet.pl
%
% RELATED PUBLICATION(S):
% [1] Jiles D. C., Atherton D. "Theory of ferromagnetic hysteresis” Journal of Magnetism and Magnetic Materials 61 (1986) 48.
% 
% USAGE:
% demo01_octave_simple_loop
% 
% IMPORTANT: Demo requires "odepkg" installed and loaded  
% "odepkg" is packagre for solving ordinary differential equations.
%

clear all
clc

page_screen_output(0);
page_output_immediately(1);  % print immediately at the screen


fprintf('\n\nDemonstration of Jiles-Atherton model - three hysteresis loops.');
fprintf('\nDemonstration optimized for OCTAVE. For MATLAB please use demo01_matlab_simple_loop.m ');
fprintf('\nDemonstration requires odepkg installed.\n\n');


% check if odepkg is installed. Load odepkg if installed, but not loaded.
ChkPkg('odepkg');

% Calculate Jiles-Atheton model for the case presented in [1]
 
% prepare variables for modelling

Ms=1.6e6;
a=1100;
alpha=1.6e-3;
k=400;
c=0.2;        % Parameters of Jiles-Atherton model specified in [1]

fprintf('Calculation for parameters: \na=%f(A/m), k=%f(A/m), c=%f, Ms=%e(A/m), alpha=%e \n\n',a,k,c,Ms,alpha);

H=[0:0.01:1 1:-0.01:-1 -1:0.01:1]'; % magnetizing field H - column vector
H=[H.*1000 H.*3000 H.*6000];

SolverType=1; % ode23() solver

fprintf('Calculations started. Expected time of calculations: below 2 minutes.\n');
Bmodel = JAn_loops(a,k,c,Ms,alpha,H,SolverType);
fprintf('Calculations finished.\n\n');

plot(H, Bmodel,'-o');
xlabel('H (A/m)');
ylabel('B (T)');
grid;


