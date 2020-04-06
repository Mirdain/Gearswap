
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "9"
MacroSet = "1"

--Text for the keybind
CustomBind = "4 Song Buff"
--Command to bind to the f9 key
send_command('bind f9 gs c SongBuff')
--Log Message about what the key does
add_to_chat(8,'[F9] - 4 Song Pre-Buff')

function get_sets()
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
		main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
		sub="Genmei Shield",
		left_ring="Stikini Ring +1",
		head="Aya. Zucchetto +2",
		body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Fili Cothurnes +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }
	sets.Movement = {}
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {
	    main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
		sub="Genmei Shield",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonbeam Cape",
	}
	sets.Precast = {}
	-- Used to account for -Song Casting Time vs Fast Cast
	sets.Precast.Songs = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}, --7
		sub="Genmei Shield",
		right_ring="Stikini Ring +1",
		head="Fili Calot +1", --14
		body="Inyanga Jubbah +2", --14
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs="Aya. Cosciales +2", --6
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}}, --12
		neck="Voltsurge Torque", --14
		waist="Tempus Fugit",
		left_ear="Loquac. Earring", --2
		right_ear="Etiolation Earring", --1
		left_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	}
	-- Used for Magic Spells
		sets.Precast.FastCast = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}, --7
		sub="Genmei Shield",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Inyanga Jubbah +2", --14
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs="Aya. Cosciales +2", --4
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}}, --4
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Loquac. Earring", --2
		right_ear="Etiolation Earring", --1
		left_ring="Prolix Ring", --3
		right_ring="Kishar Ring", --4
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	}
	-- Used to force song override (low duration dummy songs)
	sets.Precast.DummySongs = {
		main="Qutrub Knife",
		sub="Genmei Shield",
		right_ring="Stikini Ring +1",
		head="Fili Calot +1",
		body="Inyanga Jubbah +2",
		hands="Fili Manchettes +1",
		legs="Fili Rhingrave +1",
		feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
		neck="Voltsurge Torque",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Loquac. Earring",
		left_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	sets.Precast.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	-- Default song duration / strength
	sets.Midcast = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genmei Shield",
		head="Fili Calot +1",
		right_ring="Stikini Ring +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Flume Belt +1",
		left_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genmei Shield",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --17
		body="Inyanga Jubbah +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}}, --11
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}}, --17
		neck="Voltsurge Torque",
		waist="Channeler's Stone",
		left_ear="Mendi. Earring", --5
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genmei Shield",
		head="Aya. Zucchetto +2",
		body="Inyanga Jubbah +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Hermetic Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Bard Specific Sets
	sets.Midcast.Lullaby ={}
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
    sets.Midcast.Paeon = {}
    sets.Midcast.Threnody = {}
    sets.Midcast.Minne = {}
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {}
    sets.Midcast.Etude = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Nightingale"] = {feet={ name="Bihu Slippers", augments={'Enhances "Nightingale" effect',}}}
	sets.JA["Troubadour"] = {body={ name="Bihu Justaucorps", augments={'Enhances "Troubadour" effect',}}}
	sets.JA["Soul Voice"] = {}
	sets.JA["Tenuto"] = {}
	sets.JA["Marcato"] = {}
	sets.JA["Clarion"] = {}
	sets.JA["Pianissimo"] = {}

	--Base TP set to build off
	sets.TP = {
	    main="Naegling",
		sub="Genmei Shield",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Sanctity Necklace",
		waist="Kentarch Belt +1",
		left_ear="Brutal Earring",
		right_ear="Digni. Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Moonbeam Cape",
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
		body="Malignance Tabard",
		legs="Malignance Tights",
	}
	--The following sets augment the base TP set
	sets.TP.DW = {}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	}
	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Hetairoi Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--The following sets augment the WS base set
	sets.WS.WSD = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Mordant Rime"] = {}

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
	   --main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
		waist="Chaac Belt",
	    head="Wh. Rarab Cap +1",
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