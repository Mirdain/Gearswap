
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "4"
MacroBook = "10"
MacroSet = "1"

function get_sets()

	-- Standard Idle set with -DT, Refresh and Regen gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}},
		back="Moonbeam Cape",
    }
	sets.Movement = {
		feet="Danzo Sune-Ate"
    }
	sets.Precast = {}
	-- Used for Magic Spells (Fast Cast)
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Founder's Hose", augments={'MND+7','Mag. Acc.+10','Attack+10',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
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
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
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
	    head="Wakido Kabuto +1",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
	    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	sets.JA["Warding Circle"] = {
		head="Wakido Kabuto +1",
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

	--Base TP set to build off
	sets.TP = {
	    ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Ken. Samue +1",
		hands="Wakido Kote +3",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Sam. Nodowa +2",
		waist="Ioskeha Belt +1",
		left_ear="Digni. Earring",
		right_ear="Cessance Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
	    ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		legs={ name="Sakonji Haidate +3", augments={'Enhances "Shikikoyo" effect',}},
		feet="Ken. Sune-Ate +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}},
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	}
	sets.TP.DW = {}
	--Default Weapon Skill set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Attack+29','Weapon skill damage +4%','STR+9','Accuracy+11',}},
		neck="Sam. Nodowa +2",
		waist="Fotia Belt",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Attack+29','Weapon skill damage +4%','STR+9','Accuracy+11',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Epaminondas's Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--WS Sets
	sets.WS["Tachi: Enpi"] = {}
	sets.WS["Tachi: Hobaku"] = {}
	sets.WS["Tachi: Jinpu"] = {}
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
	jobsetup (LockStylePallet,MacroBook,MacroSet)
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

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