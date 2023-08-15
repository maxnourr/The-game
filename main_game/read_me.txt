Yo! bienvenue au main game, vous allez voir c'est plutôt trkl

le jeu est pour l'instant composé de trois dossiers globaux et de trois scènes

Genome
	genome contient la définition de la classe genome ainsi que la liste de tout les gènes existants
	
PlayerVar
	inclu toute les variables du joueur, vie,couleur, resistance,gènes exprimés

Express
	inclu toute les fonctions associés  aux gènes (changer la couleur, produire une mollécule, tout ces trucs)
	
	
la classe genome:
	comme mentionné plutôt, on a une classe génome. ELle est composé de 4 choses.
	
	Son ID
		c'est un nombre, c'est celui qui est lu dans express pour exprimer les bons genes
	Son Prix
		permettra d'inclure une notion de gestion dans le jeu
	Sa couleur
		la couleur du petit rectangle dans l'edition des plasmids, purement esthetique et là pour éviter qu'on s'y perde
	Son etat
		un bool très souvent à true mais dans certains cas à false. Il permet l'arrêt de l'expression des gènes d'un plasmid
		utile pour permettre aux joueurs de créer des conditions dans leur gène
		
		
Les trois scènes sont: 
	
	main
		là où on va pouvoir jouer.
	
	build
		là où on fabrique nos plasmids.
		
	edit_plasmid
		permet de delete les plasmids dans la bactérie
