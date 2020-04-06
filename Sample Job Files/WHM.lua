
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "11"
MacroSet = "1"

function get_sets()

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Malignance Pole",
		sub="Clerisy Strap",
		ammo="Homiliary",
		head="Aya. Zucchetto +2",
		body="Ebers Bliaud +1",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Herald's Gaiters",
		neck="Loricate Torque +1",
		waist="Luminary Sash",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		sub="Clerisy Strap",
		ammo="Sapience Orb",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Inyanga Jubbah +2",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+28','Spell interruption rate down -9%','INT+12',}},
		legs="Aya. Cosciales +2",
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {}
	sets.JA["Divine Seal"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Devotion"] = {}
	sets.JA["Afflatus Solace"] = {}
	sets.JA["Afflatus Misery"] = {}
	sets.JA["Sacrosanctity"] = {}
	sets.JA["Asylum"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Genmei Shield",
		ammo="Hydrocera",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Ebers Bliaud +1",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Ebers Pant. +1",
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
		neck="Phalaina Locket",
		waist="Channeler's Stone",
		left_ear="Mendi. Earring",
		right_ear="Nourish. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	    hands={ name="Chironic Gloves", augments={'Mag. Acc.+28','Spell interruption rate down -9%','INT+12',}},
	    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		waist="Siegel Sash",
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		sub="Genmei Shield",
		range="Gjallarhorn",
		head="Aya. Zucchetto +2",
		body="Inyanga Jubbah +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +2",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Hermetic Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
		neck="Nodens Gorget",
	}
	sets.Midcast.Refresh = {
	}
	sets.Midcast.Nuke = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TP = {}
	sets.TP.DW = {}
	sets.TP.DT = {}
	sets.TP.ACC = {}

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
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
	--Command to Lock Style and Set the correct macros
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
	if not buffactive['Afflatus Solace'] and spell.name ~=  "Afflatus Solace" then
		add_to_chat(8,'Afflatus Solace is down')
	end
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