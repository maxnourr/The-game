extends Node
#le singleton responsable des fonctions associés à chaque gene
#cela inclu changement de couleur, création de mollécule mais aussi la détection des dites mollécules
func express(genome,bacteria):
	if bacteria == 1:
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
			8:
				PlayerVar.Luxl = true
			9:
				if PlayerVar.AHL:
					genome.State = true
				else:
					genome.State = false
			10:
				PlayerVar.Biofertiliser = true
	elif bacteria == 2:
		match genome.ID:
			1:
				if PlayerVar.UV:
					PlayerVar.player_color_2 = Color(0.118, 1, 0.102) #change couleur gfp
					PlayerVar.gfp_2 = true
				else:
					PlayerVar.gfp_2 = false
					PlayerVar.player_color_2 = PlayerVar.default_player_color
			2:
				if PlayerVar.lactose:
					genome.State = true
				else:
					genome.State = false
			3:
				PlayerVar.ampr_2 = true
			4:
				PlayerVar.Mucus_2 = true
			5:
				PlayerVar.Interlekin_2 = true
			6:
				PlayerVar.EC20_2 = true
			7:
				PlayerVar.FtsZ_2 = true
			8:
				PlayerVar.Luxl_2 = true
			9:
				if PlayerVar.AHL:
					genome.State = true
				else:
					genome.State = false
			10:
				PlayerVar.Biofertiliser_2 = true		
		
func back_to_back():
	PlayerVar.return1()
	
func back_to_back2():
	PlayerVar.return2()
	#PlayerVar.gfp = false
	#PlayerVar.ampr = false
	#PlayerVar.Mucus = false
	#PlayerVar.EC20 = false
	#PlayerVar.Interlekin = false
	#PlayerVar.FtsZ = false
	#PlayerVar.Luxl = false
	#PlayerVar.Biofertiliser = false
			
