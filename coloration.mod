/*********************************************
 * OPL 12.6.1.0 Model
 * Author: liyuanyuan
 * Creation Date: 22 nov. 2017 at 17:41:47
 *********************************************/

 //Data
 {string} Sommets = ...;
int Arcs[Sommets][Sommets] = ...;
 {string} Couleur = ...;
 int NbCouleur=...;

//Variables
//dvar boolean Coleur[Sommets][Sommets]; //1：两个节点颜色不同 0：两个节点颜色相同
dvar int ColeurDeSommet[Sommets] in 1..NbCouleur;

//Objective
minimize 
    max(d in Sommets)
      ColeurDeSommet[d];

//Constraints
subject to {

	forall( a in Sommets )
	  ColeurDeSommet[a]<=(max(d in Sommets)ColeurDeSommet[d]);  
        
	forall( b in Sommets,c in Sommets)
	  abs(ColeurDeSommet[b]-ColeurDeSommet[c])-Arcs[b][c]>=0;//abs(ColeurDeSommet[b]-ColeurDeSommet[c])-Arcs[b][c]*(Coleur[b][c])>=0;
	   
	 //forall( b in Sommets,c in Sommets)
	 	//Coleur[b][c]==Arcs[b][c];
}

tuple CouleurDeSommetSolutionT{
	string Sommets;
	int ColeurDeSommet;
}
{CouleurDeSommetSolutionT} CouleurDeSommetSolution = {<i0,ColeurDeSommet[i0]> | i0 in Sommets};

