function onGoalSelected() {
	var player = Players.GetLocalPlayerPortraitUnit();
	$.Msg(player);
	var dropdown = $("#kill_goal")
	var keys = {PlayerID : player, kill_goal : dropdown.GetSelected().text};
	$.Msg(this.text);
	GameEvents.SendCustomGameEventToServer( "kill_goal", keys );
}