s = %s;
clf(0);clf(1);
k=1;
z=0.2;
w=6.2;
g = syslin('c', k*w^2/(s^2+2*z*w*s+w^2));


kp=10;
ti=20;
td=5;// not used
du=1;// if derivative is used = 1...  not used = 0
c = syslin('c', (kp + (ti/kp)/s)+ (du*td/kp)*s);
h = g*c/(1+g*c);
scf(0);
subplot(2,1,1),bode (g);
subplot(2,1,2),bode (h);
t = [0:0.01:3];
scf(1);
plot2d(t,csim('step',t,g),3);   //step responce of plant
plot2d(t,csim('step',t,h),6);   //step responce of plant + controller

for i= 1:15
    c = syslin('c', (kp + (ti/kp)/s)+ (du*i/kp)*s);
    h = g*c/(1+g*c);
    plot2d(t,csim('step',t,h),7+i);  
end
xtitle('Testing Derivative action', 'Radians/sec', 'Magnitude');
e=gce(); p=e.children(1);
datatipCreate(p);

