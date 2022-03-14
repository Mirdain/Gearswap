
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "5"
MacroBook = "6"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = true

--Weapons options
state.WeaponMode:options('Aeneas','Naegling')
state.WeaponMode:set('Aeneas')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Aeneas'] = {
		main={ name="Aeneas", augments={'Path: A',}},
		sub="Gandring",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Gandring",
	}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

	sets.Movement = {
		feet="Fajin Boots",
    }

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Asn. Gorget +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		right_ear="Sherida Earring",
		left_ear="Telos Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {}

	--Dual Wield
	sets.DualWield = {
	    left_ear="Eabani Earring",
	    waist="Reiki Yotai",
	}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6',}}, -- 13
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}}, -- 8
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}}, -- 6
		feet={ name="Herculean Boots", augments={'"Fast Cast"+6',}}, -- 6
		neck="Voltsurge Torque", --4
		waist="Tempus Fugit",
		left_ear="Etiolation Earring", -- 1
		right_ear="Tuisto Earring",
		left_ring="Prolix Ring", -- 3
		right_ring="Moonlight Ring",
	} -- 51

	sets.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	}

	-- Used for Raises and Cure spells
	sets.Precast.QuickMagic = set_combine( sets.Precast.FastCast, {

	});

	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.JA = {}
	sets.JA["Perfect Dodge"] = {hands={ name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},}
	sets.JA["Steal"] = {}
	sets.JA["Flee"] = {}
	sets.JA["Hide"] = {}
	sets.JA["Sneak Attack"] = {}
	sets.JA["Mug"] = {}
	sets.JA["Trick Attack"] = {}
	sets.JA["Accomplice"] = {}
	sets.JA["Feint"] = {}
	sets.JA["Despoil"] = {}
	sets.JA["Collaborator"] = {}
	sets.JA["Conspirator"] = {}
	sets.JA["Bully"] = {}
	sets.JA["Larceny"] = {}

	--Default WS set base
	sets.WS = {
		ammo="Yetshila +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Meg. Gloves +2",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Regal Ring",
		back={ name="Toutatis's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS.MAB = set_combine( sets.WS, {
		ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring +1",
		right_ring="Epaminondas's Ring",
		back={ name="Toutatis's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	--WS Sets
	sets.WS["Wasp Sting"] = {}
	sets.WS["Viper Bite"] = {}
	sets.WS["Shadowstich"] = {}
	sets.WS["Gust Slash"] = {}
	sets.WS["Cyclone"] = {}
	sets.WS["Energy Steal"] = {}
	sets.WS["Energy Drain"] = {}
	sets.WS["Dancing Edge"] = {}
	sets.WS["Shark Bite"] = {}
	sets.WS["Evisceration"] = {}
	sets.WS["Aeolian Edge"] = set_combine( sets.WS.MAB, {
		hands={ name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
	})

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
		hands={ name="Plun. Armlets +3", augments={'Enhances "Perfect Dodge" effect',}},
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

-- This function is called when the job file is unloaded
function user_file_unload()

end