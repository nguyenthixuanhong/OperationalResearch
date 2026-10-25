/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Sep 19, 2026 at 11:44:04 PM
 *********************************************/
 //parameter 
 int T = 48; 
 float Delta = 0.5;
 float S0 = 20;
 float Smin = 1;
 float Smax = 63;
 float Fc = 16;
 float Fd = 16;
 float beta = 0.1;

float alpha[1..T] = [0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.18, 0.18, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.18, 0.18, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.16, 0.18, 0.18, 0.2, 0.2, 0.22, 0.22, 0.22, 0.22, 0.22, 0.22, 0.2, 0.2, 0.18, 0.18, 0.16, 0.16];

float g[1..T] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5, 7, 10, 15, 20, 25, 30, 35, 40, 50, 50, 50, 50, 60, 60, 60, 55, 60, 60, 50, 45, 45, 40, 40, 35, 30, 20, 10, 2, 0, 0, 0, 0, 0];
float d[1..T] = [10, 10, 15, 15, 15, 15, 15, 15, 10, 10, 15, 15, 20, 25, 25, 30, 35, 35, 30, 25, 25, 25, 20, 20, 25, 25, 25, 30, 30, 30, 30, 25, 20, 25, 30, 35, 40, 40, 40, 45, 30, 30, 25, 25, 20, 20, 15, 10];

 
//decision variables
//range t = 1..T;
dvar float+ P[1..T]; //power bought from grid
dvar float+ S[1..T]; //power sold to grid
dvar float+ C[1..T]; //bat chariging rate
dvar float+ D[1..T];  //bat discharging rate
dvar float+ SOC[0..T]; //state of charge (SOC)

//objective function 
minimize 
	sum(t in 1..T) Delta*(alpha[t]*P[t] - beta*S[t]);


//constraints 
subject to {
  forall(t in 1..T){
    P[t] + D[t] + g[t] == S[t] + C[t] + d[t];
    SOC[t] == SOC[t-1] + Delta * C[t] - Delta * D[t];
    SOC[0] == S0;
    C[t] <= Fc;
    D[t] <=Fd;
    SOC[t] >= Smin;
    SOC[t] <= Smax;
    P[t] >= 0;
    S[t] >= 0;
    C[t] >= 0; 
    D[T] >= 0;
    SOC[t] >= 0;
    
    }
 
  
  }
