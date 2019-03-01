%Homework 7 code prob 1
clear all;
clc;

%[]=meshgrid
%contourf()

w=1; %length along y
L=2; %length along x
T1=50; %temperature on other boundaries
T2=150; %temperatures along top boundary

yo=[0:0.05:1]; %number of iterations along x axis
xo=[0:0.05:2]; %number of iterations along y axis
a=1;

for ii=1:length(xo) %sets the number of repeats to the number of iterations along x axis
    x=xo(ii); %for solving
    for jj=1:length(yo) %sets the number of repeats to the number of iterations along y axis
        y=yo(jj); %for solving
        n=1; %sets up the summation from the beginning again with each itteration
        for kk=1:2:9 %solve
            theta(n)=(2/pi)*(((-1)^(n+1)+1)/n)*sin((n*pi*x)/L)*((sinh((n*pi*y)/L))/(sinh((n*pi*w)/L)));
            n=n+1;
        end
        T(jj,ii)= sum(theta)*(T2-T1)+T1; %find temp and put into matrix
    end
end
        
contourf(xo,yo,T)
colorbar
title('Temperature Distribution')
xlabel('x-axis (m)')
ylabel('y-axis (m)')

