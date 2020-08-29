
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "12"
MacroSet = "1"

jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	-- Standard Idle set
	-- 50/31
	sets.Idle = { 
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
    }
	-- This gear will be equiped when the player is moving and not engaged
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }
	-- Set used for hate generation on Job abilities
	sets.Enmity = {
		main="Epeolatry", -- 23
		sub="Utu Grip",
		ammo="Sapience Orb", --2
		head="Turms Cap +1",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands={ name="Futhark Mitons +3", augments={'Enhances "Sleight of Sword" effect',}}, -- 6
		legs="Eri. Leg Guards +1", -- 11
		feet="Erilaz Greaves +1", -- 6
		neck="Moonlight Necklace", -- 15
		waist="Eschan Stone",
		left_ear="Tuisto Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Petrov Ring", -- 4
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10
	}
	--Base TP set to build off - Used in [Normal] mode
	sets.TP = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--This set Augments the TP base set for Damage Reduction - Used in [DT] mode 
	sets.TP.DT = {
	    main="Epeolatry",
		sub="Utu Grip",
		ammo="Yamarang",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--This set Augments the TP base set for max Accuracy - Used in [ACC] mode 
	sets.TP.ACC = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Yamarang",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.Precast = {}
	-- Used for Magic Spells
	--52% FC
	sets.Precast.FastCast = {
		ammo="Sapience Orb", --2
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}}, --12
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}}, --9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+23','"Fast Cast"+6','VIT+4','"Mag.Atk.Bns."+1',}}, --6
		neck="Voltsurge Torque", --4
		waist="Eschan Stone",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring", --1
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, --10
	}
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	-- 92 With Merits - Need Regal
	sets.Midcast.SIRD = {
	    ammo="Staunch Tathlum +1", --11
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, -- 20
		waist="Rumination Sash", -- 10
		neck="Moonlight Necklace", -- 15
		left_ear="Magnetic Earring", -- 8
		right_ear="Halasz Earring", -- 5
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.Midcast["Aquaveil"] = sets.Midcast.SIRD
	sets.Midcast["Phalanx"] = {
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}}, --7
		body={ name="Taeon Tabard", augments={'Phalanx +3',}}, --3
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}}, --3
		legs={ name="Taeon Tights", augments={'Phalanx +3',}}, --3
		feet={ name="Taeon Boots", augments={'Phalanx +2',}}, --2
	}
	-- JOB ABILITIES --
	sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["Gambit"] = set_combine(sets.Enmity, { hands="Runeist's Mitons +1" })
    sets.JA["Rayke"] = set_combine(sets.Enmity, { feet="Futhark Boots +3" })
    sets.JA["Liement"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, { feet="Runeist Bottes +1" })
    sets.JA["Battuta"] = set_combine(sets.Enmity, { head="Futhark Bandeau +3" })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, { head="Erilaz Galea +1" })
    sets.JA["Embolden"] = { back="Evasionist's Cape" }
    sets.JA["Swordplay"] = set_combine(sets.Enmity, { hands="Futhark Mitons +3" })
	sets.JA["Provoke"] = sets.Enmity

	--This set is used when sub job is NIN/THF/DNC and Enaged (Augments the TP base set)
	--Leave blank if you dont want to change gear or equip a grip or shield
	sets.TP.DW = {

	}
	--Default WS set base
	sets.WS = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {

	}
	sets.WS.CRIT = {

	}
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
	sets.WS["Dimidiation"] = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
	--Custome sets for each jobsetup
	sets.Custom = {}

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
-- This function is called when the job file is unloaded
function user_file_unload()

end