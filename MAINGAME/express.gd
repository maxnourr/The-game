extends Node
#le singleton responsable des fonctions associés à chaque gene
#cela inclu changement de couleur, création de mollécule mais aussi la détection des dites mollécules
func express(genome):
	match genome.ID:
		1:
			if PlayerVar.UV:
				PlayerVar.player_color = Color(0.118, 1, 0.102) #change couleur gfp
				PlayerVar.gfp = true
			else:
				PlayerVar.gfp = false
				PlayerVar.player_color = PlayerVar.default_player_color
		2:
			if PlayerVar.lactose:
				genome.State = true
			else:
				genome.State = false
		3:
			PlayerVar.ampr = true
		4:
			PlayerVar.Mucus = true
		5:
			PlayerVar.Interlekin = true
		6:
			PlayerVar.EC20 = true
		7:
			PlayerVar.FtsZ = true
		
func back_to_back():
	PlayerVar.gfp = false
	PlayerVar.ampr = false
	PlayerVar.Mucus = false
	PlayerVar.EC20 = false
	PlayerVar.Interlekin = false
	PlayerVar.FtsZ = false
			
