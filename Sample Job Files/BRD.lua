
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "9"
MacroBook = "9"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Enable JobMode for UI
UI_Name = 'Song Buff'

--Modes for specific to Corsair
state.JobMode = M{['description']='Song Buff'}
state.JobMode:options('ON','OFF')
state.JobMode:set('OFF')

--Command to bind to the f9 key
send_command('bind f9 gs c SongBuff')

function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}
	sets.Weapons.Dual_Wield = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Taming Sari", augments={'STR+8','DEX+9','DMG:+13',}},
	}

	-- Instruments to use
	sets.Song ={}

	sets.Song.Count = {
	    range="Daurdabla"
	}
	sets.Song.Strength = {
		range="Gjallarhorn"
	}
	sets.Song.Honor = {
		range="Marsyas"
	}
	sets.Song.AOE_Sleep = {
	    range="Daurdabla"
	}
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Marsyas",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Mousai Gages +1",
		legs="Brioso Cannions +3",
		feet="Inyan. Crackows +2",
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Sanare Earring",
		right_ear="Etiolation Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Fili Cothurnes +1",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Taming Sari", augments={'STR+8','DEX+9','DMG:+13',}},
		range="Marsyas",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Inyan. Crackows +2",
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--The following sets augment the base TP set
	sets.DualWield = {
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {

	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {
	}

	sets.Precast = {}
	-- Used to account for -Song Casting Time vs Fast Cast
	sets.Precast.Songs = {
	    main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Marsyas",
		head="Fili Calot +1",
		body="Brioso Justau. +3",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},
		legs={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%',}},
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear={ name="Tuisto Earring", priority = 3},
		right_ear="Etiolation Earring",
		left_ring={ name="Moonlight Ring", priority = 1},
		right_ring={ name="Moonlight Ring", priority = 2},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},
		legs={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Voltsurge Torque",
		waist="Channeler's Stone",
		left_ear="Loquac. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Rahab Ring",
		right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Used to force song override (low duration dummy songs)
	sets.Precast.DummySongs = set_combine(sets.Precast.Songs, sets.Song.Count)
	-- Default song duration / strength
	sets.Midcast = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Marsyas",
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ear="Regal Earring",
		right_ear="Etiolation Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Marsyas",
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Kaykaus Tights", augments={'MP+60','Spell interruption rate down +10%','"Cure" spellcasting time -5%',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Incanter's Torque",
		waist="Bishop's Sash",
		left_ear="Mendi. Earring",
		right_ear="Regal Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	-- Base set for duration
	sets.Midcast.Enhancing = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Marsyas",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Curaga Set (different rules than cure)
	sets.Midcast.Curaga = sets.Midcast.Cure
	-- Cursna Set
	sets.Midcast.Cursna = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Gjallarhorn",
		head="Brioso Roundlet +3",
		body="Brioso Justau. +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Enchntr. Earring +1",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Bard Specific Sets
	sets.Midcast.Lullaby ={
		right_ear="Regal Earring",
		body="Fili Hongreline +1",
		legs="Inyanga Shalwar +2",
	}
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
    sets.Midcast.Threnody = {}
    sets.Midcast.Minne = {}
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {hands="Mousai Gages +1"}
    sets.Midcast.Etude = {}
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
	sets.WS = {
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--The following sets augment the WS base set
	sets.WS.WSD = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Mordant Rime"] = {
	    main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Taming Sari", augments={'STR+8','DEX+9','DMG:+13',}},
		range="Marsyas",
		head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
		body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
		hands={ name="Bihu Cuffs +3", augments={'Enhances "Con Brio" effect',}},
		legs={ name="Bihu Cannions +3", augments={'Enhances "Soul Voice" effect',}},
		feet={ name="Bihu Slippers +3", augments={'Enhances "Nightingale" effect',}},
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Regal Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.Custom = {}

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
		--main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
		--waist="Chaac Belt",
	    --head="Wh. Rarab Cap +1",
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
	-- Calls the Bard Dummy Song function
	if command == 'songbuff' then
		dummy_songs()
	end
end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

 function Weapon_Check(equipSet)
	if DualWield == true then
		equipSet = set_combine(equipSet, sets.Weapons.Dual_Wield)
	end
	return equipSet
 end

-- Function to prebuff Dummy Songs
function dummy_songs()
	info('Song Buff Begin')
	state.JobMode:set('ON')
	send_command("input /ma \"Army's Paeon IV\" <me>;wait 5;input /ma \"Army's Paeon III\" <me>;wait 5;input /ma \"Army's Paeon II\" <me>;wait 5;input /ma \"Army's Paeon\" <me>")
	coroutine.schedule(songs_buff,18)
end

function songs_buff ()
	state.JobMode:set('OFF')
end