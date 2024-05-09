
--Elendnur

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "20"
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
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes
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
		main={ name="Idris", augments={'Path: A',}},
		sub={ name="Ternion Dagger +1", augments={'Path: A',}},
	}

	-- This is the idle when "Unlocked"
	-- When in the "Unlocked" mode the "main" and "sub" from the gearsets below are used
	sets.Weapons['Unlocked'] = { }

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	sets.Weapons.Sleep = {
		main="Lorg Mor",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Daybreak",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3", -- 11/11
		body="Azimuth Coat +2",
		hands="Azimuth Gloves +3", -- 12/12
		legs={ name="Nyame Flanchard", augments={'Path: B',}}, -- 8/8
		feet="Azimuth Gaiters +3", -- 10/10
		neck={ name="Loricate Torque +1", augments={'Path: A',}}, -- 6/6
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1}, -- 3/5
		right_ear="Lugalbanda Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}, priority=2},
    } -- 50 DT

	-- Sets for Idle when player has a pet
	sets.Idle.Pet = set_combine( sets.Idle, {
		main={ name="Idris", augments={'Path: A',}},
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
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring={ name="Chirich Ring +1", bag="wardrobe1", priority=2},
		right_ring={ name="Chirich Ring +1", bag="wardrobe2", priority=1},
		back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	-- Base TP set
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {
	
	})

	-- Set to use when Dual Wielding
	sets.OffenseMode.TP.DW = set_combine(sets.OffenseMode, {
	
	})
	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
	
	})

	-- TP set when in MEVA mode
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, {
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		neck="Warder's Charm +1",
		waist="Cornelia's Belt",
	})

	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {
	
	})

	-- Precast Sets
	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = { 
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 3
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
	} -- 84

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}

	-- Cure Set
	sets.Midcast.Cure = {
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Azimuth Gloves +3",
		legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}},
    }

	-- CuragaSet
	sets.Midcast.Curaga = set_combine( sets.Midcast.Cure, {})

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'Mag. Evasion+21','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Mag. Evasion+23','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+24','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+21','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Etiolation Earring", priority=2},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Nantosuelta's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}},
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +2",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +2",
		feet="Azimuth Gaiters +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Kishar Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Damage taken-5%',}},
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

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

	-- Used for Burst
	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		neck="Mizu. Kubikazari",
		right_ring="Mujin Band",
	})

	-- Cursna Set
	sets.Midcast['Cursna'] = set_combine( sets.Midcast.Cure, {
	    left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
	})

	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ear="Earthcry Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		waist="Siegel Sash",
	})

	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	    main="Vadose Rod",
		head="Amalric Coif +1"
	})

	sets.Midcast["Stun"] = set_combine(sets.Midcast.Enfeebling, {
		hands="Geo. Mitaines +3",
		legs="Azimuth Tights +2",
	})

	-- Refresh Set
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})

	-- Aspir Set
	sets.Midcast.Aspir = set_combine(sets.Midcast.Enfeebling, {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		neck="Erra Pendant",
	})

	-- Drain Set
	sets.Midcast.Drain = set_combine(sets.Midcast.Aspir, {

	})

	sets.Geomancy = {}

	-- Indi Duration
	sets.Geomancy.Indi = set_combine(sets.Idle,{
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}}, -- 21
		feet="Azimuth Gaiters +3", -- 20
	})

	sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {
		main={ name="Solstice", augments={'INT+15','"Mag.Atk.Bns."+10','"Refresh"+1',}}, -- 15
	})

	-- Geo Potency
	sets.Geomancy.Geo = set_combine(sets.Idle,{
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		legs="Azimuth Tights +2",
		left_ring="Defending Ring",
	})

	-- Maintain Luopan HP with the Relic to give it +600 HP
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
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
	}
	sets.JA["Lasting Emanation"] = {}
	sets.JA["Ecliptic Attrition"] = {} 
	sets.JA["Life Cycle"] = {
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}}, -- Max HP
		body="Geomancy Tunic +3", -- +14%
		-- Rest is for Max hp (25% of current HP to Luopan)
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Etana Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}},
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
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS['Exudation'] = 
	{
	    left_ear="Regal Earring",
		right_ear="Malignance Earring",
	}

	sets.TreasureHunter = {
		legs="Volte Hose",
		feet="Volte Boots",
		ammo="Per. Lucky Egg",
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
	-- Maintain the High HP of the Luopan
	if geomancy:contains(spell.english) then
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
	if pet and pet.isvalid and pet.hpp >= 70 and relic_equiped then
		equipSet = set_combine(equipSet, sets.Luopan)
	end
	return equipSet
end

Cycle_Time = 5
function Cycle_Timer()
	if player.status == "Idle" then
		local head_item = player.equipment.head
		local relic_equiped = false
		if head_item and head_item:contains("Bagua") then
			relic_equiped = true
		end
		if pet and pet.isvalid then
			if pet.hpp >= 70 and relic_equiped then
				equip(sets.Luopan)
			else
				equip(sets.Idle.Pet)
			end
		end
	end
end