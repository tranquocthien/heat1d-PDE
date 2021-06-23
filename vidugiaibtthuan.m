close all;
% ------- Buoc luoi: 
exa = 'exa3_1'; % ten vi du
epsilon=1e-2;
a=1;
t_0=0;  
t_f=0.1;
Xmin = 0; 
Xmax = 1; 
Nx=50; 
Nt=25;

dx = (Xmax - Xmin)/(Nx-1); x = (linspace(Xmin,Xmax,Nx))';
dt = (t_f-t_0)/(Nt-1); t = t_0:dt:t_f;
NoiseLevel = 0.01;
%%% VÍ D? 1%%%%%%%%%%%%555
u0 = sin(2*pi*x);
g1=zeros(1,Nt+1);
g2=zeros(1,Nt+1);
f=(1+4*pi^2)*u0*exp(t);
Uex=u0*exp(t);

%%% VÍ D? 2 %%%%%%%%%%%%5
% f=ones(Nx+1,1)*exp(-t);
% g1=zeros(1,Nt+1);
% g2=exp(-t)*cos(1)-exp(-t);
% u0=cos(x)'-ones(Nx+1,1);
% Uex=cos(x).'*exp(-t)-ones(Nx+1,1)*exp(-t);
%%%%%%%%%%%%%%%%%%%%%%%%%
% G?i ch??ng trình
U=direct(a,dx,dt,u0,g1,g2,f);

%%% sai so trong L_2
disp('sai so theo chuan L_2')
err2 = norm(U-Uex)/sqrt(Nx+1)
%displayresult_final

%%%%% V? hình
figure;set(gca,'Fontsize',15);
surf(Uex);title('Nghiem chinh xac');
figname = [exa,'exact.eps'];
%print('-depsc2',figname);

% nghiem xap xi bai toan thuan
figure;set(gca,'Fontsize',15);
surf(U);title('Nghiem xap xi');
figname = [exa,'approx.eps'];
%print('-depsc2',figname)

% sai so tung diem
figure;set(gca,'Fontsize',15);
surf(U-Uex);title('Sai so tung diem');
figname = [exa,'err.eps'];
%print('-depsc2',figname);
