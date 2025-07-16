
--Luthien

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "9"
MacroBook = "9"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Modes for specific to bard
state.WeaponMode:options('Mordant Rime','Aeolian Edge','Shining Strike','Shining Blade','Savage Blade','Eviceration','Rudra\'s Storm','Staff')
state.WeaponMode:set('Mordant Rime')

--Default to DT Mode
state.OffenseMode:set('TP')

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Mordant Rime'] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Crepuscular Knife",
	}

	sets.Weapons['Aeolian Edge'] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Gleti's Knife", augments={'Path: A',}},
	}

	sets.Weapons['Shining Strike'] = {
		main="Daybreak",
		sub="Crepuscular Knife",
	}

	sets.Weapons['Shining Blade'] = {
		main="Naegling",
		sub="Daybreak",
	}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Staff'] = {
		main="Xoanon",
		sub="Alber Strap",
	}

	sets.Weapons['Eviceration'] = {
		main='Tauret',
		sub="Crepuscular Knife",
	}

	sets.Weapons['Rudra\'s Storm'] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Crepuscular Knife",
	}

	sets.Weapons.Songs = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
	}

	sets.Weapons.Shield = { sub="Genmei Shield",}

	sets.Weapons.Sleep = { range="Loughnashade",}

	sets.Weapons.Songs.Precast = {}
	sets.Weapons.Songs.Midcast = {}

	-- Instruments to use
	Instrument = {}
	Instrument.Count = { name="Daurdabla" }
	Instrument.Potency = { name="Gjallarhorn" }
	Instrument.Pianissimo = { name="Gjallarhorn" } -- Possible swap to Miracle Cheer
	Instrument.Ballad = { name="Miracle Cheer" } -- Possible swap to Miracle Cheer
	Instrument.Honor = { name="Marsyas" }
	Instrument.Aria = { name="Loughnashade" }
	Instrument.AOE_Sleep = { name="Daurdabla" }
	Instrument.Idle = { name="Linos", augments={'Mag. Evasion+15','"Waltz" potency +4%','HP+20',} }
	Instrument.TP = { name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',} }
	Instrument.Mordant = { name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','CHR+8',} }
	Instrument.QuickMagic = { name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%','HP+20',} }
	Instrument.FastCast = { name="Linos", augments={'Mag. Evasion+15','"Fast Cast"+6','HP+20',} }
	Instrument.WS = {  name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',} }
	Instrument.MAB = {  name="Linos", augments={'Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',} }

	-- HP/MP Balancing Goal
	-- HP: 2200 MP: 550 

	-- Standard Idle set
	sets.Idle = {
		range=Instrument.Idle,  -- 4/0
		head="Fili Calot +3", -- 11/11
		body="Adamantite Armor", -- 20/20
		hands="Bunzi's Gloves", -- 8/8 
		legs="Fili Rhingrave +3", -- 13/13
		feet="Fili Cothurnes +3", -- 18% Movement
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/3
		right_ear="Sanare Earring",
		left_ring="Warden's Ring",
		right_ring="Shadow Ring",
		back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Waltz" potency +10%','Mag. Evasion+15',}},
    } -- PDT 60%%, MDT 56%

	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- These are used based off your OffenseMode
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {})

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = { feet="Fili Cothurnes +3"}

	-- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.Subtle_Blow = {
		neck="Bathy Choker +1",
		right_ring={ name="Chirich Ring +1", bag="wardrobe2"},
	}

	--The following sets augment the base TP set 
	--Only 9 is needed with haste samba and /DNC.  /NIN needs 11 without samba and none with samba
	sets.DualWield = {
		waist="Reiki Yotai",
		--left_ear="Eabani Earring",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		range=Instrument.TP,
		head={ name="Bunzi's Hat", augments={'Path: A',}},
		body="Ashera Harness",
		hands={ name="Bunzi's Gloves", augments={'Path: A',}},
		legs="Volte Tights",
		feet="Nyame Sollerets",
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1", -- swapped out with Dual Wield
		left_ear="Telos Earring",
		right_ear="Balder Earring +1",
		left_ring="Lehko's Ring",
		right_ring={ name="Chirich Ring +1", bag="wardrobe2", priority=1},
		back="Null Shawl",
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		legs="Fili Rhingrave +3",
		right_ring={ name="Moonlight Ring", bag="wardrobe2", priority=1},
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {})

	--This set is used when OffenseMode is PDL and Enaged
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
		left_ring="Sroda Ring",
	})

	--This set is used when OffenseMode is PDL and Enaged
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT, {
		waist="Carrier's Sash",
	})

	--This set is used when OffenseMode is SB and Enaged (Augments the TP base set)
	sets.OffenseMode.SB = set_combine(sets.OffenseMode.DT, {})

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		range=Instrument.QuickMagic, -- 4 Quick Magic
		head={ name="Bunzi's Hat", augments={'Path: A',}}, -- 10
		body="Inyanga Jubbah +2", -- 14
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs="Volte Brais", -- 9
		feet="Fili Cothurnes +3", -- 13
		neck="Voltsurge Torque", -- 4
		waist="Witful Belt", -- 3 3 Quick Magic
		left_ear="Etiolation Earring", -- 1
		right_ear={ name="Tuisto Earring", priority=1,},
		left_ring="Kishar Ring", -- 4
		right_ring="Weather. Ring", -- 5 3 Quick Magic
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 81 FC and 10 Quick Magic

	-- Used for Songs (now easy to max Fast Cast so not needed)
	sets.Precast.Songs = {}
	-- Used for "-Cure casting time"
	sets.Precast.Cure = {}
	-- Used for "-Enhancing casting time"
	sets.Precast.Enhancing = {}
	-- Used for "Utsusemi casting time"
	sets.Precast.Utsusemi = {}
	-- Used for "Blue Magic casting time"
	sets.Precast.Blue_Magic = {}

	-- Default song duration / strength
	sets.Midcast = set_combine(sets.Idle, {
		head="Fili Calot +3",
		body="Fili Hongreline +3",
		hands="Fili Manchettes +3",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2}, -- 7/-1
		right_ring="Defending Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		feet="Brioso Slippers +3",
	})

	-- Reduce Durations for Dummy songs (Ballad is lowest duration)
	sets.Midcast.DummySongs = set_combine(sets.Idle, {})

	-- Cure Set
	sets.Midcast.Cure = {
		range=Instrument.FastCast, 
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11/2
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 0/6
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}}, -- 11/2
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11/2
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11/2
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Mendi. Earring", -- 5/0
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Naji's Loop", -- 1/1
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    } -- 50% Cure Potency / 15% Cure Potency II

	sets.Midcast.Regen = {}
	sets.Midcast.Refresh = {}

	-- Base set for duration
	sets.Midcast.Enhancing = {
		sub="Ammurapi Shield",
		range=Instrument.FastCast,
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}
	sets.Midcast.Enhancing.Status = {}
	sets.Midcast.Enhancing.Skill = {}
	sets.Midcast.Enhancing.Gain = {}

	-- Curaga Set (different rules than cure)
	sets.Midcast.Curaga = sets.Midcast.Cure

	-- Cursna Set
	sets.Midcast.Cursna = set_combine (sets.Midcast.Cure, {
	    hands="Inyan. Dastanas +2",
	    left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		waist="Bishop's Sash",
	})

	sets.Midcast.Divine = {}
	sets.Midcast.Phalanx = {}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		sub="Ammurapi Shield",
		range=Instrument.Potency,
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Inyan. Dastanas +2",
		legs="Brioso Cannions +3",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist={ name="Obstin. Sash", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Crep. Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe2"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Enfeebling.MACC = {}
	sets.Midcast.Enfeebling.Potency = {}
	sets.Midcast.Enfeebling.Duration = {}

	-- Bard Specific Sets

	-- Max duration
	sets.Midcast.Lullaby = set_combine(sets.Midcast.Enfeebling, {
		range=Instrument.Honor,
		body="Fili Hongreline +3",
		hands="Brioso Cuffs +3",
		legs="Inyanga Shalwar +2",
	})

	sets.Midcast.Finale = {}
	sets.Midcast.Requiem = {}
	sets.Midcast.Elegy = {}
	sets.Midcast.Prelude = {}
	sets.Midcast.Madrigal = {head="Fili Calot +3"}
    sets.Midcast.Minuet = {body="Fili Hongreline +3"}
    sets.Midcast.March = {hands="Fili Manchettes +3"}
    sets.Midcast.Ballad = {legs="Fili Rhingrave +3"}
    sets.Midcast.Scherzo = {feet="Fili Cothurnes +3"}
    sets.Midcast.Mazurka = {}
    sets.Midcast.Paeon = {head="Brioso Roundlet +3"}
    sets.Midcast.Threnody = {body="Mou. Manteel +1"}
    sets.Midcast.Minne = {legs="Mou. Seraweels +1"}
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {hands="Mousai Gages +1"}
    sets.Midcast.Etude = {head="Mousai Turban +1"}
	sets.Midcast.Dirge = {}
	sets.Midcast.Sirvente = {}
	sets.Midcast.Aria = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Nightingale"] = {feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}}}
	sets.JA["Troubadour"] = {body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}}}
	sets.JA["Soul Voice"] = {legs={ name="Bihu Cannions +3", augments={'Enhances "Soul Voice" effect',}}}
	sets.JA["Tenuto"] = {}
	sets.JA["Marcato"] = {}
	sets.JA["Clarion"] = {}
	sets.JA["Pianissimo"] = {}

	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, { })
	sets.Step = set_combine(sets.Idle.DT, {})
	sets.Samba = set_combine(sets.Idle.DT, {})
	sets.Waltz = set_combine(sets.Idle.DT, {
		range=Instrument.Idle, -- 4
		legs="Dashing Subligar", -- 10
		back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Waltz" potency +10%','Mag. Evasion+15',}}, --10
	}) -- 24% Potency

	--Default WS set base
	sets.WS = {
		range=Instrument.WS,
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear="Regal Earring",
		right_ring="Sroda Ring",
		left_ring="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	-- Equipment to augment the Melee WS for Physical Damage Limit (Capped Attack)
	sets.WS.PDL = set_combine(sets.WS, {
		right_ring="Sroda Ring",
	})

	--The following sets augment the WS base set
	sets.WS.WSD = set_combine(sets.WS, {
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	})

	sets.WS.MAB = set_combine(sets.WS, {
		range=Instrument.MAB,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		back={ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
	})

	sets.WS.ACC = set_combine(sets.WS, {})

	sets.WS.MEVA = set_combine(sets.WS, {
	    neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})

	sets.WS.CRIT = set_combine(sets.WS, {
		neck="Fotia Gorget",
		waist="Fotia Belt",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	})

	sets.WS.SB = sets.Subtle_Blow

	sets.WS["Savage Blade"] =  set_combine(sets.WS.WSD, {
		right_ring="Sroda Ring",
	})

	sets.WS["Mordant Rime"] = set_combine(sets.WS, {
		range=Instrument.Mordant,
	})

	sets.WS["Eviceration"] = sets.WS.CRIT

	sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
	})

	sets.WS["Burning Blade"] = sets.WS.MAB
	sets.WS["Shining Blade"] = set_combine( sets.WS.MAB, {
		right_ring="Weather. Ring",
	})
	sets.WS["Shining Strike"] = set_combine( sets.WS.MAB, {
		right_ring="Weather. Ring",
	})

	sets.WS["Shell Crusher"] = set_combine( sets.WS.WSD, {
		right_ring="Sroda Ring",
	})

	sets.TreasureHunter = {
		body="Volte Jupon",
		legs="Volte Hose",
		waist="Chaac Belt",
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

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

-- Function is called when the job lua is unloaded
function user_file_unload()

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