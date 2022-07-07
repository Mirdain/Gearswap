-- Groverton

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "16"
MacroBook = "6"
MacroSet = "1"

--Uses Items Automatically
AutoItem = true

--Upon Job change will use a random lockstyleset
Random_Lockstyle = true

--Lockstyle sets to randomly equip
Lockstyle_List = {16,17,18}

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('Tank','DT','TP','SB','Farm') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

state.WeaponMode:options('Aeneas/Gleti','Aeneas/Cento','Tauret/Cento','Karambit','Hepatizon Baghnakhs','Farm')
state.WeaponMode:set('Aeneas/Gleti')

-- Used when /RUN

--Modes for specific to /RUN
state.JobMode2:options('None','Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode2:set('None')

Runes = {
	Fire = {Name = "Ignis", Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"},
	Ice = {Name = "Gelus", Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"},
	Wind = {Name = "Flabra", Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"},
	Earth = {Name = "Tellus", Description = "[LIGHTNING RESISTANCE] and deals [EARTH DAMAGE]"},
	Lightning = {Name = "Sulpor", Description = "[WATER RESISTANCE] and deals [LIGHTNING DAMAGE]"},
	Water = {Name = "Unda", Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"},
	Light = {Name = "Lux", Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"},
	Dark = {Name = "Tenebrae", Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"},
	None = {Name = 'None', Description = "None"}
}

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	sets.Weapons = {}
	
	-- Daggers
	sets.Weapons['Terpsichore'] = {main="Terpsichore", sub="Gleti's Knife",}
	sets.Weapons['Twashtar'] = {main="Twashtar", sub="Gleti's Knife",}
	sets.Weapons['Aeneas/Gleti'] = {main="Aeneas", sub="Gleti's Knife",}
	sets.Weapons['Aeneas/Cento'] = {main="Aeneas", sub={ name="Centovente", augments={'TP Bonus +1000',}},}
	sets.Weapons['Tauret/Cento'] = {main="Tauret", sub={ name="Centovente", augments={'TP Bonus +1000',}},}
	sets.Weapons['Farm'] = {main="Wind Knife", sub="Joyeuse",}
	-- Hand-to-Hand
	sets.Weapons['Karambit'] = {main="Karambit",}
	sets.Weapons['Hepatizon Baghnakhs'] = {main="Hep. Baghnakhs +1",}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {}

	sets.Idle.Tank = {
		ammo="Yamarang",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Svelt. Gouriz +1",
		left_ear="Eabani Earring",
		right_ear="Infused Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},
	}

	sets.Idle.DT = sets.Idle.Tank

	sets.Idle.TP = {
		ammo="Staunch Tathlum +1",
    	head="Gleti's Mask",
    	body="Gleti's Cuirass",
    	hands="Gleti's Gauntlets",
    	legs="Gleti's Breeches",
    	feet="Gleti's Boots",
    	neck={ name="Loricate Torque +1", augments={'Path: A',}},
    	waist="Flume Belt +1",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Infused Earring",
    	left_ring="Chirich Ring +1",
    	right_ring="Chirich Ring +1",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
	sets.Idle.SB = sets.Idle.Tank
	
	sets.Idle.Farm = {
		ammo="Staunch Tathlum +1",
    	head="Nyame Helm",
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Nyame Gauntlets",
    	legs="Nyame Flanchard",
    	feet="Nyame Sollerets",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Silver Mog. Belt",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Tuisto Earring",
    	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    	right_ring="Moonlight Ring",
    	back="Moonlight Cape",}

	sets.Movement = {right_ring="Shneddick Ring",}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode = {}
	
	sets.OffenseMode.Tank = {
		ammo="Yamarang",
	    head="Malignance Chapeau",
	    body="Malignance Tabard",
	    hands="Turms Mittens +1",
		legs="Malignance Tights",
		feet={ name="Nyame Sollerets", augments={'Path: B',}}, -- Turms Leggings +1 (+5% Parry if Sub RUN AoE Tanking) OR Horos Toe Shoes +3 (Closed Position 1v1)
	    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	    waist="Svelt. Gouriz +1",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring="Ilabrat Ring",
	    right_ring="Regal Ring",
	    back={ name="Senuna's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Parrying rate+5%',}},
	}

	sets.OffenseMode.DT = {
		ammo="Yamarang",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    	feet="Malignance Boots",
    	neck="Anu Torque",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    	left_ear="Sherida Earring",
    	right_ear="Telos Earring",
    	left_ring="Gere Ring",
    	right_ring="Epona's Ring",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	-- Subtle Blow Cap at 50 and II at 25 for a Total of 75.
	-- DNC Subtle Blow = 20/50 w/ Traits. Need +30 in Gear for SBI Cap.
	-- Subtle Blow I: 50/50 | Subtle Blow II:05/25 | DT:50/50 | ACC: High
	sets.OffenseMode.SB = {
		ammo="Yamarang",
    	head="Malignance Chapeau",
    	body="Malignance Tabard",
    	hands="Malignance Gloves",
    	legs="Malignance Tights",
    	feet="Malignance Boots",
    	neck="Anu Torque",
    	waist="Reiki Yotai",
    	left_ear="Sherida Earring", -- SBII+5
    	right_ear="Telos Earring",
    	left_ring="Chirich Ring +1", -- SB+10
    	right_ring="Chirich Ring +1", -- SB+10
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.OffenseMode.Farm = {
		ammo="Staunch Tathlum +1",
    	head="Nyame Helm",
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Nyame Gauntlets",
    	legs="Nyame Flanchard",
    	feet="Nyame Sollerets",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Silver Mog. Belt",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Tuisto Earring",
    	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    	right_ring="Moonlight Ring",
    	back="Moonlight Cape",
	}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {}
	--Dual Wield
	sets.OffenseMode.DW = {}

	sets.Precast = {}
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'"Subtle Blow"+1','STR+3','"Treasure Hunter"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    	hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    	neck="Baetyl Pendant",
    	waist="Hachirin-no-Obi",
    	left_ear="Etiolation Earring",
    	right_ear="Enchntr. Earring +1",
    	right_ring="Rahab Ring",
	}

	sets.Enmity = {
		ammo="Sapience Orb",
		hands={ name="Horos Bangles +3", augments={'Enhances "Fan Dance" effect',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Kasiri Belt",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Vengeful Ring",
		right_ring="Petrov Ring",
		back={ name="Senuna's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Parrying rate+5%',}},
	}

	sets.Midcast = {}
	sets.Midcast.SIRD = {}
	sets.Midcast.Cure = {}
	sets.Midcast.Enhancing = {}
	sets.Midcast.Enfeebling = {}
	sets.Midcast["Stoneskin"] = {}
	-------------------------------------------------------------------------------
	---------------------------------  JA Sets  -----------------------------------
	-- When you combine with idle during JA's you'll get ~2 sec of high defense --- 
	-------------------- if not overwritten by specified gear ---------------------
	-------------------------------------------------------------------------------
	sets.JA = {}

	sets.JA["Trance"] = set_combine(sets.Idle.DT, {head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}}})
	sets.JA["Contradance"] = set_combine(sets.Idle.DT, sets.Enmity)
	sets.JA["Saber Dance"] = set_combine(sets.Idle.DT, {legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},})
	sets.JA["Fan Dance"] = set_combine(sets.Idle.DT, {hands={ name="Horos Bangles +3", augments={'Enhances "Fan Dance" effect',}},})
	sets.JA["No Foot Rise"] = set_combine(sets.Idle.DT, {body={ name="Horos Casaque +1", augments={'Enhances "No Foot Rise" effect',}},}) -- +3
	sets.JA["Presto"] = set_combine(sets.Idle.DT, sets.Enmity)
	sets.JA["Grand Pas"] = {}
	-------------------------------------------------------------------------------
	-- Flourishes provide buffs to the Dancer and debuffs to the target monster. --
	-------------------------------------------------------------------------------
	sets.Flourish = set_combine(sets.Idle.DT, {})
	-- Flourishes I : Monster Control
	sets.Flourish["Animated Flourish"] = set_combine(sets.Flourish, sets.Enmity)
	sets.Flourish["Desperate Flourish"] = {}
	sets.Flourish["Violent Flourish"] = set_combine(sets.Idle.DT, {body={ name="Horos Casaque +1", augments={'Enhances "No Foot Rise" effect',}},})
	-- Flourishes II : Skillchain Enhancers
	sets.Flourish["Reverse Flourish"] = set_combine(sets.Idle.DT, {hands="Macu. Bangles +1", back={ name="Toetapper Mantle", augments={'"Store TP"+1','"Dual Wield"+1','"Rev. Flourish"+28',}},})
	sets.Flourish["Building Flourish"] = {}
	sets.Flourish["Wild Flourish"] = {}
	-- Flourishes III : Weaponskill Buffs
	sets.Flourish["Climactic Flourish"] = set_combine(sets.Idle.DT, {head="Maculele Tiara +1",})
	sets.Flourish["Striking Flourish"] = set_combine(sets.Idle.DT, {body="Macu. Casaque +1",})
	sets.Flourish["Ternary Flourish"] = {}
	-------------------------------------------------------------------------------
	-- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
	-------------------------------------------------------------------------------
	sets.Waltz = {    
		ammo="Yamarang",
    	head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}},
    	body="Maxixi Casaque +3",
    	hands={ name="Horos Bangles +3", augments={'Enhances "Fan Dance" effect',}},
    	legs="Dashing Subligar",
    	feet="Maxixi Toe Shoes +3",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Chaac Belt",
    	left_ear="Enchntr. Earring +1",
    	right_ear="Cryptic Earring",
    	left_ring="Metamorph Ring +1",
    	right_ring="Carb. Ring +1",
    	back="Moonlight Cape",
	}
	sets.Waltz["Curing Waltz"] = sets.Waltz
	sets.Waltz["Curing Waltz II"] = sets.Waltz
	sets.Waltz["Curing Waltz III"] = sets.Waltz
	sets.Waltz["Curing Waltz IV"] = sets.Waltz
	sets.Waltz["Curing Waltz V"] = sets.Waltz
	sets.Waltz["Divine Waltz"] = sets.Waltz
	sets.Waltz["Divine Waltz II"] = sets.Waltz
	sets.Waltz["Healing Waltz"] = sets.Waltz
	-------------------------------------------------------------------------------
	---------- Samba duration can be increased using various equipment. -----------
	-------------------------------------------------------------------------------
	sets.Samba = set_combine(sets.Idle.DT, {
		head="Maxixi Tiara +3",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},})
	
	sets.Samba["Haste Samba"] = sets.Samba
	sets.Samba["Aspir Samba"] = sets.Samba
	sets.Samba["Aspir Samba II"] = sets.Samba
	sets.Samba["Drain Samba"] = sets.Samba
	sets.Samba["Drain Samba II"] = sets.Samba
	sets.Samba["Drain Samba III"] = sets.Samba
	-------------------------------------------------------------------------------
	----------- Jigs duration can be increased using various equipment. ----------- 
	-------------------------------------------------------------------------------
	sets.Jig = set_combine(sets.Idle.DT, {
		legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet="Maxixi Toe Shoes +3",})

	sets.Jig["Spectral Jig"] = sets.Jig
	sets.Jig["Chocobo Jig"] = sets.Jig
	sets.Jig["Chocobo Jig II"] = sets.Jig
	-------------------------------------------------------------------------------
	----- Step Accuracy depends on your melee hit rate (including your normal -----
	---- Accuracy equipment). All Steps tested have shown an innate 10 Accuracy --- 
	-- bonus, which can be further enhanced through various pieces of equipment, -- 
	----------------------------- merits, and Presto. -----------------------------
	-------------------------------------------------------------------------------
	sets.Step = {
		ammo="Yamarang",
    	head="Maxixi Tiara +3",
    	body="Maxixi Casaque +3",
    	hands="Maxixi Bangles +3",
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Horos Toe Shoes +1", augments={'Enhances "Closed Position" effect',}}, -- +3
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Tempus Fugit",
    	left_ear="Crep. Earring",
    	right_ear="Odr Earring",
    	left_ring="Chirich Ring +1",
    	right_ring="Chirich Ring +1",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
	sets.Step["Quickstep"] = sets.Step
	sets.Step["Box Step"] = sets.Step
	sets.Step["Stutter Step"] = sets.Step
	sets.Step["Feather Step"] = set_combine(sets.Step, {feet="Macu. Toe Shoes +1",})

	-- Sub /Sam
	sets.JA["Meditate"] = set_combine(sets.Idle.DT, sets.Enmity)
	sets.JA["Sekkanoki"] = set_combine(sets.Idle.DT, sets.Enmity)
	
	-- Sub /War
	sets.JA["Provoke"] = set_combine( sets.Enmity, { })
	sets.JA["Berserk"] = set_combine( sets.Enmity, { })
	sets.JA["Defender"] = set_combine( sets.Enmity, { })
	sets.JA["Aggressor"] = set_combine( sets.Enmity, { })
	
	-- Sub /Run
	sets.JA["Valiance"] = set_combine( sets.Enmity, { })
	sets.JA["Vallation"] = set_combine( sets.Enmity, { })
	sets.JA["Pflug"] = set_combine( sets.Enmity, { })
	sets.JA["Swordplay"] = set_combine( sets.Enmity, { })
		
	-- RUNE FENCER MAGIC SPELLS
	sets.Midcast["Stoneskin"] = {} -- ???

	-- Sub /Blu
	sets.JA["Chain Affinity"] = set_combine( sets.Enmity, { })
	sets.JA["Burst Affinity"] = set_combine( sets.Enmity, { })
	-- BLUE MAGIC SPELLS
	sets.Midcast["Cocoon"] = set_combine( sets.Enmity, { })
	sets.Midcast["Geist Wall"] = set_combine( sets.Enmity, { })
	sets.Midcast["Blank Gaze"] = set_combine( sets.Enmity, { })
	sets.Midcast["Soporific"] = set_combine( sets.Enmity, { })
	sets.Midcast["Sheep Song"] = set_combine( sets.Enmity, { })
	sets.Midcast["Cursed Sphere"] = set_combine( sets.Enmity, { })
	sets.Midcast["Jettatura"] = set_combine( sets.Enmity, { })	

	--Default WS set base
	sets.WS = {}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.Skillchain = {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Macu. Bangles +1",
		legs="Maxixi Tights +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		back="Sacro Mantle",
	}
	
	-- Dagger WS
	sets.WS["Wasp Sting"] = set_combine(sets.WS.Skillchain, {
		ammo="Yamarang",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Odr Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
	})
	sets.WS["Viper Bite"] = set_combine(sets.WS.Skillchain, {
		ammo="Yamarang",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Odr Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
	})
	sets.WS["Shadowstich"] = {
		ammo="Yamarang", -- CHR Ammo?
 	   	head="Maxixi Tiara +3",
 	   	body="Maxixi Casaque +3",
 	   	hands={ name="Horos Bangles +3", augments={'Enhances "Fan Dance" effect',}},
 	   	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
 	   	feet="Maxixi Toe Shoes +3",
 	   	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
 	   	waist="Chaac Belt", -- Better Belt Options?
 	   	left_ear="Enchntr. Earring +1",
 	   	right_ear="Odr Earring", -- CHR Earring ???
 	   	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
 	   	right_ring="Carb. Ring +1",
 	   	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}, -- CHR Cape JSE?
	}
	sets.WS["Gust Slash"] = set_combine(sets.WS.Skillchain,  {
		ammo="Yamarang",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Regal Ring",})
	sets.WS["Cyclone"] = set_combine(sets.WS.Skillchain,  {
		ammo="Yamarang",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Regal Ring",})
	sets.WS["Energy Steal"] = {
		ammo="Yamarang",
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    	legs={ name="Nyame Flanchard", augments={'Path: B',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Crep. Earring",
    	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    	right_ring="Stikini Ring +1",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Energy Drain"] = sets.WS["Energy Steal"]
	sets.WS["Dancing Edge"] = {    
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Maxixi Bangles +3",
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Odr Earring",
    	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    	right_ring="Regal Ring",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Shark Bite"] = {    
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Maxixi Bangles +3",
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Odr Earring",
    	left_ring="Ilabrat Ring",
    	right_ring="Regal Ring",
    	back="Sacro Mantle",
	}
	sets.WS["Evisceration"] = {    
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Maxixi Bangles +3",
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Odr Earring",
    	left_ring="Ilabrat Ring",
    	right_ring="Regal Ring",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Aeolian Edge"] = {
		ammo="Yamarang",
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Friomisi Earring",
    	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    	right_ring="Regal Ring",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Rudra's Storm"] = {    
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Nyame Helm", augments={'Path: B',}},
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Maxixi Bangles +3",
    	legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
    	feet={ name="Nyame Sollerets", augments={'Path: B',}},
    	neck="Fotia Gorget",
    	waist="Fotia Belt",
    	left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Odr Earring",
    	left_ring="Ilabrat Ring",
    	right_ring="Regal Ring",
    	back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Exenterator"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	    head={ name="Nyame Helm", augments={'Path: B',}},
	    body={ name="Nyame Mail", augments={'Path: B',}},
	    hands="Maxixi Bangles +3",
	    legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},
	    feet={ name="Nyame Sollerets", augments={'Path: B',}},
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
	    right_ear="Sherida Earring",
	    left_ring="Ilabrat Ring",
	    right_ring="Regal Ring",
	    back={ name="Senuna's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Parrying rate+5%',}},
	}

	-- Hand to Hand WS
	sets.WS["Combo"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Fotia Gorget",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Shoulder Tackle"] = {}
	sets.WS["Backhand Blow"] = {}
	sets.WS["Spinning Attack"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Fotia Gorget",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Asuran Fists"] = {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	    head={ name="Gleti's Mask", augments={'Path: A',}},
	    body={ name="Gleti's Cuirass", augments={'Path: A',}},
	    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
	    legs={ name="Gleti's Breeches", augments={'Path: A',}},
	    feet={ name="Gleti's Boots", augments={'Path: A',}},
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Sherida Earring",
	    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	    left_ring="Gere Ring",
	    right_ring="Regal Ring",
	    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	} 	
	-- Only if Karambit Weapon Equipt
	sets.WS["Dragon Kick"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Fotia Gorget",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	-- Only if Hepatizon Baghnakhs NQ/+1 Weapon Equipt
	sets.WS["One Inch Punch"] = {} 	-- Must Sub MNK
	sets.WS["Raging Fists"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Fotia Gorget",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.WS["Tornado Kick"] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Meg. Chausses +2",
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Fotia Gorget",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.TreasureHunter = {
		head={ name="Herculean Helm", augments={'"Subtle Blow"+1','STR+3','"Treasure Hunter"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		waist="Chaac Belt",}
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
--Function is called when a lua is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if player.sub_job == 'SAM' and player.sub_job_level > 8 then
		if not buffactive['Meditate'] and ja_recasts[134] == 0 then
			buff = "Meditate"
		end
	end

	if player.sub_job == 'WAR' and player.sub_job_level > 8 then
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

function pet_change_custom(pet,gain)
	equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])

	return equipSet
end