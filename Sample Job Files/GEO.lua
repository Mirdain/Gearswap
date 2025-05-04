
--Morwen

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "20"
MacroBook = "20"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Idris','Black Halo','Unlocked')
state.WeaponMode:set('Unlocked')

--WS to check for Obi or Orpheus Check
elemental_ws = S{'Aeolian Edge','Cyclone'}

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Goal 2200 HP/1400 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Idris'] = {
		main="Idris",
		sub="Genmei Shield",
	}

	sets.Weapons['Black Halo'] = {
		main="Maxentius",
		sub="Genmei Shield",
	}

	sets.Weapons['Unlocked'] = {
		main="Daybreak",
		sub="Genmei Shield",
	}

	sets.Weapons.Sleep = {
		main="Lorg Mor",
	}

	--Shield used when not dual wield.
	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3", -- 11/11
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3", -- 12/12
		legs={ name="Nyame Flanchard", augments={'Path: B',}}, -- 8/8
		feet="Azimuth Gaiters +3", -- 10/10
		neck={ name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/5
		right_ear="Lugalbanda Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}}, -- 5/5
    } -- 50 PDT / 52 MDT (including shield)

	-- Sets for Idle when player has a pet
	sets.Idle.Pet = set_combine( sets.Idle, { --2278/1482
		head="Azimuth Hood +3", -- 11/11
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		hands="Geo. Mitaines +3",
    }) -- 54 PDT / 45 MDT (with shield)

	--Used to swap into movement gear when the player is moving and not engaged
	sets.Movement = {
		left_ring="Defending Ring",
		feet="Geo. Sandals +3",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe2", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		head="Azimuth Hood +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Azimuth Gaiters +3",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	-- Base TP set
	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{
	})

	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{
	})
	
	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{
	})

	--This set is used when OffenseMode is PDL and Enaged
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, {
	})

	--Swap in when dual wielding
	sets.DualWield = {
		left_ear="Eabani Earring",
	}

	-- Precast Sets
	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 3
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','STR+6',}}, -- 15
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+9','"Fast Cast"+6',}}, -- 12
		hands={ name="Agwu's Gages", augments={'Path: A',}}, -- 6
		legs="Geomancy Pants +3", -- 15
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+12','"Fast Cast"+7','INT+9','"Mag.Atk.Bns."+8',}}, -- 12
		neck="Voltsurge Torque", -- 4
		waist="Embla Sash", -- 5
		left_ear="Etiolation Earring", -- 1
		right_ear="Malignance Earring", -- 4
		left_ring="Etana Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	} -- 87

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}

	-- Cure Set
	sets.Midcast.Cure = {
		main="Daybreak", -- 30
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}, -- 10
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands="Azimuth Gloves +3",
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet="Azimuth Gaiters +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}}, -- 10
    }

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
	
	});

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Idris", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Geo. Galero +3",
		body="Geomancy Tunic +3",
		hands="Azimuth Gloves +3",
		legs="Geomancy Pants +3",
		feet="Geo. Sandals +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	-- Free Nuke
	sets.Midcast.Nuke = {
		main={ name="Idris", augments={'Path: A',}},
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Ea Houppe. +1",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Mizu. Kubikazari",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	-- Used for Burst Mode
	sets.Midcast.Burst = set_combine( sets.Midcast.Nuke, {

	})

	-- CuragaSet
	sets.Midcast.Curaga = set_combine( sets.Midcast.Cure, {})

	-- Cursna Set
	sets.Midcast.Cursna = set_combine( sets.Midcast.Cure, {
	    left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
	})

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		waist="Siegel Sash",
	})
	-- Aquaveil Set
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	})

	-- Stun Set
	sets.Midcast["Stun"] = set_combine( sets.Midcast.Nuke,{
	})

	sets.Midcast["Erase"] = sets.Precast.FastCast

	-- Refresh Set
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {

	})
	-- Aspir Set
	sets.Midcast.Aspir = {

	}
	-- Drain Set
	sets.Midcast.Drain = {

	}

	sets.Geomancy = {}

	-- Indi Duration
	sets.Geomancy.Indi = {
		main={ name="Idris", augments={'Path: A',}},
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Azimuth Coat +3",
		hands="Geo. Mitaines +3",
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}}, -- 21
		feet="Azimuth Gaiters +3", -- 30
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
	}

	sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {
		main={ name="Gada", augments={'Indi. eff. dur. +11','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
	})

	-- Geo Potency
	sets.Geomancy.Geo = set_combine( sets.Geomancy.Indi, {
		legs={ name="Nyame Flanchard", augments={'Path: B',}}, -- 8/8
		feet="Azimuth Gaiters +3", -- 11/11
	})

	sets.Pet_Midcast = {}

	-- Will be used to keep max HP of Luopan when casting spells but switches when below 70% to the Idle.Pet set.
	sets.Luopan = {
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
	}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Collimated Fervor"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Bolster"] = {
	    body={ name="Bagua Tunic +3", augments={'Enhances "Bolster" effect',}}, 
	}
	sets.JA["Full Circle"] = {
		head="Azimuth Hood +3", -- 3
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
	}
	sets.JA["Lasting Emanation"] = {}
	sets.JA["Ecliptic Attrition"] = {} 
	sets.JA["Life Cycle"] = {
		body="Geomancy Tunic +3",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
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
	    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Telos Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- Set to equip when charmed
	sets.Charm = {}

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		waist="Chaac Belt",
		hands={ name="Merlinic Dastanas", augments={'Accuracy+20','"Conserve MP"+4','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
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
	-- Maintain the High HP of the Luopan
	if Geomancy_List:contains(spell.english) then
		equipSet = set_combine(equipSet, sets.Luopan)
	else
		equipSet = Luopan(equipSet)
	end
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

function Luopan(equipSet) --  This maintains the extra 600hp during midcast of spells when Luopan is deployed
	equipSet = {}
	local head_item = player.equipment.head
	local relic_equiped = false
	if head_item and head_item:contains("Bagua") then
		relic_equiped = true
	end
	if pet.isvalid and pet.hpp >= 70 and relic_equiped then
		equipSet = set_combine(equipSet, sets.Luopan)
	end
	return equipSet
end

Cycle_Time = 5
function Cycle_Timer()
	if player.status == "Idle" then
		--equip(set_combine(choose_set(),choose_set_custom()))
	end
end
