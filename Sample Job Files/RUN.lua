
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "12"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Modes for specific to RUN
state.OffenseMode = M{['description']='Engaged Mode'}
-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA','AoE') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

--Enable JobMode for UI.
UI_Name = 'Runes'
--Modes for specific to RUN
state.JobMode = M{['description']='Rune Mode'}
state.JobMode:options('None','Fire','Ice','Wind','Earth','Lighting','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode:set('None')

jobsetup (LockStylePallet,MacroBook,MacroSet)

-- HP balancing: 3000 HP
-- MP balancing: 950 MP

function get_sets()
	-- Standard Idle set
	sets.Idle = {
		main={ name="Epeolatry", augments={'Path: A',}},  -- 25/0 - PDT II
		sub="Utu Grip",
		ammo="Staunch Tathlum +1", -- 3/3
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",  -- 7/0 -- Do not count due to movement swap
		feet="Turms Leggings +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=4}, -- 7/7
		waist="Flume Belt +1", -- 4/0
		left_ear={ name="Etiolation Earring", priority=3},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2}, -- 3/5
		left_ring="Defending Ring", -- 10/10
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10/0
    } -- 74 PDT / 33 MDT		3016 HP/ 949 MP

	sets.Idle.AoE = {
	    main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Erilaz Surcoat +1",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=5}, -- 7/7
		waist="Flume Belt +1", -- 4/0
		left_ear={ name="Etiolation Earring", priority=3},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2}, -- 3/5
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=4}, -- 7/-1
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=1}, -- 5/5
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10/0
	}

	-- This gear will be equiped when the player is moving and not engaged
	sets.Movement = {
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}}, -- 6/0
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
    } -- 73 PDT / 33 MDT		3028 HP / 963 MP

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--DPS set for tanking
	sets.OffenseMode.TP = {
		main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Yamarang",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Runeist's Coat +3",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=1},
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring={ name="Regal Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	} -- No fucks given

	--Physical Damage Taken set for tanking
	sets.OffenseMode.PDT = {
		main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Yamarang",
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring={ name="Moonlight Ring", bag="wardrobe3", priority=1},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	} -- Maintains Capped PDT with some DPS mixed in

	--Magic Evasion set for tanking
	sets.OffenseMode.MEVA = {
		main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Yamarang",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +1",
		feet="Turms Leggings +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=1},
		waist="Flume Belt +1",
		left_ear={ name="Etiolation Earring", priority=3},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=4},
		left_ring="Purity Ring",
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	} -- Focus on Magic Evasion with some DPS mixed in

	-- Standard Tanking TP set
	sets.OffenseMode.DT = {		
		main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Yamarang",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Aya. Cosciales +2",
		feet="Turms Leggings +1",
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=3},
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=4},
		left_ring={ name="Moonlight Ring", bag="wardrobe3", priority=1},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}  -- 

	-- Gear to swap in for ACC when TP
	sets.OffenseMode.ACC = set_combine(sets.TP, {
	    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=1},
	})

	sets.Precast = {}
	-- Used for Magic Spells

	sets.Precast.FastCast = {
		main={ name="Epeolatry", augments={'Path: A',}},
		sub="Utu Grip",
		ammo="Sapience Orb", -- 2
		head="Rune. Bandeau +3", -- 14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs="Aya. Cosciales +2", -- 6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, priority=5}, -- 8
		neck="Voltsurge Torque", -- 4
		waist={ name="Kasiri Belt", priority=4},
		right_ear={ name="Tuisto Earring", priority=1},
		left_ear="Etiolation Earring", -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=3},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	} --44 FC

	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
		ammo="Staunch Tathlum +1", -- 11
		head={ name="Taeon Chapeau", augments={'Mag. Evasion+19','Spell interruption rate down -10%','HP+49',}}, -- 10
		body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
		hands="Regal Gauntlets", -- 10
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}}, -- 20
		feet="Erilaz Greaves +1",
		neck="Moonlight Necklace", -- 15
		waist="Audumbla Sash", -- 10
		left_ear="Magnetic Earring", -- 8
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	}	-- 104 With Merits

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	    head="Erilaz Galea +1",
		body="Runeist's Coat +3",
		hands={ name="Regal Gauntlets", priority=2},
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, priority=3},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear={ name="Tuisto Earring", priority=1},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.Midcast["Aquaveil"] = sets.Midcast.SIRD

	sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}}, --7
	})

	-- Set used for hate generation on Job abilities
	sets.Enmity = {
		main="Epeolatry", -- 23
		sub="Utu Grip",
		ammo="Sapience Orb", --2
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands={ name="Futhark Mitons +3", augments={'Enhances "Sleight of Sword" effect',}}, -- 6
		legs="Eri. Leg Guards +1", -- 11
		feet="Erilaz Greaves +1", -- 6
		neck="Moonlight Necklace", -- 15
		waist="Kasiri Belt",
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear="Cryptic Earring", -- 4
		left_ring="Begrudging Ring", -- 5
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 82 Enmity 2944 HP / 908 MP

	-- JOB ABILITIES --
	sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["Gambit"] = set_combine(sets.Enmity, { hands="Runeist's Mitons +1" })
    sets.JA["Rayke"] = set_combine(sets.Enmity, { feet="Futhark Boots +3" })
    sets.JA["Liement"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, { feet="Runeist Bottes +1" })
    sets.JA["Battuta"] = set_combine(sets.Enmity, { head="Futhark Bandeau +3" })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, { head="Erilaz Galea +1" })
    sets.JA["Embolden"] = set_combine(sets.Enmity, { back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+1',}},})
    sets.JA["Swordplay"] = set_combine(sets.Enmity, { hands="Futhark Mitons +3" })
	sets.JA["Provoke"] = sets.Enmity

	sets.Embolden = { back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+1',}},}

	--Default WS set base
	sets.WS = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}

	--Great Sword WS
	sets.WS["Hard Slash"] = {}
	sets.WS["Frostbite"] = {}
	sets.WS["Freezebite"] = {}
	sets.WS["Shockwave"] = {}
	sets.WS["Crescent Moon"] = {}
	sets.WS["Sickle Moon"] = {}
	sets.WS["Spinning Slash"] = {}
	sets.WS["Herculean Slash"] = {}
	sets.WS["Resolution"] = {
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back="Phalangite Mantle",
	}
	sets.WS["Dimidiation"] = {
		main="Epeolatry",
		sub="Utu Grip",
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		feet={ name="Herculean Boots", augments={'Pet: INT+3','"Subtle Blow"+4','"Treasure Hunter"+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
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

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	set_combine(equipSet, Embolden_Check(spell))
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
--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if player.sub_job == 'SAM' then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		end
	end

	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	return buff
end
--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	local sp_recasts = windower.ffxi.get_spell_recasts()


	if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 100 then
		buff = "Crusade"
	elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 100 then
		buff = "Phalanx"
	elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 100 then
		buff = "Aquaveil"
	end

	return buff
end
-- This function is called when the job file is unloaded
function user_file_unload()

end

function Embolden_Check(spell)
	equipSet = {}
	if spell.target.name == player.name then
		if buffactive['Embolden'] then
			equipSet = sets.Embolden
			info('Embolden Set')
		end
	end
	return equipSet
end

