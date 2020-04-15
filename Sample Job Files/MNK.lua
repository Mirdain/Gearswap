
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "7"
MacroSet = "1"

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
		left_ear="Odnowa Earring +1",
		right_ear="Etiolation Earring",
		right_ring="Regal Ring",
		left_ring="Ilabrat Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
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
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	-- Misc Sets
	sets.Midcast.CuragaSet = sets.Midcast.Cure
	sets.Midcast.Cursna = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
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

	--Base TP set to build off
	sets.TP = {
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
	sets.TP.DT = {
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
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
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
	--Default WS set base
	sets.WS = { -- VS Base with Impetus Down
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

	sets.TreasureHunter = {
	    head="Wh. Rarab Cap +1",
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
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
				equipSet = sets.Custom.Impetus
			end	
		end
	return equipSet
end