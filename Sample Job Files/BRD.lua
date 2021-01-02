
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "9"
MacroBook = "9"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

UI_Name = 'DPS'

--Modes for specific to Corsair
state.JobMode = M{['description']='Corsair Damage Mode'}
state.JobMode:options('Mordant Rime','Savage Blade', 'Aeolian Edge', 'Rudra\'s Storm', 'Eviceration')
state.JobMode:set('Mordant Rime')

elemental_ws = S{'Aeolian Edge'}

--Default to DT Mode
state.OffenseMode:set('TP')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)
send_command('bind f10 gs c songbuff')


function get_sets()

	--Set the weapon options.  This is set below in job customization section
	Weapons = {}

	Weapons['Mordant Rime'] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Ternion Dagger +1", augments={'Path: A',}},
	}

	Weapons['Savage Blade'] = {
		main="Naegling",
		sub={ name="Ternion Dagger +1", augments={'Path: A',}},
	}

	Weapons['Aeolian Edge'] = {
		main="Tauret",
		sub="Levante Dagger",
	}

	Weapons['Rudra\'s Storm'] = {
	    main="Tauret",
		sub="Naegling",
	}

	Weapons.Songs = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
	}

	Weapons.Songs.DualWield = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
	}

	Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Instruments to use
	Instrument ={}
	Instrument.Count = { name="Daurdabla" }
	Instrument.Potency = { name="Gjallarhorn" }
	Instrument.Honor = { name="Marsyas" }
	Instrument.AOE_Sleep = { name="Daurdabla" }
	Instrument.Idle = { name="Linos", augments={'Mag. Evasion+15','Phys. dmg. taken -4%','HP+20',} }
	Instrument.TP = { name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',} }
	Instrument.Mordant = { name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','CHR+8',} }
	Instrument.QuickMagic = { name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%','HP+20',} }
	Instrument.FastCast = { name="Linos", augments={'Mag. Evasion+15','"Fast Cast"+6','HP+20',} }
	Instrument.Aeolian = {  name="Linos", augments={'Mag. Acc.+10 "Mag.Atk.Bns."+10','Weapon skill damage +3%','INT+8',} }

	-- HP/MP Balancing Goal
	-- HP: 2200 MP: 550

	-- Standard Idle set
	sets.Idle = {
		range=Instrument.Idle,  -- 4/0
		head="Inyanga Tiara +2", -- 0/5
		body="Inyanga Jubbah +2", -- 0/8
		hands="Mousai Gages +1",
		legs="Brioso Cannions +3", -- 8/8
		feet="Inyan. Crackows +2", -- 0/3
		neck="Loricate Torque +1", -- 6/6
		waist="Flume Belt +1", -- 4/0
		left_ear="Sanare Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=4}, -- 3/5
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2}, -- 7/-1
		right_ring="Defending Ring",-- 10/10
		back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Phys. dmg. taken-10%',}, priority=3}, -- 10/0
    } -- PDT 49%, MDT 39%

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = { feet="Fili Cothurnes +1"}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		range=Instrument.TP,
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1", -- swapped out with Dual Wield
		left_ear="Brutal Earring", -- swapped out with Dual Wield
		right_ear="Telos Earring",
		left_ring={ name="Moonlight Ring",  bag="wardrobe1", priority=2},
		right_ring={ name="Moonlight Ring",  bag="wardrobe3", priority=1},
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1}, -- 3/5
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
	
	})

	--The following sets augment the base TP set
	sets.DualWield = {
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
	}

	sets.Precast = {}

	-- Used to Songs
	sets.Precast.Songs = {
		range=Instrument.FastCast, -- 6
		head="Fili Calot +1", -- 14
		body="Brioso Justau. +3", -- 15
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}, priority=7}, -- 12
		legs={ name="Kaykaus Tights", augments={'INT+10','"Mag.Atk.Bns."+15','Enmity-5',}, priority=2}, -- 6
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%',}}, -- 13
		neck={ name="Dualism Collar +1", priority=1},
		waist="Embla Sash", -- 5
		left_ear={ name="Etiolation Earring", priority=3}, -- 1
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=6},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=5},
		right_ring={ name="Moonlight Ring",  bag="wardrobe3", priority=4},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 82% FC

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		range=Instrument.FastCast, -- 6
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}, priority=4}, -- 10
		body="Inyanga Jubbah +2", -- 14
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}}, -- 7
		legs={ name="Kaykaus Tights", augments={'INT+10','"Mag.Atk.Bns."+15','Enmity-5',}, priority=3}, -- 6
		feet="Volte Gaiters", -- 6
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=2},
		waist="Embla Sash", -- 5
		left_ear={ name="Etiolation Earring", priority=1}, -- 1
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=5},
		left_ring="Kishar Ring", -- 4
		right_ring="Weather. Ring", -- 5
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 74 FC

	-- Used for "-Cure casting time"
	sets.Precast.Cure = {}

	-- Used for Raises and Cure spells
	sets.Precast.QuickMagic = {
		range=Instrument.QuickMagic, -- 4
		waist="Witful Belt", -- 3
		right_ring="Weather. Ring", -- 3
	} -- 10% Quick Magic

	-- Default song duration / strength
	sets.Midcast = {
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		right_ear={ name="Etiolation Earring", priority=1}, -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2}, -- 7/-1
		right_ring="Defending Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	-- Reduce Durations for Dummy songs (Ballad is lowest duration)
	sets.Midcast.DummySongs = set_combine(sets.Midcast, {feet="Volte Gaiters"})

	-- Cure Set
	sets.Midcast.Cure = {
		range=Instrument.FastCast, 
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}, -- 10    UPGRADE
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}}, -- 6
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}}, -- 11
		legs={ name="Kaykaus Tights", augments={'INT+10','"Mag.Atk.Bns."+15','Enmity-5',}}, -- 10  UPGRADE
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}}, -- 11
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1},
		waist="Tempus Fugit",
		left_ear="Mendi. Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=3},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    } -- 53% Cure Potency / 8% Cure Potency II

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
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1}, -- 7/-1
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Curaga Set (different rules than cure)
	sets.Midcast.Curaga = sets.Midcast.Cure

	-- Cursna Set
	sets.Midcast.Cursna = {
	    hands="Inyan. Dastanas +2",
	    left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		waist="Bishop's Sash",
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

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
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring={ name="Stikini Ring +1",  bag="wardrobe1"},
		right_ring={ name="Stikini Ring +1",  bag="wardrobe3"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Bard Specific Sets

	-- Max duration
	sets.Midcast.Lullaby = set_combine(sets.Midcast.Enfeebling, {
		range=Instrument.Honor,
		body="Fili Hongreline +1",
		hands="Brioso Cuffs +3",
		legs="Inyanga Shalwar +2",
	})
	sets.Midcast.Finale = {}
	sets.Midcast.Requiem = {}
	sets.Midcast.Elegy = {}
	sets.Midcast.Prelude = {}
	sets.Midcast.Madrigal = {head="Fili Calot +1"}
    sets.Midcast.Minuet = {body="Fili Hongreline +1"}
    sets.Midcast.March = {hands="Fili Manchettes +1"}
    sets.Midcast.Ballad = {legs="Fili Rhingrave +1"}
    sets.Midcast.Scherzo = {feet="Fili Cothurnes +1"}
    sets.Midcast.Mazurka = {}
    sets.Midcast.Paeon = {head="Brioso Roundlet +3"}
    sets.Midcast.Threnody = {body="Mou. Manteel +1"}
    sets.Midcast.Minne = {legs="Mou. Seraweels +1"}
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {hands="Mousai Gages +1"}
    sets.Midcast.Etude = {head="Mousai Turban +1"}
	sets.Midcast.Dirge = {}
	sets.Midcast.Sirvente = {}

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
	
	--Default WS set base
	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--The following sets augment the WS base set
	sets.WS.WSD = {}
	sets.WS["Savage Blade"] = {}

	sets.WS["Mordant Rime"] = {
		range=Instrument.Mordant,
		head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
		body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
		hands={ name="Bihu Cuffs +3", augments={'Enhances "Con Brio" effect',}},
		legs={ name="Bihu Cannions +3", augments={'Enhances "Soul Voice" effect',}},
		feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}},
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear="Regal Earring",
		right_ear="Ishvara Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring={ name="Moonlight Ring",  bag="wardrobe4", priority=1},
		back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS["Aeolian Edge"] = {
	    range=Instrument.Aeolian,
		body="Cohort Cloak +1",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +6','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Kaykaus Tights", augments={'INT+10','"Mag.Atk.Bns."+15','Enmity-5',}},
		feet={ name="Chironic Slippers", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Enmity-2','INT+8','"Mag.Atk.Bns."+13',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Shiva Ring +1",
		back={ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.Charm = {
		main="Lament",
		range="Marsyas",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Brioso Cannions +3",
		feet="Inyan. Crackows +2",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','Latent effect: "Refresh"+1',}},
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

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
	if spell.type == 'BardSong' then
		if DualWield == false then
			return set_combine(equipSet, Weapons.Songs)
		else
			return set_combine(equipSet, Weapons.Songs.DualWield)
		end
	else
		return Weapon_Check(equipSet)
	end
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if spell.type == 'BardSong' then
		if DualWield == false then
			return set_combine(equipSet, Weapons.Songs)
		else
			return set_combine(equipSet, Weapons.Songs.DualWield)
		end
	else
		return Weapon_Check(equipSet)
	end
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
	-- Calls the Bard Dummy Song function
	if command == 'songbuff' then
		dummy_songs()
	end
end

function check_buff_SP()
	buff = 'None'
	local sp_recasts = windower.ffxi.get_spell_recasts()


	return buff
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	return buff
end


-- Function is called when the job lua is unloaded
function user_file_unload()

end

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,Weapons[state.JobMode.value])
	if DualWield == false then
		equipSet = set_combine(equipSet,Weapons.Shield)
	end
	return equipSet
end

-- Function to prebuff Dummy Songs
function dummy_songs()
	info('Song Buff Begin')
	state.AutoBuff:set('ON')
	send_command("input /ma \"Army's Paeon IV\" <me>")

	coroutine.schedule(player_buffing,.05)
	coroutine.schedule(song2,5.5)
	coroutine.schedule(song3,11)
	coroutine.schedule(song4,16.5)
end

function song2()
	is_Buffing = false
	send_command("input /ma \"Army's Paeon III\" <me>")
	coroutine.schedule(player_buffing,.05)
end

function song3()
	is_Buffing = false
	send_command("input /ma \"Army's Paeon II\" <me>")
	coroutine.schedule(player_buffing,.05)
end

function song4()
	is_Buffing = false
	send_command("input /ma \"Army's Paeon\" <me>")
	coroutine.schedule(player_buffing,.05)
	coroutine.schedule(songbuff,5.5)
end

function songbuff()
	state.AutoBuff:set('OFF')
	is_Buffing = false
end

function player_buffing ()
	is_Buffing = true
end
