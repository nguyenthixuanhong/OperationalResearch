/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Sep 19, 2026 at 11:16:14 PM
 *********************************************/
//decisions variables 
dvar float+ x1; 
dvar float+ x2; 

//objective function
maximize x1 + 5*x2; 

//constrains 
subject to {
  5*x1 + 10*x2 <= 300;
  x1 >= 0; 
  x1 <= 30;
  x2 >= 0;
  x2 <= 20;
  }