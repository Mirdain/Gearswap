
--Yavanna

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "11"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA')
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Seraph Strike','Black Halo','Asclepius','Unlocked')
state.WeaponMode:set('Unlocked')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

-- Balance 2100 HP / 1500 MP
function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Seraph Strike'] = {
		main="Daybreak",
	}

	sets.Weapons['Black Halo'] = {
		main="Maxentius",
		sub="C. Palug Hammer",
	}

	sets.Weapons['Asclepius'] = {
		main="Asclepius",
	}

	sets.Weapons['Shield'] = {
		sub="Genmei Shield",
	}

	sets.Weapons['Sleep'] ={
		main="Lorg Mor",
	}

	sets.Weapons['Unlocked'] = {}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Bunzi's Hat", augments={'Path: A',}},
		body="Ebers Bliaut +3",
		hands={ name="Bunzi's Gloves", augments={'Path: A',}},
		legs="Ebers Pant. +3",
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +2 Refresh
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		right_ear={ name="Etiolation Earring", priority=2}, -- 1
		left_ring={name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
    }

	-- 'TP','PDL','ACC','DT','PDT','MEVA'
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {
		main={ name="Asclepius", augments={'Path: C',}, priority=5},
		body={ name="Adamantite Armor", priority=4},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1},
		waist={ name="Plat. Mog. Belt", priority=2},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=3},
		right_ear="Hearty Earring",
	})
	sets.Idle.PDT = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle.DT, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})
	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
	    waist="Embla Sash", -- +3 Submlimation when active
	})
	-- Set to swap out when MP is low
	sets.Idle.Refresh = set_combine(sets.Idle, {
		body="Ebers Bliaut +3",
	    feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
	})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- Movement Gear
	sets.Movement = {
		feet="Herald's Gaiters",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		ammo="Hasty Pinion +1",
		head="Bunzi's Hat",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Lehko's Ring",
		right_ring={name="Chirich Ring +1", bag="wardrobe2"},
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })

	-- ===================================================================================================================
	--		sets.Precast
	-- ===================================================================================================================

	sets.Precast = {}

	-- Used for Magic Spells (Cap 80%)
	sets.Precast.FastCast = {
		main="C. Palug Hammer",
		sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head="Ebers Cap +3",
		body="Zendik Robe",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" spellcasting time -5%',}},
		legs={ name="Pinga Pants +1", priority=1},
		feet="Volte Gaiters",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist={ name="Plat. Mog. Belt", priority=2},
		left_ear={ name="Tuisto Earring", priority=3},
		right_ear={ name="Etiolation Earring", priority=4},
		left_ring="Lehko's Ring",
		right_ring="Weather. Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	} -- 78% FC 26% 2800 HP

	-- Used for Cure cast
	-- 3k HP, 80% Cast Speed, 25% gear haste
	sets.Precast.Cure = set_combine(sets.Precast.FastCast, {
		ammo="Impatiens",
		head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
		body="Pinga Tunic +1",
		legs="Ebers Pant. +3",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1},
	})

	-- Used for Enhancing cast
	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, {

	})

	sets.Precast.Healing = set_combine(sets.Precast.FastCast, {
		body="Pinga Tunic +1",
		legs="Ebers Pant. +3",
	})

	-- ===================================================================================================================
	--		sets.Midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, sets.Idle.DT, { })

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Asclepius", augments={'Path: C',}, priority=4},
		sub="Ammurapi Shield",
		ammo="Psilomene",
		head="Ebers Cap +3",
		body="Adamantite Armor",
		hands="Kaykaus Cuffs +1",
		legs="Ebers Pant. +3",
		feet="Kaykaus Boots +1",
		neck="Clr. Torque +2",
		waist={ name="Plat. Mog. Belt", priority=1},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2},
		right_ear="Ebers Earring +1",
		left_ring="Lehko's Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
    }

	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, { })

	-- For Cura - foucs on DT
	sets.Midcast.Cura = set_combine(sets.Midcast.Cure, {body="Theo. Bliaut +3",})

	-- Enhancing Skill

	-- Used for base duration
	sets.Midcast.Enhancing = {
		main={ name="Asclepius", augments={'Path: C',}, priority=5},
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Adamantite Armor", priority=4},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1},
		waist={ name="Plat. Mog. Belt", priority=2},
		left_ear="Mimir Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	}
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {});

	-- Caps at 500 for bar spells
	--'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra','Barsilencera','Barsleep','Barpoison','Barparalyze','Barblind','Barvirus','Barpetrify','Baramnesia','Barsilence'
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {
		ammo="Staunch Tathlum +1",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +3",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Ebers Earring +1",
		left_ring="Lehko's Ring",

	})

	--'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzara','Baraera','Barstonra','Barthundra','Barwatera'
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing.Status, {
		main="Beneficus",
	})

	-- This caps at 500 for Gain spells
	--'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Enblizzard','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, { })

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Asclepius", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",
		body="Theo. Bliaut +3",
		hands="Ebers Mitts +3",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		feet="Theo. Duckbills +3",
		neck="Null Loop",
		waist={ name="Obstin. Sash", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Ebers Earring +1",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back="Null Shawl",
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})

	 -- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, { })

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, { 
		left_ring="Kishar Ring",
		hands="Regal Cuffs",
		waist={ name="Obstin. Sash", augments={'Path: A',}},
	})

	sets.Midcast.Phalanx = set_combine(sets.Midcast.Enhancing.Skill, { })
	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})
	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast["Cursna"] = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Hasty Pinion +1",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Ebers Bliaut +3",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
		legs="Th. Pant. +3",
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
		waist={ name="Plat. Mog. Belt", priority=1 },
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Ebers Earring +1",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10','Damage taken-5%',}},
	}

	sets.Midcast["Erase"] = set_combine(sets.Midcast, {
		main="Yagrush",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
	})

	sets.Midcast["Esuna"] = set_combine(sets.Midcast, {
		main="Asclepius",
	})

	sets.Midcast["Silena"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Poisona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Stona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Blindna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Viruna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +3",
		main="Yagrush"
	})

	sets.Midcast["Auspice"] = set_combine(sets.Midcast, {
		feet="Ebers Duckbills +3",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		main="Vadose Rod",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head="Chironic Hat",
		body="Adamantite Armor",
		hands="Regal Cuffs",
		legs="Shedir Seraweels",
		feet="Theo. Duckbills +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist={ name="Plat. Mog. Belt", priority=1 },
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Hydrocera",
		head="Inyanga Tiara +2",
		body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +3",
		legs="Th. Pant. +3",
		feet={ name="Bunzi's Sabots", augments={'Path: A',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist={ name="Plat. Mog. Belt", priority=1 },
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear="Etiolation Earring",
		left_ring="Lehko's Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		main={ name="Asclepius", augments={'Path: C',}},
		sub="Genmei Shield",
		ammo="Psilomene",
		head="Null Masque",
		body="Adamantite Armor",
		hands="Ebers Mitts +3",
		legs="Shedir Seraweels",
		feet="Ebers Duckbills +3",
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
		right_ear="Tuisto Earring",
		left_ring="Stikini Ring +1",
		right_ring="Etana Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.Midcast.Refresh = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {
		body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},
	}
	sets.JA["Divine Seal"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Devotion"] = {
		head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
	}
	sets.JA["Afflatus Solace"] = {}
	sets.JA["Afflatus Misery"] = {}
	sets.JA["Sacrosanctity"] = {}
	sets.JA["Asylum"] = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {
	    ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Ilabrat Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {}

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
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}
	if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
		add_to_chat(8,'You are not in a stance')
	end
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	local buff = 'None'
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	local buff = 'None'
	return buff
end

function pet_change_custom(pet,gain)
	local equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end