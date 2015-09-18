concommand.Add("phatAutoRandomTaunt", function(ply, com, args, full)
	if (not IsValid(ply)) or -- invalid player
		(not ply:Alive()) or -- player not alive
		(ply.Taunting && ply.Taunting > CurTime()) -- player already taunting
	then
		return -- abort
	end
	
	-- if it hasn't been at least the minimum time since the player last taunted
	-- incl. manual taunts via client gui and manual console commands issued
	if (ply.Taunting && ply.Taunting > CurTime() - AUTO_TAUNT_DELAY_MIN) then
		return
	end
	
	-- remainder copied from prophunters
	local potential = {}
	for k, v in pairs(Taunts) do
		if v.sex && v.sex != ply.ModelSex then
			continue
		end

		if v.team && v.team != ply:Team() then
			continue
		end

		table.insert(potential, v)
	end

	if #potential == 0 then 
		return
	end

	local t = potential[math.random(#potential)]
	local snd = t.sound[math.random(#t.sound)]

	local duration = SoundDuration(snd)
	if snd:match("%.mp3$") then
		duration = t.soundDurationOverride or 1
	end

	ply:EmitSound(snd)
	ply.Taunting = CurTime() + duration + 0.1
	ply.TauntAmount = (ply.TauntAmount or 0) + 1
end)
