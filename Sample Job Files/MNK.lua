
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "7"
MacroSet = "1"

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main={ name="Verethragna", augments={'Path: A',}},
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Moonbow Belt +1",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ear="Etiolation Earring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		left_ring="Regal Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    left_ring="Saida Ring",
		right_ring="Saida Ring",
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		main={ name="Verethragna", augments={'Path: A',}},
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
		feet="Anch. Gaiters +3",
		neck="Mnk. Nodowa +2",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {
		main={ name="Verethragna", augments={'Path: A',}},
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Ken. Sune-Ate +1",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Niqmaddu Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {
		main={ name="Verethragna", augments={'Path: A',}},
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'"Fast Cast"+5','MND+10','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+23','"Fast Cast"+6','VIT+4','"Mag.Atk.Bns."+1',}},
		neck="Voltsurge Torque",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
	}
	sets.Precast.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	sets.Midcast = {}

	sets.JA = {}
	sets.JA["Hundred Fists"] = {legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}}}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Focus"] = {}
	sets.JA["Dodge"] = {}
	sets.JA["Chakra"] = {}
	sets.JA["Boost"] = {}
	sets.JA["Counterstance"] = {}
	sets.JA["Chi Blast"] = {}
	sets.JA["Mantra"] = {}
	sets.JA["Footwork"] = {}
	sets.JA["Perfect Counter"] = {}
	sets.JA["Impetus"] = {}
	sets.JA["Inner Strength"] = {}

	--Default WS set base
	sets.WS = { -- VS Base with Impetus Down
		main={ name="Verethragna", augments={'Path: A',}},
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}, -- Need Aug'd
		body="Ken. Samue +1",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1", -- Need Aug a Herc Feet
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--WS Sets
	sets.WS["Combo"] = {}
	sets.WS["Shoulder Tackle"] = {}
	sets.WS["One Inch Punch"] = {}
	sets.WS["Backhand Blow"] = {}
	sets.WS["Raging Fists"] = {
		neck="Mnk. Nodowa +2",
		feet="Ken. Sune-Ate +1",
	}
	sets.WS["Spinning Attack"] = {}
	sets.WS["Howling Fist"] = {
		neck="Mnk. Nodowa +2",
		feet="Ken. Sune-Ate +1",
	}
	sets.WS["Dragon Kick"] = {
		feet="Anch. Gaiters +3",
	}
	sets.WS["Asuran Fists"] = {}
	sets.WS["Tornado Kick"] = {
		feet="Anch. Gaiters +3",
	}
	sets.WS["Victory Smite"] = {}
	sets.WS["Shijin Spiral"] = {
		main={ name="Verethragna", augments={'Path: A',}},
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	}

	--Custome sets for each jobsetup
	sets.Custom = {}
	--Impetus set has priority over any other modes
	sets.Custom.Impetus = {
		body="Bhikku Cyclas +1",
	}

	-- Impetus for the DT stance (need more PDT)
	sets.Custom.Impetus.DT = {
	    head="Malignance Chapeau",
		body="Bhikku Cyclas +1",
		right_ring="Defending Ring",
	}

	sets.Custom.Boost = {
		waist="Ask Sash",
	}

	sets.Charm = {
	    main="Ark Scythe",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Moonbow Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Etiolation Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.TreasureHunter = {
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		feet={ name="Herculean Boots", augments={'Pet: INT+3','"Subtle Blow"+4','"Treasure Hunter"+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
		waist="Chaac Belt",
	}

	organizer_items  = {		
		item1 = "Echo Drops",
		item2 = "Remedy",
		item3 = "Holy Water",
	}	
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}
	if spell.type == 'WeaponSkill' then
		if buffactive.Impetus then
			equipSet = sets.Custom.Impetus
		end	
	end
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	equipSet = choose_Impetus()
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	equipSet = choose_Impetus()

	if name == "Boost" then
		if gain == true then
			equip(sets.Custom.Boost)
			disable('waist')
		else
			enable('waist')
			choose_set()
		end
	end
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = choose_Impetus()
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	equipSet = choose_Impetus()
	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end
--Custom Function
function choose_Impetus()
	equipSet = {}
		if player.status == "Engaged" then
			if buffactive.Impetus then
				if state.OffenseMode.value == "DT" then
					equipSet = sets.Custom.Impetus.DT
				else
					equipSet = sets.Custom.Impetus
				end
			end	
		end
	return equipSet
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if player.hpp < 51 and ja_recasts[15] == 0 then
		buff = "Chakra"
	elseif not buffactive.Impetus and ja_recasts[31] == 0 then
		buff = "Impetus"
	elseif not buffactive.Footwork and ja_recasts[21] == 0 then
		buff = "Footwork"
	elseif not buffactive.Mantra and ja_recasts[19] == 0 then
		buff = "Mantra"
	elseif not buffactive.Dodge and ja_recasts[14] == 0 then
		buff = "Dodge"
	elseif not buffactive.Focus and ja_recasts[13] == 0 then
		buff = "Focus"
	end

	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end