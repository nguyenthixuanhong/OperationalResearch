/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Celine
 * Creation Date: 11 oct. 2020 at 19:27:26
 *********************************************/



// decision variables
dvar float+ x[1..5];

// objective function
minimize 2*x[1]+2*x[2]+3*x[3]+3*x[4]+2*x[5];

// constraints
subject to{

  x[1]+1.2*x[2]-2*x[3]+1.5*x[4]+2*x[5] >=30;
      -    x[2]+2*x[3]         +  x[5] >=25;
2*x[1]+1.5*x[2]+3*x[3]+4*x[4]          >=12.5;

// add here constraints to build the B&B search tree 



}
 