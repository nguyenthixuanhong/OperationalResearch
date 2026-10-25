/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Oct 23, 2026 at 4:25:22 PM
 *********************************************/

//parameters 
int P = ...;
int EAT[1..P] = ...;
int TAT[1..P] = ...;
int LAT[1..P] = ...; 
int EP[1..P] = ...;
int LP[1..P] = ...;
int I[1..P][1..P] = ...;
float M = ...;

//decision variables 
dvar float T[1..P];       // actual Landing times
dvar float+ E[1..P];  // Earliness
dvar float+ L[1..P];   // Lateness
dvar boolean z[1..P][1..P]; // 1 if plane p land before q 

//objective function 
minimize 
	sum(p in 1..P) 
		(EP[p] * E[p] + LP[p] * L[p]);

//constraints 
subject to {
      // Landing time windows
    forall(p in 1..P) {
        T[p] >= EAT[p];
        T[p] <= LAT[p];
    }

    // Earliness and lateness
    forall(p in 1..P) {
        E[p] >= TAT[p] - T[p];
        L[p] >= T[p] - TAT[p];
    }

    // Runway safety for every pair of planes
    forall(p in 1..P, q in p+1..P) {
        T[q] >= T[p] + I[p][q]
                - M * (1 - z[p][q]);

        T[p] >= T[q] + I[q][p]
                - M * z[p][q];
    }
}