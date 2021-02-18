
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "11"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Balance 2000 HP / 1500 MP

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Pinga Pants +1",
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear={ name="Etiolation Earring", priority=2},
		right_ear={ name="Eabani Earring", priority=1},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=3},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
    }
	-- Movement Gear
	sets.Movement = {
		feet="Herald's Gaiters"
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    left_ring="Saida Ring",
		right_ring="Saida Ring",
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
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main="C. Palug Hammer",
		sub="Ammurapi Shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands="Gende. Gages +1",
		legs="Pinga Pants +1",
		feet="Regal Pumps +1",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear={ name="Tuisto Earring", priority=3},
		left_ring={ name="Lebeche Ring", priority=2},
		right_ring={ name="Etana Ring", priority=1},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {
	    body={ name="Piety Briault +2", augments={'Enhances "Benediction" effect',}},
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

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Queller Rod", augments={'MND+15','Mag. Acc.+15','"Cure" potency +15%',}},
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body={ name="Ebers Bliaud +1", priority=3},
		hands={ name="Theophany Mitts +3", priority=5},
		legs="Ebers Pant. +1",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist={ name="Luminary Sash", priority=4},
		right_ear={ name="Tuisto Earring", priority=4},
		left_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Lebeche Ring", priority=2},
		right_ring='Defending Ring',
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
    }
	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {body="Theo. Bliaud +3"}) -- Need to complete

	-- Enhancing Skill

	-- Used for base duration
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear={ name="Etiolation Earring", priority=1},
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Ebers Cap +1",
		body="Ebers Bliaud +1",
		hands="Ebers Mitts +1",
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +1",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Tuisto Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Skill = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear={ name="Etiolation Earring", priority=3},	
		right_ear="Mimir Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		right_ring={ name="Etana Ring", priority=2},
		back="Perimede Cape", -- UNM Cape
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Grioavolr", augments={'Mag. Acc.+27','Mag. Acc.+23 "Mag.Atk.Bns."+23','Pet: "Regen"+1',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Chironic Hat", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Resist Silence"+1','Mag. Acc.+13','"Mag.Atk.Bns."+4',}},
		body="Inyanga Jubbah +2",
		hands="Theophany Mitts +3",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +3",
		neck="Sanctity Necklace",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Haste+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast["Cursna"] = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Hasty Pinion +1",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Ebers Bliaud +1",
		hands={ name="Fanatic Gloves", augments={'MP+25','Healing magic skill +7','"Fast Cast"+3',}},
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
		main="Yagrush"
	})

	sets.Midcast["Poisona"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	sets.Midcast["Stona"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	sets.Midcast["Blinda"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	sets.Midcast["Viruna"] = set_combine(sets.Precast.FastCast, {
		main="Yagrush"
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +2",
		body={ name="Piety Briault +2", augments={'Enhances "Benediction" effect',}},
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

	sets.Charm = {
	    main="Lament",
		sub="Enki Strap",
		ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Haste+10','Phys. dmg. taken-10%',}},
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