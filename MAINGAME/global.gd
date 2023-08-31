extends Node

var music = true

func reset():
	for g in GlobalVar.game:
		var level = load(g).instantiate()
		level.reset()
		level.queue_free()
		
func click():
	$click.play()
	await get_tree().create_timer(0.8).timeout
	
func correct():
	$correct.play()

func open():
	$open.play()
	

func body():
	if $body.playing == false:
		$body.play()
	$build/office_ambiance.stop()
	$game_musichard.stop()
	$menu_music.stop()
	$game_musicrandom.stop()
	$build.stop()
	
	
func theme_build():
	$build/office_ambiance.play()
	$body.stop()
	if music and not $build.playing:
		$game_musichard.stop()
		$menu_music.stop()
		$game_musicrandom.stop()
		$build.play()
		
func button_sound():
	$button_sound.play()
	await get_tree().create_timer(0.8).timeout
	
	
func music_game1():
	$build/office_ambiance.stop()
	$body.stop()
	if music and not $game_musicrandom.playing:
		$game_musichard.stop()
		$menu_music.stop()
		$game_musicrandom.play()
		$build.stop()
	
func music_game2():
	$build/office_ambiance.stop()
	$body.stop()
	if music and not $game_musichard.playing:
		$menu_music.stop()
		$game_musicrandom.stop()
		$game_musichard.play()
		$build.stop()
		

func music_menu():
	
	$build/office_ambiance.play()
	$body.stop()
	if music and not $menu_music.playing:
		$game_musichard.stop()
		$game_musicrandom.stop()
		$menu_music.play()
		$build.stop()
		
func music_stop():
	$game_musichard.stop()
	$game_musicrandom.stop()
	$menu_music.stop()
	$build.stop()
