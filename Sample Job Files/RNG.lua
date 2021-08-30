--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "14"
MacroBook = "2"  -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = true

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 99

-- Add CRIT the base modes to allow AM3 Critical Builds
state.OffenseMode:options('TP','ACC','DT','PDL','CRIT')

--Set default modes are (TP,ACC,DT,PDL)
state.OffenseMode:set('TP')

--Enable JobMode for UI
UI_Name = 'DPS'

--Modes for specific to Ranger
state.JobMode = M{['description']='Ranger Damage Mode'}
state.JobMode:options('Fomalhaut','Annihilator','Fail-Not','Savage Blade', 'Aeolian Edge','Gastraphetes')
state.JobMode:set('Fomalhaut')

-- Used to determine if Obi is used or Orpheus Sash - if neither is present will not change waist slot
elemental_ws = S{'Aeolian Edge', 'Flaming Arrow', 'Wildfire','Trueflight','Hot Shot'}

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Goal is 2000 HP
function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Ternion Dagger +1",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['Fomalhaut'] = {
		Ammo.Bullet.RA,
		main="Tauret",
		sub="Ternion Dagger +1",
		range={ name="Fomalhaut", augments={'Path: A',}},
	}

	sets.Weapons['Annihilator'] = {
		Ammo.Bullet.RA,
		main="Tauret",
		sub="Ternion Dagger +1",
		range={ name="Annihilator"},
	}

	sets.Weapons['Fail-Not'] = {
		Ammo.Arrow.RA,
		main="Tauret",
		sub="Ternion Dagger +1",
		range={ name="Fail-Not"},
	}

	sets.Weapons['Gastraphetes'] = {
		Ammo.Bolt.RA,
		main="Tauret",
		sub="Ternion Dagger +1",
		range={ name="Gastraphetes"},
	}

	sets.Weapons['Aeolian Edge'] = {
		main="Tauret",
		sub="Ternion Dagger +1",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons.Shield = {
		sub={ name="Nusku Shield", priority=1},
	}

	-- Ammo Selection
	Ammo.Bullet.RA = "Chrono Bullet"		-- TP Ammo
	Ammo.Bullet.WS = "Chrono Bullet"		-- Physical Weaponskills
	Ammo.Bullet.MAB = "Chrono Bullet"		-- Magical Weaponskills
	Ammo.Bullet.MACC = "Chrono Bullet"		-- Magic Accuracy
	Ammo.Bullet.MAG_WS = "Chrono Bullet"	-- Magic Weaponskills

	Ammo.Arrow.RA = "Chrono Arrow"			-- TP Ammo
	Ammo.Arrow.WS = "Chrono Arrow"			-- Physical Weaponskills
	Ammo.Arrow.MAB = "Chrono Arrow"			-- Magical Weaponskills
	Ammo.Arrow.MACC = "Chrono Arrow"		-- Magic Accuracy
	Ammo.Arrow.MAG_WS = "Chrono Arrow"		-- Magic Weaponskills

	Ammo.Bolt.RA = "Quelling Bolt"			-- TP Ammo
	Ammo.Bolt.WS = "Quelling Bolt"			-- Physical Weaponskills
	Ammo.Bolt.MAB = "Quelling Bolt"			-- Magical Weaponskills
	Ammo.Bolt.MACC = "Quelling Bolt"		-- Magic Accuracy
	Ammo.Bolt.MAG_WS = "Quelling Bolt"		-- Magic Weaponskills

	Ammo.RA = ""
	Ammo.WS = ""
	Ammo.MAB = ""
	Ammo.MACC = ""

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Sanare Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}, -- Add DT
    }

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	--Base TP set to build off when melee'n
	sets.OffenseMode = {}

	--Set focuses on maximum TP gain
	sets.OffenseMode.TP = {
	    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Malignance Boots",
		neck={ name="Scout's Gorget +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring={ name="Chirich Ring +1", bag="wardrobe1",},
		right_ring="Epona's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}, -- Need to update Cape
	}

	--This set is used when OffenseMode is set to DT and enaged
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
	    head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
	})

	--This set is used when OffenseMode is set to PDL and enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		right_ring={ name="Chirich Ring +1", bag="wardrobe3",},
		left_ear="Crep. Earring",
	})

	--This set is used when OffenseMode is CRIT and Engaged
	--Change the sets.OffenseMode.XXX to what you want while engaged - default is DT and shooting is seperate build below for AM3
	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode.DT, {

	})

	--The following sets augment the base TP set above for Dual Wielding
	sets.DualWield = {
		-- Add DW 10% cape
	}

	sets.Precast = {}
	-- 70 snapshot is Cap
	-- Velocity Shot is seperate term - JA of Ranger
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast

	-- True Shot Ranges (Increases RA and WS and)
		-- Distances listed below are effected by Monster Size
		-- Gun ~6.5 yalms
		-- Short Bow ~8.6 yalms
		-- Crossbow ~10.7 yalms
		-- Long Bow ~ 11.8 yalms

	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	-- Rapid Shot is a Job Trait of Ranger - 30%

	--No flurry - 60 Snapshot needed (Assuming 10% from Merits)
	-- Snapshot / Rapidshot
	sets.Precast.RA = { -- 5 Snapshot on Perun +1 Augment if used
	    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10
		body="Amini Caban +1", -- 7% Velocity Shot
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8 / 11
		legs="Orion Braccae +3", -- 15
		feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}, priority=4}, -- 10 / 13
		neck={ name="Scout's Gorget +2", augments={'Path: A',}}, -- 4
		waist="Yemaya Belt", -- 0 / 5
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear={ name ="Tuisto Earring", priority=1},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		right_ring="Crepuscular Ring", -- 3
		back={ name="Belenus's Cape", augments={'"Snapshot"+10',}, priority=5}, -- 10 with 2% Velocity Shot
    }	--60 Snapshot / 29 Rapidshot / 9% Velocity Shot

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
		head="Orion Beret +3",
	    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
	}) --45 Snapshot / 60 Rapidshot / 9% Velocity Shot

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 
		feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}},
    })	--35 Snapshot / 70 Rapidshot / 9% Velocity Shot

	-- Fast Cast for magic such as Utsusemi
	sets.Precast.FastCast = {
	    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+40',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+11','"Fast Cast"+6',}}, --6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, -- 8
		neck="Voltsurge Torque", --8
		waist="Siegel Sash", -- 8 (Enhancing Magic only - Utsusemi)
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring", -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Weather. Ring", -- 5
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}, -- Need to upgrade Cape with 10% FC
	} -- 77 FC for Utsusemi (80 is cap)
	 
	sets.Midcast = {}

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
		ammo=Ammo.Bullet.RA,
		head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
		body="Ikenga's Vest",
		hands="Ikenga's Gloves",
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
		feet="Ikenga's Clogs",
		neck={ name="Scout's Gorget +2", augments={'Path: A',}},
		waist="K. Kachina Belt +1",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Crepuscular Ring",
		right_ring="Regal Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
    } -- With Recycle Merits 101 Recycle for TP bonus and Ammo Save

	-- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
		body="Malignance Tabard",
		hands="Malignance Gloves",
		feet="Malignance Boots",
    })

	-- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {
	    head="Ikenga's Hat",
		legs="Ikenga's Trousers",
    })

	-- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
		head="Meghanada Visor +2",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
		-- Need to make Crit Cape
    })

	-- Ranged Attack Gear (Double Shot Midshot)
	sets.Midcast.RA.DoubleShot = set_combine(sets.Midcast.RA, {
	    head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
		body={ name="Arc. Jerkin +1", augments={'Enhances "Snapshot" effect',}}, -- Need Upgrade
		-- Add Oshi Gear
    })

	-- Ranged Attack Gear (Barrage active)
	sets.Midcast.RA.Barrage = set_combine(sets.Midcast.RA, {
	    hands="Orion Bracers +3",
    })

	-- Job Abilities
	sets.JA = {}
	sets.JA["Eagle Eye Shot"] = {}
	sets.JA["Scavenge"] = {}
	sets.JA["Shadowbind"] = { hands="Orion Bracers +3",}
	sets.JA["Camouflage"] = { body={ name="Arc. Jerkin +1", augments={'Enhances "Snapshot" effect',}},} -- Need Upgrade
	sets.JA["Sharpshot"] = { legs="Orion Braccae +3",} -- Used for rules below
	sets.JA["Barrage"] = {} -- Midcast.RA.Barrage set is used for rules below
	sets.JA["Unlimited Shot"] = {}
	sets.JA["Velocity Shot"] = {}
	sets.JA["Double Shot"] = {} -- Uses Rules from Include
	sets.JA["Bounty Shot"] = { hands="Amini Glove. +1",} -- Upgrade to TH4
	sets.JA["Decoy Shot"] = {}
	sets.JA["Overkill"] = {}
	sets.JA["Hover Shot"] = {}

	-- Base Weapon Skill set
	sets.WS = {

	}

	-- Weapon Skill Damage
	sets.WS.WSD = set_combine(sets.WS, {

	})

	-- Magic Attack Bonus
	sets.WS.MAB = set_combine(sets.WS, {

	})

	-- Physical Damage Limit set used in OffenseMode.PDL
	sets.WS.PDL = set_combine(sets.WS, {
	
	})

	-- Accuracy set used in OffenseMode.ACC
	sets.WS.ACC = set_combine(sets.WS, {
	
	})

	-- Gun Weaponskills
	sets.WS["Hot Shot"] = {}
	sets.WS["Split Shot"] = {}
	sets.WS["Sniper Shot"] = {}
	sets.WS["Slug Shot"] = {}
	sets.WS["Blast Shot"] = {}
	sets.WS["Heavy Shot"] = {}
	sets.WS["Detonator"] = {}
	sets.WS["Numbing Shot"] = {}
	sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {
	
	})
	sets.WS["Last Stand"] = set_combine(sets.WS.WSD, {

	})

	-- Archery Weaponskills
	sets.WS["Flaming Arrow"] = {}
	sets.WS["Piercing Arrow"] = {}
	sets.WS["Dulling Arrow"] = {}
	sets.WS["Sidewinder"] = {}
	sets.WS["Blast Arrow"] = {}
	sets.WS["Arching Arrow"] = {}
	sets.WS["Refulgent Arrow"] = {}
	sets.WS["Jishnu's Radiance"] = {}
	sets.WS["Apex Arrow"] = {}

	-- Sword Weaponskills
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {

	})

	-- Dagger Weaponskills
	sets.WS["Wasp Sting"] = {}
	sets.WS["Viper Bite"] = {}
	sets.WS["Shadowstitch"] = {}
	sets.WS["Gust Slash"] = {}
	sets.WS["Cyclone"] = {}
	sets.WS["Energy Steal"] = {}
	sets.WS["Energy Drain"] = {}
	sets.WS["Evisceration"] = {}
	sets.WS['Aeolian Edge'] = set_combine(sets.WS.MAB, {
		Ammo.Bullet.MAB,
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

	-- Crossbow Weaponskills
	sets.WS["Trueflight"] = set_combine(sets.WS.MAB, {

	})


	sets.Charm = {}

	sets.TreasureHunter = {
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

	equipSet = Elemental_check(equipSet, spell)

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

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

-- Function is called whn lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
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

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])
	if DualWield == false then
		equipSet = set_combine(equipSet,sets.Weapons.Shield)
	end
	return equipSet
end

function Elemental_check(equipSet, spell)
	-- This function swaps in the Orpheus or Hachirin as needed
	if elemental_ws:contains(spell.name) then
		-- Matching double weather (w/o day conflict).
		if spell.element == world.weather_element and world.weather_intensity == 2 then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'Weather is Double ['.. world.weather_element .. '] - using Hachirin-no-Obi')
		-- Matching day and weather.
		elseif spell.element == world.day_element and spell.element == world.weather_element then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			-- Target distance less than 6 yalms
		elseif spell.target.distance < (6 + spell.target.model_size) then
			equipSet = set_combine(equipSet, {waist="Orpheus's Sash",})
			windower.add_to_chat(8,'Distance is ['.. round(spell.target.distance,2) .. '] using Orpheus Sash')
		-- Match day or weather.
		elseif spell.element == world.day_element or spell.element == world.weather_element then
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
		else
			windower.add_to_chat(8,'No Day/Weather match and too far.  Using default waist')
		end
	end
	return equipSet
end