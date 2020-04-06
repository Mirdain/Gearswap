
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "5"
MacroSet = "1"

function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {

    }
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Aettir", augments={'Accuracy+70','Mag. Evasion+50','Weapon skill damage +10%',}},
		sub="Utu Grip",
		ammo="Sapience Orb", --2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+4',}}, --8
		hands="Turms Mittens +1", 
		legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}}, --5
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}, --8
		neck="Voltsurge Torque", --4
		waist="Tempus Fugit",
		left_ear="Enchntr. Earring +1", --2
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weather. Ring", --5
		back={ name="Ogma's cape", augments={'"Fast Cast"+10','Spell interruption rate down-10%',}}, --10
	}
	sets.Precast.Enmity = {
	    ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Runeist Bottes +1",
		neck="Moonlight Necklace",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	    ammo="Staunch Tathlum +1", --11
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
		legs={ name="Founder's Hose", augments={'MND+7','Mag. Acc.+10','Attack+10',}}, --30
		feet={ name="Odyssean Greaves", augments={'Attack+1','"Fast Cast"+6',}},
		waist="Rumination Sash", --10
		neck="Moonlight Necklace", --15
		left_ear="Magnetic Earring", --8
	}
	-- Cure Set
	sets.Midcast.Cure = {

	}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.Midcast["Phalanx"] = {
		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}}, --7
		body={ name="Taeon Tabard", augments={'Phalanx +3',}}, --3
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}}, --3
		legs={ name="Taeon Tights", augments={'Phalanx +3',}}, --3
		feet={ name="Taeon Boots", augments={'Phalanx +2',}}, --2
		neck="Moonlight Necklace",
		waist="Siegel Sash",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'"Fast Cast"+10','Spell interruption rate down-10%',}},
	}
	sets.JA = {}
	sets.JA["Invincible"] = {}


	--Base TP set to build off
	sets.TP = {
		sub="Utu Grip",
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Sanctity Necklace",
		waist="Flume Belt +1",
		left_ear="Sherida Earring",
		right_ear="Digni. Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonbeam Cape",

	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {

	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {

	}
	--This set is used when sub job is NIN/THF/DNC and Enaged (Augments the TP base set)
	--Leave blank if you dont want to change gear or equip a grip or shield
	sets.TP.DW = {

	}
	--Default WS set base
	sets.WS = {

	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {

	}
	sets.WS.CRIT = {

	}
	--Axe WS
	sets.WS["Ragin Axe"] = {}
	sets.WS["Smash Axe"] = {}
	sets.WS["Gale Axe"] = {}
	sets.WS["Avalanche Axe"] = {}
	sets.WS["Spinning Axe"] = {}
	sets.WS["Rampage"] = {}
	sets.WS["Calamity"] = {}
	sets.WS["Mistral Axe"] = {}
	sets.WS["Decimation"] = sets.WS.CRIT
	sets.WS["Bora Axe"] = {}
	sets.WS["Cloudsplitter"] = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Great Sword WS

	sets.WS["Hard Slash"] = {}
	sets.WS["Frostbite"] = {}
	sets.WS["Freezebite"] = {}
	sets.WS["Shockwave"] = {}
	sets.WS["Crescent Moon"] = {}
	sets.WS["Sickle Moon"] = {}
	sets.WS["Spinning Slash"] = {}
	sets.WS["Herculean Slash"] = {}
	sets.WS["Resolution"] = {
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back="Phalangite Mantle",
	}

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {

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

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end