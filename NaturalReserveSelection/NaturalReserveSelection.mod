/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Oct 23, 2026 at 2:54:18 PM
 *********************************************/

 
 //parameter
 int S = ...;
 int R = ...;
 int B = ...;
 int c[1..R] = ...;
 int a[1..S][1..R] = ...;
 
 //decision variables 
 dvar float+ x[1..R]; /* 1 if x[r] site is opening */
 dvar float+ y[1..S]; /* 1 if y[s] species is protected */
 //objective function 
 maximize 
 	sum(s in 1..S)
 	  y[s];
 
 //constraints
 subject to {
//   budget constraint
	sum(r in 1..R) c[r]*x[r] <= B;
// at least 1 species in opening site  
	forall(s in 1..S)
	  sum(r in 1..R) a[s][r] * x[r] >= y[s]; 
	  
////addition conditions for branch-bound algorithms 
	x[7] == 1;
	x[3] == 1;
	x[4] == 0;
	x[5] == 0;
	x[6] == 0;	
	x[2] == 0;
	x[1] == 1;
}