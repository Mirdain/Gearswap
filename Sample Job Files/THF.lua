
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "5"
MacroBook = "6"
MacroSet = "1"

function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Malignance Tabard",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Malignance Tights",
		feet="Fajin Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}},
		back="Moonbeam Cape",
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {

    }
	sets.Movement = {

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
		waist="Tempus Fugit",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Moonlight Ring",
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
	sets.JA = {}
	sets.JA["Perfect Dodge"] = {hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}}
	sets.JA["Steal"] = {}
	sets.JA["Flee"] = {}
	sets.JA["Hide"] = {}
	sets.JA["Sneak Attack"] = {}
	sets.JA["Mug"] = {}
	sets.JA["Trick Attack"] = {}
	sets.JA["Accomplice"] = {}
	sets.JA["Feint"] = {}
	sets.JA["Despoil"] = {}
	sets.JA["Collaborator"] = {}
	sets.JA["Conspirator"] = {}
	sets.JA["Bully"] = {}
	sets.JA["Larceny"] = {}

	--Base TP set to build off
	sets.TP = {
	    ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Erudit. Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Phalangite Mantle",
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
		body="Malignance Tabard",
		legs="Malignance Tights",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {}
	sets.TP.DW = {

	}
	--Default WS set base
	sets.WS = {
		ammo="Yetshila +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring",
		right_ring="Epaminondas's Ring",
		back="Phalangite Mantle",
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--WS Sets
	sets.WS["Wasp Sting"] = {}
	sets.WS["Viper Bite"] = {}
	sets.WS["Shadowstich"] = {}
	sets.WS["Gust Slash"] = {}
	sets.WS["Cyclone"] = {}
	sets.WS["Energy Steal"] = {}
	sets.WS["Energy Drain"] = {}
	sets.WS["Dancing Edge"] = {}
	sets.WS["Shark Bite"] = {}
	sets.WS["Evisceration"] = {}
	sets.WS["Aeolian Edge"] = {}

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
	    head="Wh. Rarab Cap +1",
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},
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