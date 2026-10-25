/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Sep 19, 2026 at 11:26:08 PM
 *********************************************/
//decision variables 
range I = 1..6;
dvar float+  x[I];
float c[I] = [5.3, 6.2, 5.1, 4.9, 6.5, 3.4]; 
int C = 100000;
int l = 5000; 
int u = 40000;
//objective function 
maximize
	sum (i in I) c[i] * x[i]/100;

//constraints 
subject to {
  forall(i in I){
    l <= x[i] <= u;
    }
   x[2] + x[3] + x[5] + x[6] >= 0.5*C; 
   x[1] + x[2] + x[3] <= 0.3*C;
   sum(i in I) x[i] == C;
   
  }

