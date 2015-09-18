concommand.Add("phatAutoRandomTaunt", function(ply, com, args, full)
	if not IsValid(ply) then return end

	-- if it has been at least the minimum time since the player last taunted
	-- incl. manual taunts via client gui and manual console commands issued
	if (not ply.Taunting) or ply.Taunting < CurTime() - AUTO_TAUNT_DELAY_MIN then
		-- forward request to actual prophunters gamemode command
		game.ConsoleCommand("ph_taunt_random\n")
	end
end)
