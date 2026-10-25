/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Oct 22, 2026 at 3:57:13 PM
 *********************************************/


// decision variables
dvar int+ x[1..5];

// objective function
minimize 2*x[1]+2*x[2]+3*x[3]+3*x[4]+2*x[5];

// constraints
subject to{

  x[1]+1.2*x[2]-2*x[3]+1.5*x[4]+2*x[5] >=30;
      -    x[2]+2*x[3]         +  x[5] >=25;
2*x[1]+1.5*x[2]+3*x[3]+4*x[4]          >=12.5;

// add here constraints to build the B&B search tree 

}