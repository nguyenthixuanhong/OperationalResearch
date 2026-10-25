/*********************************************
 * OPL 22.1.1.0 Model
 * Author: pink
 * Creation Date: Sep 17, 2026 at 10:02:59 AM
 *********************************************/
 
 //decision variables
 //non-negative decision variables (int, float, boolean)
dvar float+ x1; 
dvar float+ x2;
dvar float+ x3; 

//expression 
//ojective (maximize, minimize)
maximize x1 + x2 + x3;

//constraints (sum(), forall(), x[i], x[i][j])
//forall(i in Workers)
//    sum(j in Jobs) x[i][j] == 1;

subject to {
2*x1+ 3*x2 <= 10; 
5*x3 <= 15; 
x1 + 8*x2 <= 25;
//4*x1 + 16*x2 <= 120; 
//5*x1 + 10*x2 <= 220; 
} 