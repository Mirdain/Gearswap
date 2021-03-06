
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "4"
MacroBook = "10"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Standard Idle set with -DT, Refresh and Regen gear
	sets.Idle = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Tartarus Platemail",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Moonbeam Cape",
    }
	sets.Movement = {
		feet="Danzo Sune-Ate"
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
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Ken. Samue +1",
		hands="Wakido Kote +3",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Tartarus Platemail",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		legs={ name="Sakonji Haidate +3", augments={'Enhances "Shikikoyo" effect',}},
		feet="Ken. Sune-Ate +1",
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Ginsen",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Wakido Kote +3",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Telos Earring",
		right_ear="Digni. Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	--Default Weapon Skill set base
	sets.WS = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Attack+29','Weapon skill damage +4%','STR+9','Accuracy+11',}},
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Karieyh Ring +1",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Sakonji Kabuto +3", augments={'Enhances "Ikishoten" effect',}},
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet={ name="Sak. Sune-Ate +3", augments={'Enhances "Meikyo Shisui" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Telos Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.Precast = {}
	-- Used for Magic Spells (Fast Cast)
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		body="Sacro Breastplate",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back="Moonbeam Cape",
	}
	sets.Precast.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	sets.Midcast = {}
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Meikyo Shisui"] = {}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Third Eye"] = {}
	sets.JA["Meditate"] = {
	    head="Wakido Kabuto +3",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.JA["Warding Circle"] = {
		head="Wakido Kabuto +3",
	}
	sets.JA["Shikikoyo"] = {
		legs={ name="Sakonji Haidate +3", augments={'Enhances "Shikikoyo" effect',}},
	}
	sets.JA["Hasso"] = {}
	sets.JA["Seigan"] = {}
	sets.JA["Sengikori"] = {}
	sets.JA["Hamanoha"] = {}
	sets.JA["Hagakure"] = {}
	sets.JA["Konzen-ittai"] = {}
	sets.JA["Yaegasumi"] = {}

	--WS Sets
	sets.WS["Tachi: Enpi"] = {}
	sets.WS["Tachi: Hobaku"] = {}
	sets.WS["Tachi: Jinpu"] = {
	    main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body="Sacro Breastplate",
		hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
		legs="Wakido Haidate +3",
		feet={ name="Founder's Greaves", augments={'VIT+8','Accuracy+13','"Mag.Atk.Bns."+14','Mag. Evasion+14',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Karieyh Ring +1",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS["Tachi: Goten"] = {}
	sets.WS["Tachi: Kagero"] = {}
	sets.WS["Tachi: Koki"] = {}
	sets.WS["Tachi: Yukikaze"] = {}
	sets.WS["Tachi: Gekko"] = {}
	sets.WS["Tachi: Kasha"] = {}
	sets.WS["Tachi: Rana"] = {}
	sets.WS["Tachi: Ageha"] = {}
	sets.WS["Tachi: Fudo"] = {}
	sets.WS["Tachi: Shoha"] = {}

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.Custom.Seigan = {
	    head="Kasuga Kabuto +1",
		body="Kasuga Domaru +1",
	}
	sets.Custom.ThirdEye = {
		legs={ name="Sakonji Haidate +3", augments={'Enhances "Shikikoyo" effect',}},
	}
	-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
	    hands={ name="Valorous Mitts", augments={'MND+8','Pet: Accuracy+15 Pet: Rng. Acc.+15','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
		head={ name="Valorous Mask", augments={'"Dbl.Atk."+1','"Occult Acumen"+8','"Treasure Hunter"+1','Accuracy+18 Attack+18',}},
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
	equipSet = choose_Seigan()
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end
--Custom Function
function choose_Seigan()
	equipSet = {}
		if player.status == "Engaged" then
			if buffactive.Seigan then
				--Equip the Seigan custom set when active
				equipSet = sets.Custom.Seigan
				if buffactive["Third Eye"] then
					--Equip the Third Eye custom set when active
					equipSet = set_combine(equipSet, sets.Custom.ThirdEye)
				end
			end
		end
	return equipSet
end
--Function used to automate Job Ability use
function check_buff_JA()
	buff = ''
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
		buff = "Hasso"
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
--Function used to automate Spell use
function check_buff_SP()
	buff = ''
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end
-- This function is called when the job file is unloaded

-- This function is called when the job file is unloaded
function user_file_unload()

end