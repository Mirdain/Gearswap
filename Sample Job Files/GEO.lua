
--Elendnur

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "12"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

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
state.WeaponMode:options('Idris','Unlocked')
state.WeaponMode:set('Unlocked')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Goal 2400 HP/1400 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Idris'] = {
		main="Idris",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	}

	-- This is the idle when "Unlocked"
	-- When in the "Unlocked" mode the "main" and "sub" from the gearsets below are used
	sets.Weapons['Unlocked'] = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		head="Nyame Helm",
		body="Geomancy Tunic +3",
		hands="Nyame Gauntlets",
		legs={ name="Merlinic Shalwar", augments={'Pet: Haste+1','Pet: VIT+5','"Refresh"+2','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Merlinic Crackows", augments={'Pet: Haste+1','Pet: "Mag.Atk.Bns."+29','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
    }

	-- Sets for Idle when player has a pet
	sets.Idle.Pet = set_combine(sets.Idle, {
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		hands="Geo. Mitaines +3",
		legs="Nyame Flanchard",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    })

	--Used to swap into movement gear when the player is moving and not engaged
	sets.Movement = {
		feet="Geo. Sandals +3",
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
	sets.OffenseMode.TP = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands={ name="Gazu Bracelet +1", augments={'Path: A',}},
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring="Hetairoi Ring",
		right_ring="Petrov Ring",
		back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

	-- Set to use when Dual Wielding
	sets.OffenseMode.TP.DW = {}

	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = set_combine( sets.OffenseMode.TP, {
	
	})

	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = {}

	-- Precast Sets
	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = { 
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}}, --14
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}}, --13
		hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','"Mag.Atk.Bns."+5',}}, --7
		legs={ name="Geomancy Pants +3", priority=4}, --15
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','CHR+10','Mag. Acc.+8',}}, --12
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist="Embla Sash",  --5
		left_ear="Malignance Earring", --4
		right_ear={ name="Etiolation Earring", priority=3}, --1
		left_ring="Etana Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}, priority=6}, --10
	}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main="Daybreak",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --17
		body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, -- 7
		legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --7
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --12
		waist="Luminary Sash",
		right_ear="Mendi. Earring", --5
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=5},
		waist="Embla Sash",
		right_ear={ name="Etiolation Earring", priority=2},
		left_ring={ name="Etana Ring", priority=3},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		sub="Ammurapi Shield",
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet="Geo. Sandals +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Phys. dmg. taken-10%',}},
	}

	-- Free Nuke
	sets.Midcast.Nuke = {
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Ea Houppe. +1",
		hands="Agwu's Gages",
		legs="Ea Slops +1",
		feet={ name="Agwu's Pigaches", augments={'Path: A',}},
		neck="Sanctity Necklace",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	-- Used for Burst Mode
	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		neck="Mizu. Kubikazari",
		right_ring="Mujin Band",
	})

	-- CuragaSet
	sets.Midcast.CuragaSet = sets.Midcast.Cure

	-- Cursna Set
	sets.Midcast.Cursna = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

	-- Aquaveil Set
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	    main="Vadose Rod",
		head="Amalric Coif +1"
	})

	-- Refresh Set
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})

	-- Aspir Set
	sets.Midcast.Aspir = {
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Merlinic Jubbah", augments={'"Drain" and "Aspir" potency +11','Mag. Acc.+6','"Mag.Atk.Bns."+4',}},
		hands="Geo. Mitaines +3",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +10','CHR+10','"Mag.Atk.Bns."+4',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Drain" and "Aspir" potency +9','MND+10','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	-- Drain Set
	sets.Midcast.Drain = set_combine(sets.Midcast.Aspir, {

	})

	sets.Geomancy = {}

	-- Indi Duration
	sets.Geomancy.Indi = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}}, -- 21
		feet="Azimuth Gaiters +1", -- 20
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {
		main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}, -- 15
	})

	-- Geo Potency
	sets.Geomancy.Geo = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	-- Maintain Luopan HP with the Relic to give it +600 HP
	sets.Luopan = {
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
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

	-- Base WS set
	sets.WS = {
	    head="Nyame Helm",
		body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Rufescent Ring",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Set to equip when charmed
	sets.Charm = set_combine(sets.Idle, {

	})

	sets.TreasureHunter = {
		waist="Chaac Belt",
	}

	sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling.MACC, sets.TreasureHunter,{
		main="Daybreak"
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
	equipSet = Luopan(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end

function pet_change_custom(pet,gain)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}
	equipSet = Luopan(equipSet)
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function Luopan(equipSet) --  This maintains the extra 600hp during midcast of spells when luapan is deployed
	equipSet = {}
	if pet.isvalid then
		equipSet = set_combine(equipSet, sets.Luopan)
	end
	return equipSet
end