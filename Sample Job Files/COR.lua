--Relyk

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "18"
MacroBook = "18"
MacroSet = "1"

--Modes for specific to Corsair
state.CorsairMode = M{['description']='Corsair Damage Mode'}
state.CorsairMode:options('TP Melee - WS Melee','TP Melee - WS Ranged (Physical)','TP Melee - WS Ranged (Magic)','TP Ranged - WS Ranged (Physical)','TP Ranged - WS Ranged (Magic)')
state.CorsairMode:set('TP Melee - WS Melee')

-- load addons
send_command('lua l autocor')

--Command to bind to the f9 key
send_command('bind f9 gs c dpsmode')
--Log Message about what the key does
add_to_chat(8,'[F9] - DPS Mode')

--Set default mode to DT
state.OffenseMode:set('DT')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 79

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Main weapon
	sets.Main = {}
	sets.Main.Ranged = {main={ name="Rostam", augments={'Path: A'}}}
	sets.Main.Dual_Wield_Melee = {main="Naegling"}
	sets.Main.Dual_Wield_Ranged = {main={ name="Rostam", augments={'Path: A'}}}

	-- Off hand Weapon
	sets.Sub = {}
	sets.Sub.Ranged = {sub="Nusku Shield"}
	sets.Sub.Dual_Wield_Melee = {sub="Blurred Knife +1"}
	sets.Sub.Dual_Wield_Ranged = {sub={ name="Rostam", augments={'Path: C'}}}

	-- Ranged Weapon
	sets.Range = {}
	sets.Range.Physical = {range="Fomalhaut"}
	sets.Range.Magical = {range="Death Penalty"}

	-- Ammo Selection
	Ammo.Bullet.RA = "Chrono Bullet"	-- TP Ammo
	Ammo.Bullet.WS = "Chrono Bullet"	-- Physical Weaponskills
	Ammo.Bullet.MAB = "Chrono Bullet"	-- Magical Weaponskills
	Ammo.Bullet.MACC = "Chrono Bullet"	-- Magic Accuracy
	Ammo.Bullet.QD = "Chrono Bullet"	-- Quick Draw

	-- Standard Idle set with -DT,Refresh,Regen with NO movement gear
	sets.Idle = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm",
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear="Sanare Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

	sets.Movement = {
		legs="Carmine Cuisses +1",
	}

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
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10/0
		body="Oshosi Vest +1", -- 14/0
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet="Meg. Jam. +2", -- 10/0
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Ilabrat Ring", priority=3},
		right_ring={ name="Regal Ring", priority=4},
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
    } -- Totals 66/24

	-- Flurry - 45 Snapshot Needed
	sets.Precast.RA.Flurry = {
		ammo=Ammo.Bullet.RA,
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10/0
		body="Laksa. Frac +3", -- 0/20
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet="Meg. Jam. +2", -- 10/0
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Ilabrat Ring", priority=3},
		right_ring={ name="Regal Ring", priority=4},
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
    } -- Totals 52/54

	-- Flurry II - 30 Snapshot Needed
	sets.Precast.RA.Flurry_II = {
		ammo=Ammo.Bullet.RA,
		head="Chass. Tricorne +1", -- 0/14
		body="Laksa. Frac +3", -- 0/20
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
		feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}}, -- 0/10
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={ name="Ilabrat Ring", priority=3},
		right_ring={ name="Regal Ring", priority=4},
		neck={ name="Comm. Charm +2", augments={'Path: A',}}, -- 4/0
		waist="Yemaya Belt", -- 0/10
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 10/0
    } -- Totals 32/78

	-- Fast Cast for Magic
	sets.Precast.FastCast = {}

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
		ammo=Ammo.Bullet.MAB,
	    feet="Chass. Bottes +1",
	}
	sets.QuickDraw.STP = {
		ammo=Ammo.Bullet.QD,
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

	-- Quick Draw 
	sets.Midcast.QuickDraw = {}
	sets.Midcast.QuickDraw["Fire Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Ice Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Wind Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Earth Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Thunder Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Water Shot"] = sets.QuickDraw.STP
	sets.Midcast.QuickDraw["Light Shot"] = sets.QuickDraw.ACC
	sets.Midcast.QuickDraw["Dark Shot"] = sets.QuickDraw.ACC

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
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Brutal Earring",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--The following sets augment the base TP set above
	sets.TP.DW = {
		waist="Reiki Yotai",
		right_ear="Suppanomimi",
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
	    neck="Loricate Torque +1",
		left_ring="Defending Ring",
	}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	
	}

	sets.WS = {
		ammo=Ammo.Bullet.WS,
	}

	sets.WS.ACC = {}

	sets.WS.WSD = {
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
	sets.WS["Last Stand"] = {
		range="Fomalhaut",
		ammo="Chrono Bullet",
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs="Herculean Trousers",
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS["Wildfire"] = {}
	sets.WS["Leaden Salute"] = {
		range="Fomalhaut",
		ammo="Chrono Bullet",
		head="Pixie Hairpin +1",
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+18','Weapon skill damage +5%','STR+2','Mag. Acc.+15',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','Weapon skill damage +4%','Mag. Acc.+4','"Mag.Atk.Bns."+15',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Svelt. Gouriz +1",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Archon Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Requiescat"] = {}


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
	if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}
	if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
		if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
		if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
		if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
		if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
		if DualWield == true then
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Melee,sets.Sub.Dual_Wield_Melee,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Dual_Wield_Ranged,sets.Sub.Dual_Wield_Ranged,sets.Range.Magical)
		end
	else
		if state.CorsairMode.value == 'TP Melee - WS Melee' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Melee - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Physical)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Physical)
		elseif state.CorsairMode.value == 'TP Ranged - WS Ranged (Magic)' then
			equipSet = set_combine(equipSet,sets.Main.Ranged,sets.Sub.Ranged,sets.Range.Magical)
		end
	end
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)
	if command == 'dpsmode' then
		for i,v in ipairs(state.CorsairMode) do
			if state.CorsairMode.value == v then
				if state.CorsairMode.value ~= state.CorsairMode[#state.CorsairMode] then
					state.CorsairMode:set(state.CorsairMode[i+1])
				else
					state.CorsairMode:set(state.CorsairMode[1])
				end
				info('Mode: ['..state.CorsairMode.value..']')
				equip(set_combine(choose_set(),choose_set_custom()))
				return
			end
		end
	end
end

function user_file_unload()
	send_command('lua u autocor')
end