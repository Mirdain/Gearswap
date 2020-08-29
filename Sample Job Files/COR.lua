--Relyk

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "18"
MacroBook = "18"
MacroSet = "1"

-- load addons
send_command('lua l autocor')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 50

function get_sets()

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
	    main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: A',}},
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Yemaya Belt",
		left_ear="Sanare Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
    }

	sets.Movement = {
		legs="Carmine Cuisses +1",
	}

	-- TP Ammo
	Ammo.Bullet.RA = "Decimating Bullet"
	-- Physical Weaponskills
	Ammo.Bullet.WS = "Eminent Bullet"
	-- Magical Weaponskills
	Ammo.Bullet.MAB = "Adlivun Bullet"
	-- Magic Accuracy
	Ammo.Bullet.MACC = "Adlivun Bullet"
	-- Quick Draw
	Ammo.Bullet.QD = "Adlivun Bullet"

	sets.Precast = {}
	-- 70 snapshot is Cap.  Need 60 due to 10 from gifts
	-- Snapshot / Rapidshot
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast
	-- Flurry is 15%
	-- Flurry II 30% Snapshot

	--No flurry - 60 Snapshot needed
	sets.Precast.RA = {
		main={ name="Rostam", augments={'Path: A',}},
		sub="Nusku Shield",
		ammo=Ammo.Bullet.RA,
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10/0
		body="Oshosi Vest +1", -- 14/0
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet="Meg. Jam. +2", -- 10/0
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
		-- Totals 62/24
    }

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = {
		main={ name="Rostam", augments={'Path: A',}},
		sub="Nusku Shield",
		ammo=Ammo.Bullet.RA,
	    head="Chass. Tricorne +1", -- 0/14
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10/0
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet="Meg. Jam. +2", -- 10/0
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
    } -- Totals 48/48

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = {
		main={ name="Rostam", augments={'Path: A',}},
		sub="Nusku Shield",
		ammo=Ammo.Bullet.RA,
	    head="Chass. Tricorne +1", -- 0/14
		body="Laksa. Frac +3", -- 0/20
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}}, -- 0/10
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
    } -- Totals 28/78

	sets.Midcast = {}

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Dingir Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

	-- Ranged Attack Gear (Triple Shot Midshot)
	sets.Midcast.RA.TripleShot = set_combine(sets.Midcast.RA, {
        head="Oshosi Mask +1", --5
        body="Chasseur's Frac +1", --12
        hands="Lanun Gants +3",
        legs="Osh. Trousers +1", --6
        feet="Osh. Leggings +1", --3
    }) --27

	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Wild Card"] = {
	    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Quick Draw"] = {
	    feet="Chass. Bottes +1",
	}
	sets.JA["Random Deal"] = {
	    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	}
	sets.JA["Snake Eye"] = {
	    legs={ name="Lanun Trews +1", augments={'Enhances "Snake Eye" effect',}},
	}
	sets.JA["Fold"] = {
		hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
	}
	sets.JA["Triple Shot"] = {} --Gear to be worn during Midshot
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}

	--Base Set used for all rolls
	sets.PhantomRoll = set_combine(sets.Idle, {
		main={ name="Rostam", augments={'Path: C',}}, -- +8 Effect and 60 sec Duration
		range="Compensator", -- 20 sec Duration
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
		hands="Chasseur's Gants +1", --50 sec Duration
		neck="Regal Necklace", -- 20 sec Duration
		right_ring="Luzaf's Ring", -- 16 yalm range
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 30 sec Duration
	})
	sets.PhantomRoll['Fighter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Healers\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Warlocks\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Chaos Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Beast Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Choral Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Hunters\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Samurai Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Ninja Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Drachen Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Evoker\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Magus\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Corsair\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Puppet Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Dancer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Bolter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll["Caster's Roll"] = set_combine(sets.PhantomRoll, {legs="Navarch's Culottes +2"})
    sets.PhantomRoll["Courser's Roll"] = set_combine(sets.PhantomRoll, {feet="Navarch's Bottes +2"})
    sets.PhantomRoll["Blitzer's Roll"] = set_combine(sets.PhantomRoll, {head="Navarch's Tricorne +2"})
    sets.PhantomRoll["Tactician's Roll"] = set_combine(sets.PhantomRoll, {body="Navarch's Frac +2"})
    sets.PhantomRoll["Allies' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +1"})

	--Base TP set to build off when melee'n
	sets.TP = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Asperity Necklace",
		waist="Yemaya Belt",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: A',}},
		range="Compensator",
		ammo="Eminent Bullet",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	--The following sets augment the base TP set
	sets.TP.DW = {
		main="Naegling",
		sub="Blurred Knife +1",
		range="Compensator",
		ammo="Eminent Bullet",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	--The following sets augment the base TP set
	sets.TP.RA = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Sarissapho. Belt",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

	--The following sets augment the base TP set
	sets.TP.DW.DT = {}

	--The following sets augment the base TP set
	sets.TP.RA.DT = {}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {}

	sets.WS = {
		ammo=Ammo.Bullet.WS,
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS.WSD = {}

	sets.WS.MAB = {
		ammo=Ammo.Bullet.MAB,
	}

	sets.WS.MACC = {
		ammo=Ammo.Bullet.MACC,
	}

	sets.WS["Hot Shot"] = {}
	sets.WS["Split Shot"] = {}
	sets.WS["Sniper Shot"] = {}
	sets.WS["Slug Shot"] = {}
	sets.WS["Numbing Shot"] = {}
	sets.WS["Last Stand"] = {}
	sets.WS["Wildfire"] = {}
	sets.WS["Leaden Salute"] = {}
	
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Savage Blade"] = {
		head={ name="Herculean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%',}},
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'Attack+21','Weapon skill damage +5%','Accuracy+15',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck="Comm. Charm +2",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS["Requiescat"] = {}

	sets.QuickDraw = {
		ammo=Ammo.Bullet.MAB
	}
	sets.QuickDraw.ACC = {}
	sets.QuickDraw.DMG = {}
	sets.QuickDraw.STP = {}

	--Custom sets for each jobsetup
	sets.Custom = {}

	sets.Charm = {
	    main="Lament",
		range="Compensator",
		ammo="Decimating Bullet",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Yemaya Belt",
		left_ear="Sanare Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
	}

	sets.TreasureHunter = {

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

function user_file_unload()
	send_command('lua u autocor')
end