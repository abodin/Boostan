clc
clear all
close all

% Define a continuous function
f = '4*sin(2*pi*t)';

% Sampling frequency 
Fs = .05;

% duration = 1 sec (0 to 1 sec)

% Number of samples
symNum = 1/Fs;

% Samples
samples = zeros(1,symNum);

% Sampling
counter = 1;
for t=0:.05:1
    
    samples(counter) = subs(f,t);
    counter = counter + 1;
    
end
