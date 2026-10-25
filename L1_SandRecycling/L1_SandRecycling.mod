/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Sep 19, 2026 at 11:44:42 PM
 *********************************************/

//paramter imported from dat file
int I = ...;
int J = ...;
int K = ...;
int L = ...;
int Q = ...;

int o[1..I] = ...;
int s[1..J] = ...;
float t[1..Q] = ...;

int r = ...;

int p[1..L][1..Q-1] = ...;

int alpha[1..I][1..J] = ...;

int beta[1..J][1..K] = ...;

int gamma[1..K][1..J] = ...;

int delta[1..J][1..L] = ...;
//decison variables 

dvar float+ A[1..I][1..J];
dvar float+ B[1..J][1..K];
dvar float+ C[1..K][1..L];
dvar float+ D[1..J][1..L][1..2];




//objective function 
//minimize transportation cost
minimize 
	sum(i in 1..I, j in 1..J) alpha[i][j] * A[i][j] 
	+ sum(j in 1..J, k in 1..K) beta[j][k] * B[j][k] 
	+ sum(k in 1..K, l in 1..L) gamma[k][l] * C[k][l]
//	+ sum(j in 1..J, l in 1..L) delta[j][l] * D[j][l];
	+ sum(j in 1..J, l in 1..L, q in 1..Q-1) delta[j][l] * D[j][l][q];

//constraints 
subject to {
//  recycle all the sieved sand
	forall(i in 1..I) {
	  sum (j in 1..J) A[i][j] == o[i];
  	}
//  	depot: flow conservation for Q3 sand
  	forall(j in 1..J){
  	  t[3] * sum(i in 1..I) A[i][j] == sum(k in 1..K) B[j][k];
  	  }
//  	  depot: flow conservation for Q1/Q2 sand
	forall(q in 1..Q-1, j in 1..J){
	  t[q] * sum(i in 1..I) A[i][j] == sum(l in 1..L) D[j][l][q];
	  }
//	  retreating facility: flow conservation 
	forall(k in 1..K) {
	  sum(j in 1..J) B[j][k] == sum(l in 1..L) C[k][l];
	  }
//	  project max amount of Q1 sand
	forall(l in 1..L) {
	  sum(k in 1..K) C[k][l] + sum(j in 1..J) D[j][l][1] <= p[l][1];
	  }
// project max amount of Q2 sand 
	forall(l in 1..L) {
	  sum(j in 1..J) D[j][l][2] <= p[l][2];
	  }
//	  depot capacity 
	forall(j in 1..J) {
	  sum(i in 1..I) A[i][j] <= s[j];
	  }
//	  retreating facility capacity
	forall(k in 1..K) {
	  sum(j in 1..J) B[j][k] <= r;
	  }

  }