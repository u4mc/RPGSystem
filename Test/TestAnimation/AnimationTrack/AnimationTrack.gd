extends Resource


export(Dictionary) var track

#export(Array,String) var actor_alias


func setup(nodes:Array):
	for frame in track.values():
		for action in frame:
			if action.arg["node"]:
				pass
				#replace placeholder with nodes[placeholder]
