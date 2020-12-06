
--Elendnur

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "12"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Enable JobMode for UI
UI_Name = 'Burst'

--Modes for Bursting
state.JobMode = M{['description']='Burst Mode'}
state.JobMode:options('OFF','Tier 1','Tier 2','Tier 3','Tier 4','Tier 5')
state.JobMode:set('OFF')

--loads the Burst addon
windower.send_command('lua l Burst')

-- Goal 2400 HP/1400 MP

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = { 	-- 2417/1453
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Merlinic Crackows", augments={'Pet: Haste+1','Pet: "Mag.Atk.Bns."+29','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
    }
	-- Sets for Idle when player has a pet
	sets.Idle.Pet = {
		-- 2438 / 1501
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Isa Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
    }
	--Used to swap into movement gear when the player is moving and not engaged
	sets.Movement = {
		feet="Geo. Sandals +3",
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

	-- Precast Sets
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = { 
		-- 2412/1488
		main="Idris",
		sub={ name="Ammurapi Shield", priority=7},
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}},
		hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','"Mag.Atk.Bns."+5',}},
		legs={ name="Geomancy Pants +3", priority=4},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','CHR+10','Mag. Acc.+8',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear={ name="Etiolation Earring", priority=3},
		left_ring="Weather. Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}, priority=6},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Collimated Fervor"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Bolster"] = {
	    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}}, 
	}
	sets.JA["Full Circle"] = {
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
	}
	sets.JA["Lasting Emanation"] = {}
	sets.JA["Ecliptic Attrition"] = {} 
	sets.JA["Life Cycle"] = {
		body="Geomancy Tunic +3",
	}
	sets.JA["Blaze of Glory"] = {}
	sets.JA["Dematerialzie"] = {}
	sets.JA["Theurgic Focus"] = {}
	sets.JA["Concentric Pulse"] = {}
	sets.JA["Mending Halation"] = {
	    legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
	}
	sets.JA["Radial Arcana"] = {
	    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
	}
	sets.JA["Widened Compass"] = {}
	sets.JA["Entrust"] = {}

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}
	-- Cure Set
	sets.Midcast.Cure = {
		-- 2471/1438
		main="Daybreak",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		hands="Geo. Mitaines +3",
		legs="Doyen Pants",
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist={ name="Luminary Sash", priority=4},
		left_ear={ name="Tuisto Earring", priority=5},
		right_ear={ name="Etiolation Earring", priority=3},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+6','"Mag.Atk.Bns."+6','DMG:+9',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=5},
		waist="Embla Sash",
		left_ear={ name="Tuisto Earring", priority=4},
		right_ear={ name="Etiolation Earring", priority=2},
		left_ring={ name="Etana Ring", priority=3},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Idris",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet="Geo. Sandals +3",
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Weather. Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Phys. dmg. taken-10%',}},
	}
	-- Free Nuke
	sets.Midcast.Nuke = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck="Sanctity Necklace",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Shiva Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	-- Used for Burst Mode
	sets.Midcast.Burst = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ea Hat +1",
		body="Ea Houppe. +1",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs="Ea Slops +1",
		feet="Ea Pigaches +1",
		neck="Mizu. Kubikazari",
		waist="Sacro Cord",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Mujin Band",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	-- CuragaSet
	sets.Midcast.CuragaSet = sets.Midcast.Cure
	-- Cursna Set
	sets.Midcast.Cursna = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
	-- Aquaveil Set
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	    main="Vadose Rod",
		head="Amalric Coif +1"
	})
	-- Stun Set
	sets.Midcast["Stun"] = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}},
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','CHR+10','Mag. Acc.+8',}},
		neck="Erra Pendant",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Weather. Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	sets.Midcast["Erase"] = sets.Precast.FastCast

	-- Refresh Set
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})
	-- Aspir Set
	sets.Midcast.Aspir = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Merlinic Jubbah", augments={'"Drain" and "Aspir" potency +11','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
		hands="Geo. Mitaines +3",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +10','CHR+10','"Mag.Atk.Bns."+4',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Drain" and "Aspir" potency +9','MND+10','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Evanescence Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	-- Drain Set
	sets.Midcast.Drain = {
		main="Idris",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Merlinic Jubbah", augments={'"Drain" and "Aspir" potency +11','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
		hands="Geo. Mitaines +3",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +10','CHR+10','"Mag.Atk.Bns."+4',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Drain" and "Aspir" potency +9','MND+10','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Evanescence Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	sets.Geomancy = {}
	-- Indi Duration
	sets.Geomancy.Indi = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}}, -- 21
		feet="Azimuth Gaiters +1", -- 20
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Tuisto Earring", priority=3},
		right_ear={ name="Etiolation Earring", priority=2},
		left_ring="Stikini Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}
	sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}, -- 15
	})
	-- Geo Potency
	sets.Geomancy.Geo = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}
	--Custome sets for each jobsetup
	sets.Custom = {}
	-- Maintain Luopon HP
	sets.Custom.Luopon = {

		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
	}

	-- Base WS set
	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Set to equip when charmed
	sets.Charm = {
		main="Lament",
		sub="Enki Strap",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Befouled Crown",
		body="Jhakri Robe +2",
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assid. Pants +1",
		feet={ name="Merlinic Crackows", augments={'Pet: Haste+1','Pet: "Mag.Atk.Bns."+29','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Infused Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
	    -- head="Wh. Rarab Cap +1",
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

function pet_change_custom(pet,gain)
	equipSet = {}

	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()
	windower.send_command('lua u Burst')
end