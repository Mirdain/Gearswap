
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
state.JobMode = M{['description']='Burst Mode'}
state.JobMode:options('OFF','Tier 1','Tier 2','Tier 3','Tier 4','Tier 5')
state.JobMode:set('OFF')

--Enable JobMode for UI
UI_Name = 'Burst'

--loads the Burst Plugin
windower.send_command('lua l Burst')

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Malignance Pole", -- 20/20
		sub="Enki Strap",
		ammo="Staunch Tathlum +1", -- 3/3
		head="Befouled Crown", -- 0/0 +1
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, -- 0/0 +3
		hands={ name="Chironic Gloves", augments={'STR+9','Pet: INT+4','"Refresh"+1','Accuracy+20 Attack+20',}},
		legs="Assid. Pants +1", -- 0/0 +2
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- 2/0 +2
		neck="Loricate Torque +1", -- 6/6
		waist="Fucho-no-Obi", -- 0/0 +1
		left_ear="Eabani Earring",
		right_ear="Etiolation Earring", -- 0/3
		left_ring="Defending Ring", -- 10/10
		right_ring="Stikini Ring +1", -- 0/0 +1
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
    }
	-- Set PDF = 51 MDT = 39 Refresh = 10
	sets.Movement = {
		feet="Herald's Gaiters",
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'"Fast Cast"+7','INT+5','Mag. Acc.+2','Magic Damage +5',}},
		sub="Enki Strap",
		ammo="Hydrocera",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+14','Attack+22','"Fast Cast"+6','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6',}},
		hands="Gende. Gages +1",
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+29','"Fast Cast"+6','DEX+7','Mag. Acc.+14',}},
		neck="Voltsurge Torque",
		waist="Luminary Sash",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring="Etana Ring",
		right_ring="Kishar Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Sublimation"] = {}
	sets.JA["Tabula Rasa"] = {}
	sets.JA["Modus Veritas"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Caper Emissarius"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	-- Cure Set
	sets.Midcast.Cure = {
		main="Chatoyant Staff",
		sub="Enki Strap",
		ammo="Hydrocera",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Loricate Torque +1",
		waist="Witful Belt",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Janniston Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+5','Mag. Acc.+3','"Mag.Atk.Bns."+20',}},
		sub="Ammurapi Shield",
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
		main={ name="Grioavolr", augments={'Mag. Acc.+27','Mag. Acc.+23 "Mag.Atk.Bns."+23','Pet: "Regen"+1',}},
		sub="Enki Strap",
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
	-- Spells that require SKILL
	sets.Midcast.Enhancing.Skill = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}
	-- Enhancing Skill
	sets.Midcast.Cursna = {}

	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
	    main="Bolelabunga",
		head="Arbatel Bonnet +1",
		hands="Arbatel Bracers +1",
	})

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {

	})


	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"},
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +1",
		waist="Gishdubar Sash",
	    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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

	sets.Charm = {
	    main="Lament",
	}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.OffenseMode = {}
	sets.OffenseMode.TP = {}
	sets.OffenseMode.TP.DW = {}
	sets.OffenseMode.DT = {}
	sets.OffenseMode.ACC = {}

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
	    head="Wh. Rarab Cap +1",
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
	windower.send_command('lua u Burst')
end