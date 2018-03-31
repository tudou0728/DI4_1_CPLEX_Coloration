/*********************************************
 * OPL 12.7.1.0 Model
 * Author: liyuanyuan
 * Creation Date: 27 nov. 2017 at 17:45:14
 *********************************************/

  //Data
 {string} Sommets = ...;
int Arcs[Sommets][Sommets] = ...;
 {string} Couleur = ...;
 int NbCouleur=...;

//Variables
dvar boolean Coleur[Sommets][Sommets]; //1：两个节点颜色不同 0：两个节点颜色相同
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
	  if(Arcs[b][c]==1)
	  	ColeurDeSommet[b]>=ColeurDeSommet[c]+(1-Coleur[b][c])+1;
	  
	forall( b in Sommets,c in Sommets)
	  if(Arcs[b][c]==1)
		ColeurDeSommet[b]+1<=ColeurDeSommet[c]+(Coleur[b][c]);
}