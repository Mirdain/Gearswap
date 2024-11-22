
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
state.WeaponMode:options('Seraph Strike','Black Halo','Asclepius','Unlocked')
state.WeaponMode:set('Unlocked')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Balance 2100 HP / 1500 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Seraph Strike'] = {
		main="Daybreak",
	}

	sets.Weapons['Black Halo'] = {
		main="Maxentius",
	}

	sets.Weapons['Asclepius'] = {
		main="Asclepius",
	}

	-- Will swap weapons based off sets below
	sets.Weapons['Unlocked'] = {
		
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	sets.Weapons.Sleep ={
		main="Lorg Mor",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Daybreak",
		ammo="Staunch Tathlum +1", --  3/3
		head="Bunzi's Hat", -- 7/7
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3", -- 11/11
		legs="Ebers Pant. +3", -- 12/12
		feet="Ebers Duckbills +3", -- 11/11
		neck={ name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
		waist="Carrier's Sash",
		left_ear="Hearty Earring",
		right_ear="Ebers Earring +1", -- 5/5
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}, priority=1}, -- 5/5
    }

	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})

	-- Set to swap out when MP is low
	sets.Idle.Refresh = {
	    feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
	}

	sets.Idle.DT = {}

	-- Movement Gear
	sets.Movement = {
		feet="Herald's Gaiters",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
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
		ammo="Hasty Pinion +1",
		head="Ebers Cap +3", -- 13
		body="Inyanga Jubbah +2", -- 14
		hands="Gende. Gages +1", -- 7
		legs="Pinga Pants +1", -- 13
		feet="Volte Gaiters", -- 6
		neck={ name="Clr. Torque +2", augments={'Path: A',}}, -- 10
		waist="Embla Sash", -- 5
		left_ear={ name="Etiolation Earring", priority=2}, -- 1
		right_ear="Malignance Earring", -- 4
		left_ring="Kishar Ring", -- 4
		right_ring="Weather. Ring", -- 5
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	} -- 81%

	-- Cap is 10% Quick Magic - used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		ammo="Impatiens", -- 2
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
		main="Asclepius",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Ebers Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		legs="Ebers Pant. +3",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Hachirin-no-Obi",
		left_ear="Mendi. Earring",
		right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
		left_ring="Defending Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
    }
	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {body="Theo. Bliaut +3",})

	-- For Cura - foucs on DT
	sets.Midcast.Cura = set_combine(sets.Midcast.Cure, {body="Theo. Bliaut +3",})

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
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	}
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
	
	});

	--'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzara','Baraera','Barstonra','Barthundra','Barwatera'
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {
	    main="Beneficus",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		left_ear="Andoaa Earring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +3",
	})

	--'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra','Barsilencera','Barsleep','Barpoison','Barparalyze','Barblind','Barvirus','Barpetrify','Baramnesia','Barsilence'
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {
	    main="Beneficus",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		left_ear="Andoaa Earring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +3",
	})

	--'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Enblizzard','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
	    hands="Inyan. Dastanas +2",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Theophany Cap +3",
		body="Theo. Bliaut +3",
		hands="Ebers Mitts +3",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		feet="Theo. Duckbills +3",
		neck="Erra Pendant",
		waist={ name="Obstin. Sash", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Damage taken-5%',}},
	}

	sets.Midcast["Cursna"] = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Ebers Bliaut +3",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
		legs="Th. Pant. +3",
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
		waist="Bishop's Sash",
		left_ear="Meili Earring",
		right_ear="Ebers Earring +1",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	}

	sets.Midcast["Erase"] = set_combine(sets.Midcast, {
		main="Yagrush",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
	})

	sets.Midcast["Esuna"] = set_combine(sets.Midcast, {
		main="Asclepius",
	})

	sets.Midcast["Silena"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Poisona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Stona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Blindna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Viruna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Auspice"] = set_combine(sets.Midcast, {
		feet="Ebers Duckbills +3",
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +2",
		body={ name="Piety Bliaut +2", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +3",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +3",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Damage taken-5%',}},
	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		left_ear="Earthcry Earring",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	}

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		hands="Regal Cuffs",
		head="Amalric Coif +1"
	})

	sets.Midcast.Refresh = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {
	    ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Cornelia's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}


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
	if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
		add_to_chat(8,'You are not in a stance')
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

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	buff = 'None'
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	return buff
end