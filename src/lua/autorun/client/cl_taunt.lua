-- PropHuntersAutoTaunt (PHAT)

hook.Add("InitPostEntity", "phatInitPostEntity", function()
	if GAMEMODE.Name == "Prophunters" then
		print "\n"
		print "Prop Hunters Auto-Taunt v0.0.2"
		print "  Created by Mike Smullin"
		print "  Last modified 9/17/2015"
		print "\n"
		
		local function newTimer()
			timer.Create("phatAutoTaunt", math.random(AUTO_TAUNT_DELAY_MIN, AUTO_TAUNT_DELAY_MAX), 1, function()
				-- if round has started
				if GAMEMODE.GameState == 2 then
					-- and current player is prop
					if LocalPlayer():Team() == 3 then
						-- force them to taunt
						RunConsoleCommand("phatAutoRandomTaunt");
					end
				end
				
				-- otherwise, check again later
				newTimer();
			end)
		end
			
		newTimer();
	end
end)
