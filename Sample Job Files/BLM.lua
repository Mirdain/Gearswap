--Hurin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "14"
MacroBook = "20"
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
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA')
state.OffenseMode:set('DT')

--Weapon Modes
state.WeaponMode:options('Nuke','Unlocked')
state.WeaponMode:set('Nuke')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Nuke'] ={
		main={ name="Mpaca's Staff", augments={'Path: A',}},
		sub="Enki Strap",
	}

	sets.Weapons.Shield ={}

	sets.Weapons['Unlocked'] ={
		main={ name="Mpaca's Staff", augments={'Path: A',}},
		sub="Enki Strap",
	}

	--Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Wicce Petasos +3", --11
		body="Wicce Coat +3",
		hands="Wicce Gloves +3", --13
		legs="Wicce Chausses +3",
		feet="Wicce Sabots +3", --11 (removed while moving)
		neck={ name="Loricate Torque +1", augments={'Path: A',}}, --6
		waist="Carrier's Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring", --10
		right_ring="Stikini Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

	-- 'TP','ACC','DT','PDT','MEVA'
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDT = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})
	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Herald's Gaiters",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}
	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','INT+2','Mag. Acc.+8',}}, -- 14
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23','"Fast Cast"+7','"Mag.Atk.Bns."+14',}}, -- 13
		hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','"Mag.Atk.Bns."+5',}}, -- 7
		legs="Agwu's Slops", -- 7
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','CHR+10','Mag. Acc.+8',}}, -- 12
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1}, 
		waist="Embla Sash", -- 5
		left_ear="Malignance Earring", -- 4
		right_ear="Etiolation Earring", -- 1
		left_ring="Kishar Ring", -- 4
		right_ring="Weather. Ring", -- 5
		back={ name="Taranus's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	} -- 80% FC

	-- Used for Enhancing Magic
	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, {})

	sets.Precast["Impact"] = set_combine(sets.Precast.FastCast,{
	    ammo="Sapience Orb",
		neck="Voltsurge Torque",
		body="Twilight Cloak",
	})

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

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}

	-- Cure Set
	sets.Midcast.Cure = {

    }

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+24','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Etiolation Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
	}
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {});
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {});
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {});

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
	    main="Daybreak",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Wicce Petasos +3",
		body="Wicce Coat +3",
		hands="Wicce Gloves +3",
		legs="Wicce Chausses +3",
		feet="Wicce Sabots +3",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Wicce Earring +1",
		left_ring="Weather. Ring",
		right_ring="Stikini Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Drain = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Aspir = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})
	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.Enhancing = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast.Nuke = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Wicce Coat +3",
		hands={ name="Agwu's Gages", augments={'Path: A',}},
		legs="Wicce Chausses +3",
		feet={ name="Agwu's Pigaches", augments={'Path: A',}},
		neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, { })

	sets.Midcast.Nuke.Earth = {
	    neck="Quanpur Necklace",
	}

	sets.Midcast['Impact'] = set_combine(sets.Midcast.Nuke, {
		hands="Wicce Gloves +3",
		legs="Wicce Chausses +3",
		feet="Wicce Sabots +3",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	})

	-- Misc Sets
	sets.Midcast.CuragaSet = sets.Midcast.Cure

	sets.Midcast.Cursna = {}

	sets.MP_Recover = {
	    body="Spaekona's Coat +3",
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		right_ring="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})

	-- Aspir Set
	sets.Midcast.Aspir = {}

	sets.WS = {}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS["Myrkr"] = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Etiolation Earring",
		left_ring="Etana Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	sets.TreasureHunter = { }

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
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}
	if spell.skill == 'Elemental Magic' and not Elemental_Enfeeble:contains(spell.name) and player.MPP < 30 then
		windower.add_to_chat(8,'Player Less than 30% MP - Recover MP!')
		equipSet = sets.MP_Recover
	end
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return equipSet
end

function pet_change_custom(pet,gain)
	local equipSet = {}

	return equipSet
end

function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	local equipSet = {}

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
	local buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	local buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end