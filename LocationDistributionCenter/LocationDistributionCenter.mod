/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Oct 23, 2026 at 10:37:57 PM
 *********************************************/
//parameter 
int n = ...; //the number of potential site DC
int m = ...; //the number of warehouse
int f[1..n] = ...; //initial cost opening site
int K[1..n] = ...; //capacity of DC_i 
int d[1..m] = ...; //demain of warehouse j  
int c[1..n][1..m] = ...; //cost delivery from DC_i to warehouse j

//decision variables 
dvar boolean x[1..n]; // 1 if DC_i is opening
dvar float+ q[1..n][1..m]; //quantity delivery from DC_i to wwarehouse j
//objective function 
minimize 
	sum (i in 1..n) f[i] * x[i] 
	+ sum (i in 1..n, j in 1..m) c[i][j] * q[i][j] ;
	
//constraint 
subject to {
  forall (j in 1..m)
  	sum (i in 1..n) q[i][j] == d[j];
  forall (i in 1..n)
  	sum (j in 1..m) q[i][j] <= K[i] * x[i];

  }
  
