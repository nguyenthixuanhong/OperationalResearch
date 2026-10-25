/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Celine
 * Creation Date: 11 oct. 2020 at 19:29:04
 *********************************************/




// decision variables
dvar float+ x[1..4];

// objective function
maximize 9*x[1]+5*x[2]+6*x[3]+4*x[4];

// constraints
subject to{

 6*x[1]+3*x[2]+5*x[3]+2*x[4] <=10;
          x[3]+x[4]          <=1;
-x[1] + x[3]                 <=0;
-x[2] + x[4]                 <=0 ;
forall (i in 1..4) x[i] <=1 ; 


// add here constraints to build the B&B search tree

}

 