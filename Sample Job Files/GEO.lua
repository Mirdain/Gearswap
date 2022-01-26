
--Colonnello

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

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('TP')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Idris','Unlocked')
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

	sets.Weapons['Unlocked'] = {
		main="Idris",
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = { 	-- 2278/1434
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Nyame Helm",
		body="Geomancy Tunic +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
    }
	-- Sets for Idle when player has a pet
	sets.Idle.Pet = set_combine( sets.Idle, { --2278/1482
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		hands="Geo. Mitaines +3",
    })
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
	sets.Precast.FastCast = { -- 2264/1400
		main="Idris",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','STR+6',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+9','"Fast Cast"+6',}},
		hands="Geo. Mitaines +3",
		legs="Geomancy Pants +3",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+12','"Fast Cast"+7','INT+9','"Mag.Atk.Bns."+8',}},
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','HP+20','"Fast Cast"+10',}},
	}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}
	-- Cure Set
	sets.Midcast.Cure = { -- 2092/1413
		main="Daybreak",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Loricate Torque +1",
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+2','DMG:+1',}},
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
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Idris",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Geo. Galero +3",
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +3%','INT+6','Mag. Acc.+15','"Mag.Atk.Bns."+7',}},
		feet="Geo. Sandals +3",
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}
	-- Free Nuke
	sets.Midcast.Nuke = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Ea Houppe. +1",
		hands={ name="Agwu's Gages", augments={'Path: A',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +3%','INT+6','Mag. Acc.+15','"Mag.Atk.Bns."+7',}},
		feet="Agwu's Pigaches",
		neck="Sanctity Necklace",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Jhakri Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}
	-- Used for Burst Mode
	sets.Midcast.Burst = set_combine( sets.Midcast.Nuke, {

	})
	-- CuragaSet
	sets.Midcast.Curaga = sets.Midcast.Cure
	-- Cursna Set
	sets.Midcast.Cursna = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		waist="Siegel Sash",
	})
	-- Aquaveil Set
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {

	})

	-- Stun Set
	sets.Midcast["Stun"] = {

	}

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
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
		body="Geomancy Tunic +3",
		hands="Geo. Mitaines +3",
		legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
		feet="Azimuth Gaiters +1",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Damage taken-5%',}},
	}
	sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {

	})
	-- Geo Potency
	sets.Geomancy.Geo = set_combine( sets.Geomancy.Indi, {
		legs="Geomancy Pants +3",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
	})

	-- Will be used to keep max HP of Luopan when casting spells
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
	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Set to equip when charmed
	sets.Charm = {}

	sets.TreasureHunter = {
		waist="Chaac Belt",
		hands={ name="Merlinic Dastanas", augments={'Accuracy+20','"Conserve MP"+4','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
		head={ name="Merlinic Hood", augments={'Crit.hit rate+3','CHR+1','"Treasure Hunter"+1','Accuracy+17 Attack+17','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
	}

	sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling.MACC, sets.TreasureHunter,{
		main="Daybreak"
	})

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

local Luapan_Active = false

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
		Luapan_Active = true
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
	if gain == false then
		Luapan_Active = false
	end
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
	if Luapan_Active == true then
		equipSet = set_combine(equipSet, sets.Luopan)
	end
	log('luapan status: ['..tostring(Luapan_Active)..']')
	return equipSet
end
