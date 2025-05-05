% Sets up variables for gamma(2\beta J) < 1 (we take b == gamma(2\beta J)).
N = 10;
b = 0.7;
r = (N+1)/(1-b);
x = linspace(0, N);
y1 = zeros(1,100);
y2 = zeros(1,100);

% For L \in [0, N] y1(L) is exact covariance bound and y2(L) is
% exponential bound with \xi = |ln(b)|^{-1}.
for i=1:100
    y1(i) = 2*r*(b^x(i)-b^(N+1))+r^2*(b^x(i)-b^(N+1))^2;
    y2(i) = 2*(r*(1-b^(N+1))+0.5*r^2*(1-b^(N+1))^2)*b^(x(i));
end

% Plots the graphs for for y1 and y2 to show that y2(L) >= y1(L) for all L
% \in [0, N] (Figure 4 in paper).
figure(1)
plot(x,y1)
hold on
plot(x,y2)
legend('Exact bound', 'Exponential bound')
xlabel('L = d(A,B)')
ylabel('|cov| bound')
% print -depsc blessthan1.eps


% Sets up variables for gamma(2\beta J) > 1, with some extra variables
% defined for ease.
N = 10;
b = 1.1;
r = (N+1)/(b-1);
B = b^(N+1);
R = r*B+1;
x = linspace(0, N);
y1 = zeros(1,100);
y2 = zeros(1,100);

% For L \in [0, N] y1(L) is exact covariance bound and y2(L) is
% exponential bound with \xi = 0.5*|ln(b)|^{-1}.
for i=1:100
    y1(i) = 2*r*(B-b^x(i))+r^2*(B-b^x(i))^2;
    y2(i) = ((R^2-4+R*sqrt(R^2+8))*(5*R^2+4-3*R*sqrt(R^2+8))/(64*r^2))*b^(-2*x(i));
end

% Plots the graphs for for y1 and y2 to show that y2(L) >= y1(L) for all L
% \in [0, N] (Figure 6 in paper).
figure(2)
plot(x,y1)
hold on
plot(x,y2)
legend('Exact bound', 'Exponential bound')
xlabel('L = d(A,B)')
ylabel('|cov| bound')
% print -depsc bgreaterthan1.eps

% Set up variables for gamma(2\beta J) < 1.
N = 10;
b = 0.7;
r = (N+1)/(1-b);
x = linspace(0, N);
y1 = zeros(1,100);
y2 = zeros(1,100);

% For L \in [0, N] y1(L) is exact covariance bound and y2(L) is
% exponential bound with \xi = 0.5*|ln(b)|^{-1}.
for i=1:100
    y1(i) = r*(b^x(i)-b^(N+1))+0.5*r^2*(b^x(i)-b^(N+1))^2;
    y2(i) = (r*(1-b^(N+1))+0.5*r^2*(1-b^(N+1))^2)*b^(2*x(i));
end

% Plots the graphs for for y1 and y2 to show that they are very similar for
% all L \in [0, N] (Figure 5 in paper).
figure(3)
plot(x,y1)
hold on
plot(x,y2)
legend('Exact bound', 'Exponential bound')
xlabel('L = d(A,B)')
ylabel('|cov| bound')
% print -depsc blessthan1doublexi.eps
