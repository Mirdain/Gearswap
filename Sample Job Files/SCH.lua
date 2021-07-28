
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "3"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for Bursting
state.JobMode = M{['description']='Lists SCH Skillchains'}
state.JobMode:options('OFF','ON')
state.JobMode:set('OFF')

--Enable JobMode for UI
UI_Name = 'Skillchain'

-- HP Goal: 2000
-- MP Goal: 1400

function get_sets()
	-- Standard idle set
	sets.Idle = { -- HP:2151 MP:1493
		main={ name="Musa", augments={'Path: C',}},
		sub="Enki Strap",
		ammo="Staunch Tathlum +1", -- 3/3
		head="Nyame Helm", -- 7/7
		body="Agwu's Robe", -- +3 Refresh
		hands="Nyame Gauntlets", -- 7/7
		legs="Nyame Flanchard", -- 8/8
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- 2/0 +2
		neck="Loricate Torque +1", -- 6/6
		waist="Carrier's Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Etiolation Earring", -- 0/3
		left_ring={name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
    }	-- 34 MDT and 43 PDT with 5 Refresh

	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	-- Set to swap into when player is moving
	sets.Movement = {
		feet="Herald's Gaiters"
	}

	-- Sets are used for when player is engaged
	sets.OffenseMode = {}
	-- Base TP set
	sets.OffenseMode.TP = {}
	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = {}
	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = {}
	-- Set to use when Dual Wielding
	sets.DualWield = {}

	-- Set to use when casting spells (sent with Mid-Cast packet - only concern is HP/MP and Fastcast)
	sets.Precast = {}

	sets.Precast.FastCast = { -- HP:2101 MP:1442
		-- 6 from staff (Goes up to 10)
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+14','Attack+22','"Fast Cast"+6','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}, -- 14
		body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6',}}, -- 12
		hands="Agwu's Gages", -- 6
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 7
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+29','"Fast Cast"+6','DEX+7','Mag. Acc.+14',}}, -- 11
		neck={ name= "Sanctity Necklace", priority=2},
		waist="Embla Sash", -- 5
		left_ear={ name="Tuisto Earring", priority=3},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring="Weather. Ring", -- 5
		right_ring="Kishar Ring", -- 4
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 81 Fastcast with R17 weapon

	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, { -- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		left_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Light Arts"] = {}
	sets.JA["Dark Arts"] = {}
	sets.JA["Sublimation"] = {}
	sets.JA["Tabula Rasa"] = {}
	sets.JA["Modus Veritas"] = {}
	sets.JA["Libra"] = {}
	sets.JA["Caper Emissarius"] = {}
	sets.JA["Convert"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}

	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Hasty Pinion +1", --2% Haste
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 6% Haste 11/2
		body={ name="Nyame Mail", priority=3}, -- 3% Haste
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}}, -- 3% Haste 11/2 (Upgrade hands)
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 5% Haste 11/2
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 3% Haste 11/2
		neck="Incanter's Torque",
		waist="Witful Belt", -- 3% Haste
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }	-- 25% Haste 50% Cure Potency and 8% Cure Potency II















	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Evasion+19','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head={ name="Chironic Hat", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Resist Silence"+1','Mag. Acc.+13','"Mag.Atk.Bns."+4',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+25','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	}

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {

	})

	-- Spells that require SKILL
	sets.Midcast.Enhancing.Skill = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

	-- Enhancing Skill
	sets.Midcast.Cursna = {}

	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
		head="Arbatel Bonnet +1",
		hands="Arbatel Bracers +1",
	})

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Perpetuance = {
		hands="Arbatel Bracers +1",
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
		neck="Nodens Gorget",
		left_ear="Earthcry Earring",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
	})

	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Jhakri Robe +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Burst = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Agwu's Robe",
		hands="Agwu's Gages",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Mujin Band",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	}

		sets.Midcast["Stun"] = {}

	sets.Charm = {
	    main="Lament",
	}

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.MAB = {}

	-- Set used to tag treasure hunger
	sets.TreasureHunter = {
	    hands={ name="Merlinic Dastanas", augments={'Pet: INT+6','Phys. dmg. taken -4%','"Treasure Hunter"+2',}},
		legs={ name="Chironic Hose", augments={'Pet: Accuracy+4 Pet: Rng. Acc.+4','Magic Damage +15','"Treasure Hunter"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
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
	--windower.send_command('lua u Burst')
end