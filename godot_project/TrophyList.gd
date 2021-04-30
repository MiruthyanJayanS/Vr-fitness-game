extends Spatial

var runtime = 0
var groove = 0

var user_scores = Dictionary()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_trophies()

func update_trophies():
	$Viewport/CanvasLayer/Panel/Runtime.bbcode_text = "[b][i]Running time[/i][b]\n[b][color=navy]%d seconds[/color][/b]"%runtime
	$Viewport/CanvasLayer/Panel/Groovetime.bbcode_text = "[b][i]Groove time[/i][b]\n[b][color=navy]%d seconds[/color][/b]"%groove
	var text = ""
	for user in user_scores:
		text += "[b][i]%s[/i][b]\n[b][color=navy]%.1f[/color][/b]\n"%[user_scores[user].get("name","Player"), user_scores[user].get("points",0)]
	$Viewport/CanvasLayer/Panel/Scores.bbcode_text = text
	$Viewport.render_target_update_mode = Viewport.UPDATE_ONCE
	
func set_runtime(t):
	runtime = t
	update_trophies()

func set_groovetime(t):
	groove = t
	update_trophies()

func set_score(userid, name, score, points):
	if not user_scores.has(userid):
		user_scores[userid] = {"name": name, "score": score, "points": points}
	
	user_scores[userid]["score"] = score
	user_scores[userid]["name"] = name
	user_scores[userid]["points"] = points
	
	update_trophies()
	
	
	
	
	
	
	
	
	
	
	
