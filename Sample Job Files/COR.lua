--Relyk

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "9"
MacroBook = "9"
MacroSet = "1"

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
	sets.Precast = {}
	sets.Precast.RA = {
		body="Oshosi Vest +1",
		feet="Meg. Jam. +2",
		waist="Yemaya Belt",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
    }
	sets.Precast.RA.Flurry = {
        --ammo=gear.RAbullet,
        --head=gear.Taeon_RA_head, --10/0
        body="Oshosi Vest +1", --14/0
        hands="Carmine Fin. Ga. +1", --8/11
        --legs=gear.Adhemar_D_legs, --9/10
        feet="Meg. Jam. +2", --10/0
        --back=gear.COR_SNP_Cape, --10/0
        waist="Yemaya Belt", --0/5
    } 
	sets.Precast.RA.Flurry_II = {
        --ammo=gear.RAbullet,
        --head=gear.Taeon_RA_head, --10/0
        body="Oshosi Vest +1", --14/0
        hands="Carmine Fin. Ga. +1", --8/11
        --legs=gear.Adhemar_D_legs, --9/10
        feet="Meg. Jam. +2", --10/0
        --back=gear.COR_SNP_Cape, --10/0
        waist="Yemaya Belt", --0/5
    } 
	sets.Precast.Enmity = {}
	sets.Midcast = {}
	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
        --ammo=gear.RAbullet,
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        ear1="Enervating Earring",
        ear2="Telos Earring",
        ring1="Dingir Ring",
        ring2="Ilabrat Ring",
        --back=gear.COR_RA_Cape,
        waist="Yemaya Belt",
    }
	-- Ranged Attack Gear (Triple Shot Midshot)
	sets.Midcast.RA.TripleShot = {
        head="Oshosi Mask +1", --5
        body="Chasseur's Frac +1", --12
        hands="Lanun Gants +3",
        legs="Osh. Trousers +1", --6
        feet="Osh. Leggings +1", --3
    } --27
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Wild Card"] = {
	    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Double-UP"] = {}
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
	sets.JA["Triple Shot"] = {
		head="Oshosi Mask +1",
		body="Chasseur's Frac +1",
		hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
		legs="Osh. Trousers +1",
		feet="Osh. Leggings +1",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- Need Updated Cape
	}
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}
	--Base Set used for all rolls
	sets.PhantomRoll = {
		main={ name="Rostam", augments={'Path: C',}}, -- +8 Effect and 60 second duration
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}}, -- 50% Job ability Bonus
		body="Malignance Tabard",
		hands="Chasseur's Gants +1", --50 sec Duration
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget", -- Need Regal
		waist="Flume Belt +1",
		left_ear="Sanare Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Luzaf's Ring", -- 16 yalm range
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, -- 30 sec Duration
	}
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
	sets.PhantomRoll['Caster\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Allies\' Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
	sets.PhantomRoll['Tactician\'s Roll'] = sets.PhantomRoll
	--Base TP set to build off
	sets.TP = {
        --head=gear.Adhemar_B_head,
        --body=gear.Adhemar_B_body, --6
        hands="Floral Gauntlets", --5
        legs="Carmine Cuisses +1", --6
        --feet=gear.Taeon_DW_feet, --9
        neck="Iskur Gorget",
        ear1="Suppanomimi", --5
        ear2="Brutal Earring",
        ring1="Hetairoi Ring",
        ring2="Epona's Ring",
        --back=gear.COR_DW_Cape, --10
        waist="Reiki Yotai", --7
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
	}
	--The following sets augment the base TP set
	sets.TP.DW = {
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	}
	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {
	}
	sets.WS.WSD = {
	}
	sets.WS.MAB = {
	}
	sets.WS.MACC = {
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
	sets.WS["Savage Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Custome sets for each jobsetup
	sets.Custom = {}

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