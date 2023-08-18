extends Node


class Genome:
	var ID: int
	var Price: int
	var State: bool
	var Col: Color

	func _init(id: int, price: int, state: bool, color: Color):
		ID = id
		Price = price
		State = state
		Col = color
