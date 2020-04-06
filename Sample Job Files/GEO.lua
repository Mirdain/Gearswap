
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "12"
MacroSet = "1"

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = { -- 36/39
		main="Malignance Pole", -- 20/20
		sub="Enki Strap",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Befouled Crown",
		body="Jhakri Robe +2",
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assid. Pants +1",
		feet={ name="Merlinic Crackows", augments={'Pet: Haste+1','Pet: "Mag.Atk.Bns."+29','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Loricate Torque +1", --6/6
		waist="Fucho-no-Obi",
		left_ear="Infused Earring",
		right_ear="Etiolation Earring", -- 0/3
		left_ring="Defending Ring", -- 10/10
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --5/5
    }
	sets.Idle.Pet = {
		main="Malignance Pole", --20/20
		sub="Enki Strap",
		range="Dunna",
		head={ name="Telchine Cap", augments={'Pet: Mag. Evasion+14','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		body="Jhakri Robe +2",
		hands="Geo. Mitaines +3", -- 3/0
		legs={ name="Telchine Braconi", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		feet={ name="Telchine Pigaches", augments={'Pet: Mag. Evasion+19','Pet: "Regen"+3','Pet: Damage taken -4%',}},
		neck="Loricate Torque +1", -- 6/6
		waist="Isa Belt",
		left_ear="Infused Earring",
		right_ear="Etiolation Earring", -- 0/3
		left_ring="Defending Ring", -- 10/10
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, --5/5
    }

	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {
	}
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Geo. Sandals +3",
	}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'"Fast Cast"+6','MND+6',}},
		sub="Enki Strap",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}},
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','CHR+10','Mag. Acc.+8',}},
		neck="Loricate Torque +1",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Weather. Ring",
		back="Perimede Cape",
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Collimated Fervor"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Bolster"] = {}
	sets.JA["Full Circle"] = {}
	sets.JA["Lasting Emanation"] = {}
	sets.JA["Ecliptic Attrition"] = {}
	sets.JA["Life Cycle"] = {}
	sets.JA["Blaze of Glory"] = {}
	sets.JA["Dematerialzie"] = {}
	sets.JA["Theurgic Focus"] = {}
	sets.JA["Concentric Pulse"] = {}
	sets.JA["Mending Halation"] = {}
	sets.JA["Radial Arcana"] = {}
	sets.JA["Widened Compass"] = {}
	sets.JA["Entrust"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+6','"Mag.Atk.Bns."+6','DMG:+9',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}},
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Weather. Ring",
		back="Perimede Cape",
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+6','"Mag.Atk.Bns."+6','DMG:+9',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Siegel Sash",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Kishar Ring",
		back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Geo. Galero +2",
		body="Jhakri Robe +2",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet="Geo. Sandals +3",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Gwati Earring",
		right_ear="Digni. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

	sets.Midcast.Nuke = {
		main={ name="Grioavolr", augments={'Magic burst dmg.+10%','Mag. Acc.+16','Magic Damage +2',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		left_ear="Friomisi Earring",
		right_ear="Digni. Earring",
		left_ring="Jhakri Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+8','"Mag.Atk.Bns."+10',}},
	}
	sets.Midcast.Burst = {
		main={ name="Grioavolr", augments={'Magic burst dmg.+10%','Mag. Acc.+16','Magic Damage +2',}},
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Ea Hat +1",
		body="Ea Houppelande",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
		feet="Ea Pigaches",
		neck="Mizu. Kubikazari",
		waist="Refoccilation Stone",
		left_ear="Friomisi Earring",
		right_ear="Digni. Earring",
		left_ring="Mujin Band",
		right_ring="Jhakri Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+8','"Mag.Atk.Bns."+10',}},
	}
	-- Misc Sets
	sets.Midcast.CuragaSet = sets.Midcast.Cure
	sets.Midcast.Cursna = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})

	sets.Geomancy = {}

	sets.Geomancy.Indi = {
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
		feet="Azimuth Gaiters +1",
		neck="Incanter's Torque",
		waist="Siegel Sash",
		left_ear="Mendi. Earring",
		right_ear="Gwati Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}},
	}
	sets.Geomancy.Geo = {
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
		hands="Geo. Mitaines +3",
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Gwati Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'"Fast Cast"+10',}},
	}


	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TP = {}
	sets.TP.DW = {}
	sets.TP.DT = {}
	sets.TP.ACC = {}

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
	--Command to Lock Style and Set the correct macros
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
	if T{'Idle','Resting'}:contains(new) then

	end
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