extends Node

var blocks := {
	"stone": preload("res://blocks/StoneBlock.tscn")
}

func get_block_scene(id: String):
	return blocks.get(id)
