
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "9"
MacroBook = "9"
MacroSet = "1"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Text for the keybind
CustomBind = "4 Song Buff"
--Command to bind to the f9 key
send_command('bind f9 gs c SongBuff')
--Log Message about what the key does
add_to_chat(8,'[F9] - 4 Song Pre-Buff')

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
		sub="Genmei Shield",
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
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Fili Cothurnes +1",
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
	sets.Precast = {}
	-- Used to account for -Song Casting Time vs Fast Cast
	sets.Precast.Songs = {
		main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
		sub="Genmei Shield",
		head="Fili Calot +1",
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},
		legs="Aya. Cosciales +2",
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
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
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genmei Shield",
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Regal Earring",
		left_ring="Defending Ring",
		right_ring="Patricius Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
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
	sets.Midcast.Enhancing = {}
	-- Curaga Set (different rules than cure)
	sets.Midcast.Curaga = sets.Midcast.Cure
	-- Cursna Set
	sets.Midcast.Cursna = {}
	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
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
	sets.JA["Nightingale"] = {feet={ name="Bihu Slippers +1", augments={'Enhances "Nightingale" effect',}}}
	sets.JA["Troubadour"] = {body={ name="Bihu Jstcorps +1", augments={'Enhances "Troubadour" effect',}}}
	sets.JA["Soul Voice"] = {legs={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}}}
	sets.JA["Tenuto"] = {}
	sets.JA["Marcato"] = {}
	sets.JA["Clarion"] = {}
	sets.JA["Pianissimo"] = {}
	--Base TP set to build off
	sets.TP = {
		main="Carnwenhan",
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		range="Marsyas",
		head="Brioso Roundlet +3",
		body="Ayanmo Corazza +2",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		feet="Inyan. Crackows +2",
		neck="Lissome Necklace",
		waist="Sarissapho. Belt",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {

	}
	--The following sets augment the base TP set
	sets.TP.DW = {
	    main="Carnwenhan",
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		range="Marsyas",
		head="Brioso Roundlet +3",
		body="Ayanmo Corazza +2",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		feet="Inyan. Crackows +2",
		neck="Lissome Necklace",
		waist="Sarissapho. Belt",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Moonlight Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	}
	--Default WS set base
	sets.WS = {
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--The following sets augment the WS base set
	sets.WS.WSD = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Mordant Rime"] = {}

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
	jobsetup (LockStylePallet,MacroBook,MacroSet)
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
-- Function is called when the job lua is unloaded
function user_file_unload()

end