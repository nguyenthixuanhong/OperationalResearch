/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Oct 23, 2026 at 1:44:37 PM
 *********************************************/
 
//paramter imported from dat file

//number of time slot
int T = ...;
//number of shift
int N = ...; 
//demand employee in each time slot
int b[1..T] = ...;
//coeffience matrix
int A[1..T][1..N] = ...;

//decison variables 
dvar int+ x[1..N]; /* the number of employee in each shifts */
dvar int+ y[1..T]; /* 1 if a time slot has a shortage */

//objective function: minimizing the total number of worked hours 
minimize 
	sum(j in 1..N)
        (sum(t in 1..T) A[t][j]) * x[j];
//constraints 
subject to {
  forall(t in 1..T) {
	  sum (j in 1..N) A[t][j] * x[j] >= 0.8*b[t];
  	}
  sum (t in 1..T) y[t] <= 2; 
  
}