% This file is used to check if functions defined during Lab_1 are correct
% and work as intended.
% The tests done are as follows:
%   - Test 1: Given radius and velocity calculate orbital parameters with rv2parorb 
%             and feed them to parorb2rv to assert the returned radius and
%             velocity are correct
%   - Test 2: Given orbital parameters calculate radius and velocity with parorb2rv 
%             and feed them to rv2parorb to asser the returned orbital parameters
%             are correct
%   - Plot visualization: Plots the two orbits given proving that the plotOrbit function
%                         works as intended

clear;
addpath("..\Functions\");

% Shared parameters
mu = 398600;
tol = 1e-5;

%% Test 1

rr = [-1788.3462; -9922.9190; -1645.8335];
vv = [5.6510; -1.1520; -1.8710];

[a, e, i, OM, om, theta] = rv2parorb (rr, vv, mu);
[rad, vel] = parorb2rv(a, e, i, OM, om, theta, mu);

assert(all(abs(rr-rad) < tol));
assert(all(abs(vv-vel) < tol));

%% Test 2

a = 13290;
e = 0.3855;
i = 0.9528;
OM = 2.5510;
om = 2.2540;
theta = 3.0360;

[rr, vv] = parorb2rv(a, e, i, OM, om, theta, mu);
[a_2, e_2, i_2, OM_2, om_2, theta_2] = rv2parorb (rr, vv, mu);

assert(abs(a-a_2) < tol);
assert(abs(e-e_2) < tol);
assert(abs(i-i_2) < tol);
assert(abs(OM-OM_2) < tol);
assert(abs(om-om_2) < tol);
assert(abs(theta-theta_2) < tol);

%% Plot visualization

a = 13290;
e = 0.3855;
i = 0.9528;
OM = 2.5510;
om = 2.2540;
rr = [-1788.3462; -9922.9190; -1645.8335];
vv = [5.6510; -1.1520; -1.8710];
th_i = 0; th_f = 2*pi; dth = 0.01;

[a_2, e_2, i_2, OM_2, om_2, theta_2] = rv2parorb (rr, vv, mu);

plotOrbit(a, e, i, OM, om, th_i, th_f, dth, mu);
hold on; grid minor; axis equal;
plotOrbit(a_2, e_2, i_2, OM_2, om_2, th_i, th_f, dth, mu);