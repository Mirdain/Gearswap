
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "19"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Weapon Modes
state.WeaponMode:options('Musa','Unlocked')
state.WeaponMode:set('Unlocked')

-- Set to true to run organizer on job changes
Organizer = false

elemental_ws = S{'Aeolian Edge'}

-- HP Goal: 2200
-- MP Goal: 1400

function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Musa'] ={
		main={ name="Musa", augments={'Path: C',}},
		sub="Enki Strap",
	}

	sets.Weapons['Unlocked'] ={
		main={ name="Musa", augments={'Path: C',}},
		sub="Enki Strap",
	}

	-- Standard idle set
	sets.Idle = { -- HP:2151 MP:1493
		ammo="Staunch Tathlum +1", -- 3/3
		head={ name="Nyame Helm", priority=1}, -- 7/7
		body="Agwu's Robe", -- +3 Refresh
		hands={ name="Nyame Gauntlets", priority=2}, -- 7/7
		legs={ name="Nyame Flanchard", priority=3}, -- 8/8
		feet="Nyame Sollerets", -- 7/7
		neck="Loricate Torque +1", -- 6/6
		waist="Carrier's Sash",
		left_ear="Lugalbanda Earring",
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/3
		left_ring="Defending Ring", -- 10/10
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
    }	-- 44 MDT and 51 PDT (With sublimation active)

	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		head="Acad. Mortar. +3", -- +4 Submlimation when active
	    waist="Embla Sash", -- +3 Submlimation when active
	})

	-- Set to swap into when player is moving
	sets.Movement = {
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		feet="Herald's Gaiters"
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
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

	sets.Precast.FastCast = {
		-- 10 from staff
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+14','Attack+22','"Fast Cast"+6','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}, -- 14
		body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6',}}, -- 12
		hands="Acad. Bracers +3", -- 9
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 7
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+29','"Fast Cast"+6','DEX+7','Mag. Acc.+14',}}, -- 11
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist="Embla Sash", -- 5
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring="Weather. Ring", -- 5
		right_ring="Kishar Ring", -- 4
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 80+ Fastcast

	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, { -- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		right_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Light Arts"] = {}
	sets.JA["Dark Arts"] = {}
	sets.JA["Sublimation"] = {}
	sets.JA["Tabula Rasa"] = {legs={ name="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}}}
	sets.JA["Modus Veritas"] = {}
	sets.JA["Libra"] = {}
	sets.JA["Caper Emissarius"] = {}
	sets.JA["Convert"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	-- Cure Set
	sets.Midcast.Cure = {
		-- Staff 20% Cure Potency
		ammo="Hasty Pinion +1", --2% Haste
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 6% Haste 11/2
		body={ name="Nyame Mail", priority=3}, -- 3% Haste
		hands={ name="Peda. Bracers +3", augments={'Enh. "Tranquility" and "Equanimity"',}}, -- 3% Haste 0/3
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 5% Haste 11/2
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 3% Haste 11/2
		neck="Incanter's Torque",
		waist="Witful Belt", -- 3% Haste
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }	-- 25% Haste 50%+ Cure Potency and 9% Cure Potency II

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
		hands={ name="Telchine Gloves", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Evasion+19','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +3",
		body="Acad. Gown +3",
		hands="Acad. Bracers +3",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		feet="Acad. Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {

	})
	 -- Used for Vagary (6k+ nuke no kill)
	sets.Midcast.Vagary = {
	    main="Earth Staff",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+14','Attack+22','"Fast Cast"+6','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}, -- 14
		body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6',}}, -- 12
		hands="Acad. Bracers +3", -- 9
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 7
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+29','"Fast Cast"+6','DEX+7','Mag. Acc.+14',}}, -- 11
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist="Embla Sash", -- 5
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring="Weather. Ring", -- 5
		right_ring="Kishar Ring", -- 4
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	}

	-- Spells that require SKILL
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {})

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

	-- Enhancing Skill
	sets.Midcast.Cursna = {}

	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
		body={ name="Telchine Chas.", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		head="Arbatel Bonnet +1",
	})

	sets.Perpetuance = {
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

	sets.Midcast["Klimaform"] = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast["Impact"] = set_combine(sets.Midcast.Enfeebling, {
		body="Twilight Cloak",	
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
	})

	sets.Midcast.Nuke = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
		body="Acad. Gown +3",
		hands={ name="Agwu's Gages", augments={'Path: A',}},
		legs="Agwu's Slops",
		feet="Agwu's Pigaches",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		left_ring="Mujin Band",
	})

	sets.Midcast.Helix = set_combine(sets.Midcast.Nuke, {

	})


	sets.Midcast["Stun"] = set_combine(sets.Midcast.Enfeebling.MACC, {
	
	})

	sets.Charm = set_combine(sets.Idle, {

	})

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.MAB = {}

	-- Set used to tag treasure hunger
	sets.TreasureHunter = {
	    hands={ name="Merlinic Dastanas", augments={'Pet: INT+6','Phys. dmg. taken -4%','"Treasure Hunter"+2',}},
		waist="Chaac Belt",
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
	if buffactive["Perpetuance"] then
		equipSet = set_combine(equipSet, sets.Perpetuance)
	end
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