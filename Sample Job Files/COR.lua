--Relyk

-- Load and initialize the include file.
include('Mirdain-Include')

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "18"
MacroBook = "18"  -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('TP')

--Enable JobMode for UI
UI_Name = 'DPS'

--Modes for specific to Corsair
state.JobMode = M{['description']='Corsair Damage Mode'}
state.JobMode:options('Fomalhaut','Death Penalty', 'Savage Blade', 'Aeolian Edge')
state.JobMode:set('Death Penalty')

elemental_ws = S{'Aeolian Edge', 'Leaden Salute', 'Wildfire','Earth Shot','Ice Shot','Water Shot','Fire Shot','Wind Shot','Thunder Shot'}

-- load addons
send_command('lua l autocor')

--Uses Items Automatically
AutoItem = true

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 99

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Blurred Knife +1",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons['Fomalhaut'] = {
		main={ name="Rostam", augments={'Path: A'}, bag="Wardrobe 4"},
		sub={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 2"},
		range={ name="Fomalhaut", augments={'Path: A',}},
	}

	sets.Weapons['Death Penalty'] = {
		main={ name="Rostam", augments={'Path: A'}, bag="Wardrobe 4"},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
	}

	sets.Weapons['Aeolian Edge'] = {
		ammo=Ammo.Bullet.MAG_WS,
		main={ name="Rostam", augments={'Path: A'}, bag="Wardrobe 4"},
		sub="Tauret",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}

	sets.Weapons.Shield = {
		sub={ name="Nusku Shield", priority=1},
	}

	-- Ammo Selection
	Ammo.Bullet.RA = "Chrono Bullet"		-- TP Ammo
	Ammo.Bullet.WS = "Chrono Bullet"		-- Physical Weaponskills
	Ammo.Bullet.MAB = "Living Bullet"		-- Magical Weaponskills
	Ammo.Bullet.MACC = "Living Bullet"		-- Magic Accuracy
	Ammo.Bullet.QD = "Hauksbok Bullet"		-- Quick Draw
	Ammo.Bullet.MAG_WS = "Living Bullet"	-- Magic Weaponskills

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
		ammo = Ammo.Bullet.RA,
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
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
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

	sets.OffenseMode = {}

	--Base TP set to build off when melee'n
	sets.OffenseMode.TP = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Grunfeld Rope",
		left_ear="Telos Earring",
		right_ear="Eabani Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is set to DT and enaged
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	})

	--This set is used when OffenseMode is set to PDL and enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {

	})

	--The following sets augment the base TP set above for Dual Wielding
	sets.DualWield = {
		waist="Reiki Yotai",
		right_ear="Eabani Earring",
	}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {}

	sets.Precast = {}
	-- 70 snapshot is Cap.  Need 60 due to 10 from gifts
	-- Snapshot / Rapidshot
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast
	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	--No flurry - 60 Snapshot needed
	sets.Precast.RA = {
		ammo=Ammo.Bullet.RA,
		head="Chass. Tricorne +1", -- 0/14
		body="Oshosi Vest +1", -- 14/0
		hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}}, -- 13/0
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet="Meg. Jam. +2", -- 10/0
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Ilabrat Ring", priority=3},
		right_ring={ name="Regal Ring", priority=4},
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		waist="Yemaya Belt", -- 0/5
		back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Snapshot"+10',}}, -- 10/0
    } -- Totals 61/32

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
		body="Laksa. Frac +3", -- 0/20
	}) -- Totals 52/52

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 
	    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}} -- 0/10
    }) -- Totals 32/73

	sets.Precast.RA.ACC = {}

	sets.Precast.RA.PDL = {}

	-- Fast Cast for Magic
	sets.Precast.FastCast = {
	    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+44',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}}, -- 7
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+7','"Fast Cast"+6',}}, -- 6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, -- 8
		neck="Voltsurge Torque", -- 4
		waist="Sailfi Belt",
		left_ear="Loquac. Earring", -- 2
		right_ear="Etiolation Earring", -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Kishar Ring", -- 4
		back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	} -- 65 FC

	sets.Midcast = {}

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
		ammo=Ammo.Bullet.RA,
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
        hands="Lanun Gants +3", -- Tripple shot becomes Quad shot
        legs="Osh. Trousers +1", --6
        feet="Osh. Leggings +1", --3
    }) --27

	-- Quick Draw Gear Sets
	sets.QuickDraw = {}

	sets.QuickDraw.ACC = {
		ammo = Ammo.Bullet.QD,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Digni. Earring",
		right_ear="Gwati Earring",
		left_ring="Sangoma Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.QuickDraw.DMG = {
		ammo = Ammo.Bullet.QD,
		head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit.hit rate+2','MND+1','Mag. Acc.+9','"Mag.Atk.Bns."+14',}},
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Herculean Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+28','CHR+2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		feet="Chass. Bottes +1",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Crematio Earring",
		left_ring="Dingir Ring",
		right_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.QuickDraw.STP = {
		ammo = Ammo.Bullet.QD,
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

	sets.QuickDraw["Fire Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Ice Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Wind Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Earth Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Thunder Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Water Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Light Shot"] = set_combine( sets.QuickDraw.DMG, {})
	sets.QuickDraw["Dark Shot"] = set_combine( sets.QuickDraw.DMG, {
	    right_ring="Archon Ring",
	    head="Pixie Hairpin +1",
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Wild Card"] = {
	    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Random Deal"] = {
	    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	}
	sets.JA["Snake Eye"] = {
	    legs={ name="Lanun Trews +3", augments={'Enhances "Snake Eye" effect',}},
	}
	sets.JA["Fold"] = {}			-- Use gloves for bust
	sets.JA["Triple Shot"] = {}		-- Gear to be worn during Midshot
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}

	--Base Set used for all rolls
	sets.PhantomRoll = set_combine(sets.Idle, {
		main={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 2", priority=1}, -- +8 Effect and 60 sec Duration
		sub={ name="Nusku Shield", priority=2},
		range="Compensator", -- 20 sec Duration
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
		hands="Chasseur's Gants +1", --50 sec Duration
		neck="Regal Necklace", -- 20 sec Duration
		right_ring="Luzaf's Ring", -- 16 yalm range
		back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Snapshot"+10',}}, -- 30 sec Duration
	})

	sets.PhantomRoll['Fighter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Monk\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Healer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Wizard\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Warlock\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Rogue\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Gallant\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Chaos Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Beast Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Choral Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Hunter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Samurai Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Ninja Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Drachen Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Evoker\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Magus\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Corsair\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Puppet Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Dancer\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Scholar\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Bolter\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll["Caster\'s Roll"] = set_combine(sets.PhantomRoll, {}) -- {legs="Chas. Culottes +1"}
	sets.PhantomRoll["Tactician\'s Roll"] = set_combine(sets.PhantomRoll, {body="Chasseur's Frac +1"})
	sets.PhantomRoll["Allies\' Roll"] = set_combine(sets.PhantomRoll, {hands="Chasseur's Gants +1"})
	sets.PhantomRoll['Miser\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll["Courser\'s Roll"] = set_combine(sets.PhantomRoll, {feet="Chass. Bottes +1"})
    sets.PhantomRoll["Blitzer\'s Roll"] = set_combine(sets.PhantomRoll, {head="Chass. Tricorne +1"})

	sets.WS = {
		ammo=Ammo.Bullet.WS,
		head={ name="Herculean Helm", augments={'Accuracy+25','Weapon skill damage +4%','AGI+10','Attack+14',}},
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'DEX+7','Pet: Mag. Acc.+4','Weapon skill damage +10%','Accuracy+1 Attack+1',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck="Comm. Charm +2",
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	-- Accuracy set used in OffenseMode.PDL
	sets.WS.PDL = {}

	-- Accuracy set used in OffenseMode.ACC
	sets.WS.ACC = {}

	sets.WS.MAB = {
		ammo=Ammo.Bullet.MAB,
		head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit.hit rate+2','MND+1','Mag. Acc.+9','"Mag.Atk.Bns."+14',}},
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Herculean Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Mag. Acc.+14','"Mag.Atk.Bns."+13',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+28','CHR+2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Crematio Earring",
		left_ring="Dingir Ring",
		right_ring="Karieyh Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {

	})

	sets.WS["Leaden Salute"] = set_combine(sets.WS.MAB, {
		head="Pixie Hairpin +1",
		right_ring="Archon Ring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		waist="Svelt. Gouriz +1",   -- Changes based off elemental function
	})

	sets.WS['Aeolian Edge'] = set_combine(sets.WS.MAB, {
		Ammo.Bullet.MAB,
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

	sets.WS.MACC = set_combine(sets.WS.MAB, {
		ammo=Ammo.Bullet.MACC,
	})

	sets.WS.WSD = {
		ammo=Ammo.Bullet.WS,
		head={ name="Herculean Helm", augments={'Accuracy+25','Weapon skill damage +4%','AGI+10','Attack+14',}},
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'DEX+7','Pet: Mag. Acc.+4','Weapon skill damage +10%','Accuracy+1 Attack+1',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {

	})

	sets.WS["Last Stand"] = set_combine(sets.WS.WSD, {
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	})

	-- Uses Default WS set
	sets.WS["Hot Shot"] = {}
	sets.WS["Split Shot"] = {}
	sets.WS["Sniper Shot"] = {}
	sets.WS["Slug Shot"] = {}
	sets.WS["Numbing Shot"] = {}
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Requiescat"] = {}

	sets.Charm = {
	    main="Lament",
		range="Compensator",
		ammo=Ammo.Bullet.RA,
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
		back={ name="Camulus's Mantle", augments={'HP+60','HP+20','"Snapshot"+10',}},
	}

	sets.TreasureHunter = {
	    body={ name="Herculean Vest", augments={'Accuracy+5 Attack+5','Pet: INT+8','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		hands={ name="Herculean Gloves", augments={'Weapon Skill Acc.+18','Pet: "Store TP"+10','"Treasure Hunter"+1','Accuracy+14 Attack+14','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
	    feet={ name="Herculean Boots", augments={'"Dbl.Atk."+1','Pet: Accuracy+20 Pet: Rng. Acc.+20','"Treasure Hunter"+1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
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

	if spell.english == 'Fold' then
		equipSet = set_combine(equipSet, {hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}}})
    end

	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		return equipSet
	end

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
		return equipSet
	end

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

function user_file_unload()
	send_command('lua u autocor')
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