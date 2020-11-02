
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
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

-- Goal 2100 hp and 1300 MP
function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}
	sets.Weapons.Dual_Wield = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Daybreak"
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark",
		ammo="Staunch Tathlum +1", -- 3/3
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy'}, priority=3}, -- +3 Refresh
		body="Malignance Tabard", -- 9/9
		hands="Malignance Gloves", -- 5/5
		legs="Malignance Tights", -- 7/7
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +2 Refresh
		neck="Loricate Torque +1", -- 6/6
		waist="Fucho-no-Obi", -- +1 Refresh
		left_ear={ name="Eabani Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/1
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
		-- 51% PDT, 31% MDT, 10 MP/Tic
    }
	-- Gear to swap out for Movement
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	}

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark",
		ammo="Ginsen",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Orpheus's Sash",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
	sets.OffenseMode.DT = sets.OffenseMode.TP
	sets.OffenseMode.ACC = sets.OffenseMode.TP
	sets.DualWield = {
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

	-- Used for Magic Spells
	sets.Precast = {}
	-- 50% Fast Cast is needed on RDM (Fast Cast V - 30%)
	sets.Precast.FastCast = {
		main={ name="Crocea Mors", augments={'Path: C',}}, --20
		sub="Ammurapi Shield",
		ammo={ name="Hydrocera", priority=4},
		head="Malignance Chapeau",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Embla Sash", -- 5
		left_ear={ name="Eabani Earring", priority=3},
		right_ear={ name="Etiolation Earring", priority=2}, --1
		left_ring={ name="Etana Ring", priority=1},
		right_ring="Janniston Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10
	} -- 51% total Fast Cast
	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		-- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		left_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})
	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}}
	sets.JA["Saboteur"] = {}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark",
		ammo="Hydrocera",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Nodens Gorget",
		waist="Sacro Cord",
		left_ear={ name="Tuisto Earring", priority=6},
		right_ear={ name="Etiolation Earring", priority=3},
		left_ring={ name="Lebeche Ring", priority=2},
		right_ring={ name="Janniston Ring", priority=1},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}}, -- 10
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Atrophy Gloves +3", -- 20
		legs={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}, --10
		feet="Leth. Houseaux +1", -- 30
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, --25
		waist="Embla Sash", --10
		left_ear="Mimir Earring",
		right_ear={ name="Etiolation Earring", priority=2}, -- Used to Keep HP/MP pool
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 20
		-- 150% Duration
	}
	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
	})
	-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
	})
	-- Enfeebling -- Default Duration
	sets.Midcast.Enfeebling = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+25','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Snotra Earring",
		left_ring="Kishar Ring",
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
		right_ear="Digni. Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
	})
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
		body="Lethargy Sayon +1",
	})
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
		-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Hydrocera",
		head="Befouled Crown",
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		back="Perimede Cape",
	}) -- Max Enhancing 613
	sets.Midcast["Frazzle"] = sets.Midcast.Enfeebling.MACC
	sets.Midcast["Frazzle II"] = sets.Midcast.Enfeebling.MACC
	sets.Midcast["Frazzle III"] = sets.Midcast.Enfeebling.Potency
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Atrophy Tabard +3",
		legs="Leth. Fuseau +1",
		right_ear={ name="Tuisto Earring", priority=1},
	})
	sets.Midcast["Stun"] = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+25','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Nuke = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		neck="Mizu. Kubikazari",
	})

	--Custome sets for each jobsetup
	sets.Custom = {}
	sets.Custom.Saboteur = {
	    hands="Leth. Gantherots +1",
	}

	sets.WS = {}

	sets.WS["Seraph Blade"] = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	}
	sets.WS["Sanguine Blade"] = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	}
	sets.WS["Red Lotus Blade"] = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
	    hands={ name="Merlinic Dastanas", augments={'Pet: INT+6','Phys. dmg. taken -4%','"Treasure Hunter"+2',}},
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
	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if buffactive['Saboteur'] then
		equipSet = sets.Custom.Saboteur
	end
	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if not buffactive['Composure'] and spell.name ~=  "Composure" then
		add_to_chat(8,'Composure is down')
	end
	return Weapon_Check(equipSet)
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	return Weapon_Check(equipSet)
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	return Weapon_Check(equipSet)
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	return Weapon_Check(equipSet)
end
--Function is called when a self command is issued
function self_command_custom(command)

end
-- This function is called when the job file is unloaded
function user_file_unload()
	windower.send_command('lua u Burst')
end

 function Weapon_Check(equipSet)
	if DualWield == true then
		equipSet = set_combine(equipSet, sets.Weapons.Dual_Wield)
	end
	return equipSet
 end