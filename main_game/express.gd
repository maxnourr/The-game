extends Node
#le singleton responsable des fonctions associés à chaque gene
#cela inclu changement de couleur, création de mollécule mais aussi la détection des dites mollécules
func express(genome):
	match genome.ID:
		1:
			PlayerVar.player_color = Color(0.118, 1, 0.102) #change couleur gfp
			PlayerVar.gfp = true
		
