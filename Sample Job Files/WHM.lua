
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "11"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Club','Unlocked')
state.WeaponMode:set('Unlocked')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Balance 2100 HP / 1500 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Club'] = {
		main="Daybreak",
	}

	-- Will swap weapons based off sets below
	sets.Weapons['Unlocked'] = {
		main="Daybreak",
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1", --  3/3
		head="Nyame Helm", -- 7/7
		body="Nyame Mail", -- 9/9
		hands="Nyame Gauntlets", -- 7/7
		legs="Nyame Flanchard", -- 8/8
		feet="Nyame Sollerets", -- 7/7
		neck={ name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
		waist="Carrier's Sash",
		left_ear={ name="Etiolation Earring", priority=1}, -- 0/3
		right_ear="Hearty Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}, priority=2}, -- 10/0
    }


	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})

	-- Set to swap out when MP is low
	sets.Idle.Refresh = {
	    waist="Fucho-no-Obi",
	    feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
	}

	-- Movement Gear
	sets.Movement = {
		feet="Herald's Gaiters",
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}
	-- Base TP set
	sets.OffenseMode.TP = {}
	-- Set to use when Dual Wielding
	sets.OffenseMode.TP.DW = {}
	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = {}
	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = {}

	sets.Precast = {}
	-- Used for Magic Spells (Cap 80%)
	sets.Precast.FastCast = {
		main="C. Palug Hammer", -- 7
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}, priority=3},
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, -- 10
		body="Inyanga Jubbah +2", -- 14
		hands="Gende. Gages +1", -- 7
		legs="Pinga Pants +1", -- 13
		feet="Regal Pumps +1", -- ~4-7
		neck={ name="Clr. Torque +2", augments={'Path: A',}}, -- 10
		waist="Embla Sash", -- 5
		left_ear={ name="Etiolation Earring", priority=2}, -- 1
		right_ear="Malignance Earring", -- 4
		left_ring="Kishar Ring", -- 4
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A'}, priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	} -- 80%

	-- Cap is 10% Quick Magic - used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		ammo="Impatiens", -- 2
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=4},
		left_ring="Weather. Ring", -- 3
		right_ring="Lebeche Ring", -- 2
		waist="Witful Belt", -- 3
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {
		body={ name="Piety Bliaut +2", augments={'Enhances "Benediction" effect',}},
	}
	sets.JA["Divine Seal"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Devotion"] = {
	    head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
	}
	sets.JA["Afflatus Solace"] = {}
	sets.JA["Afflatus Misery"] = {}
	sets.JA["Sacrosanctity"] = {}
	sets.JA["Asylum"] = {}


	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Queller Rod", augments={'MND+15','Mag. Acc.+15','"Cure" potency +15%',}}, -- 15
		sub="Genmei Shield",
		ammo="Impatiens",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11
		body={ name="Ebers Bliaut +1", priority=2},
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +1",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11
		neck={ name="Clr. Torque +2", augments={'Path: A',}}, -- 10
		waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
    }
	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {body="Theo. Bliaut +3",}) -- Need to complete

	-- Enhancing Skill

	-- Used for base duration
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		sub={ name="Ammurapi Shield", priority=3},
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear={ name="Etiolation Earring", priority=1},
		right_ear="Mimir Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {
	    main="Beneficus",
		head="Ebers Cap +1",
		body="Ebers Bliaut +1",
		hands="Ebers Mitts +1",
		left_ear="Andoaa Earring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +1",
	})

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
	    hands="Inyan. Dastanas +2",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +3",
		body="Theo. Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		feet="Theo. Duckbills +3",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Haste"+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast["Cursna"] = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Hasty Pinion +1",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Ebers Bliaut +1",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
		legs="Th. Pant. +3",
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
		waist="Bishop's Sash",
		left_ear="Beatific Earring",
		right_ear="Meili Earring",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast["Erase"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	sets.Midcast["Silena"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	sets.Midcast["Poisona"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	sets.Midcast["Stona"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	sets.Midcast["Blinda"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	sets.Midcast["Viruna"] = set_combine(sets.Precast.FastCast, {
		hands="Ebers Mitts +1",
		main="Yagrush"
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +2",
		body={ name="Piety Bliaut +2", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +1",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +3",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
		neck="Nodens Gorget",
	}
	sets.Midcast.Refresh = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {}

	sets.Charm = set_combine(set.Idle, {
	})

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
	if not buffactive['Afflatus Solace'] and spell.name ~=  "Afflatus Solace" then
		add_to_chat(8,'Afflatus Solace is down')
	end
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
-- Function is called when the job lua is unloaded
function user_file_unload()

end