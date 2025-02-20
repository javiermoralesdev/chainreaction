extends Control

func update(r: Round):
	var time = Time.get_datetime_dict_from_unix_time(r.time)
	var time_str = str(time.get("day")) + "/" + str(time.get("month")) + "/" + str(time.get("year")) + " " + str(time.get("hour")) + ":" + str(time.get("minute")) + ":" + str(time.get("second"))
	$TimeLabel.text = time_str
	$TurnsText.text = tr("record_turn").format({"turns": str(r.turns)})
	$Player1Name.text = r.player1.name
	$Player2Name.text = r.player2.name
	$Player1Figure.texture = Global.pieces[r.player1.piece]
	$Player1Figure.modulate = r.player1.color
	$Player2Figure.texture = Global.pieces[r.player2.piece]
	$Player2Figure.modulate = r.player2.color
	$WinLabel.text = tr("record_won").format({"player": r.player1.name if r.player1_won else r.player2.name})
