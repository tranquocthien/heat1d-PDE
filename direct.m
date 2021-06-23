function U=direct(a,dx,dt,u0,g1,g2,f);
% Purpose: Solve the direct_problem
%  u_t-au_xx=f(x,t), 0<=x<=1, 0<=t<=T
%     u(x,0)=u0(x)
%     u(0,t)=g1(t)
%     u(1,t)=g2(t)
% Input: u0,g1,g2,f,a,T,M,N
% Output: U_direct
%==========================================================================
% a=1; 
% t_0=0;  
% t_f=1;
% Xmin = 0; 
% Xmax = 1; 
% Nx=101; 
% Nt=101;
% 
% dx = (Xmax - Xmin)/(Nx-1); x = (linspace(Xmin,Xmax,Nx))';
% dt = (t_f-t_0)/(Nt-1); t = t_0:dt:t_f;
% 
% f=-sin(pi*x)*ones(1,Nt)+pi^2*sin(pi*x)*(ones(1,Nt)-t);
% g1=zeros(1,Nt);
% g2=g1;
% u0=sin(pi*x);
% Ue=sin(pi*x)*(ones(1,Nt)-t);
[Nx,Nt]=size(f);

F=f;
G1=g1;
G2=g2;
U0=u0;
U=zeros(Nx,Nt);
%tao gia tri ban dau
U(:,1)=u0;

    c=2*a+dx^2/dt;  
    for o=2:(Nt)
     for r=2:o
     % Create matrix A and vecto b
        A=zeros(Nx,Nt);
        b=zeros(Nx,1);
        A(1,1)=1;
        A(Nx,Nx)=1;
        b(1)=g1(r);
        b(Nx)=g2(r);
        for i=2:Nx-1
            A(i,i)=c;
            A(i,i-1)=-a;
             A(i,i+1)=-a;
            b(i)=dx^2*f(i,r)+U(i,r-1)*dx^2/dt;            
        end
    U(:,o)=A\b;
     end
    end
  
% err=Ue-U;
% figure;
% surf(err)
% normL2=sqrt(sum(sum(err.^2)*dx*dt))
