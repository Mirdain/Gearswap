
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "8"
MacroSet = "2"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}

--Text for the keybind
CustomBind = "Cleave Mode"
--Command to bind to the f9 key
send_command('bind f9 gs c ToggleCleave')
--Log Message about what the key does
add_to_chat(8,'[F9] - Cleave Mode is ['..state.CleaveMode.value..']')

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Earth Staff",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Jhakri Robe +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Thureous Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
    }
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
	    main={ name="Colada", augments={'Phys. dmg. taken -2%','Accuracy+23','Attack+23','DMG:+20',}},
		sub="Genmei Shield",
		ammo="Sapience Orb", --2
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}}, --12
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}}, --9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs="Aya. Cosciales +2", --6
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --6
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --3
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Prolix Ring", --3
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Azure Lore"] = {}
	sets.JA["Chain Affinity"] = {}
	sets.JA["Burst Affinity"] = {}
	sets.JA["Diffusion"] = {}
	sets.JA["Efflux"] = {}
	sets.JA["Unbridled Learning"] = {}
	sets.JA["Unbridled Wisdom"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = { --Total = 15 merits + 84 gear = 99 - Cap is 105
	    ammo="Impatiens", --10
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --11
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, --20
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --16
		waist="Rumination Sash", --10
		left_ear="Magnetic Earring", --8
		right_ring="Evanescence Ring", --5
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}}, --4
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		ammo="Hydrocera",
		head="Aya. Zucchetto +2",
		body="Jhakri Robe +2",
		hands="Aya. Manopolas +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
		neck="Phalaina Locket",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {

	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {

	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash"
	})
    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Nuke = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		ammo="Hydrocera",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Jhakri Robe +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Jhakri Ring",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}
	sets.Custom.Cleave_Idle = {
		main="Earth Staff",
		left_ring="Defending Ring", --10/10
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}}, --4/4
	}
	sets.Custom.Weapons = {}
	sets.Custom.Weapons.Cleave = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
	}
	sets.Custom.Weapons.TP = {
		main="Naegling",
		sub={ name="Colada", augments={'Phys. dmg. taken -2%','Accuracy+23','Attack+23','DMG:+20',}},
	}

	sets.TP = {

	}
	sets.TP.DW = {}
	sets.TP.DT = {}
	sets.TP.ACC = {}

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
	    head="Wh. Rarab Cap +1",
		body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
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

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if ToggleCleave == "ON" and spell.type == "Magic" then
		equipSet = sets.Custom.Weapons.Cleave
	end
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if ToggleCleave == "ON" and player.status == "Idle" then
		equipSet = set_combine(sets.Idle, sets.Custom.Cleave_Idle)
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
	if T{'Idle','Resting'}:contains(new) then
		if player.tp > 100 then
			windower.add_to_chat(8,'TP over 100 Locking weapons')
			disable('main')
			disable('sub')
		else
			enable('main')
			enable('sub')
		end
	end
	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)
	if command == "togglecleave" then
		if state.CleaveMode.value == "OFF" then
			state.CleaveMode.value = "ON"
			send_command('input //aset removeall;wait 1;input //aset spellset magic;input /macro book 8;wait .1; input /macro set 2')
			choose_set()  
			equip(sets.Custom.Weapons.Cleave)
		else
			send_command('input //aset removeall;wait 1;input //aset spellset tp;input /macro book 8;wait .1; input /macro set 1')
			state.CleaveMode.value = "OFF"
			equip(sets.Idle)
			equip(sets.Custom.Weapons.TP)
		end
		windower.add_to_chat(8,'Cleave mode ['..state.CleaveMode.value..']')
	end
end
-- Function is called when the job lua is unloaded
function user_file_unload()

end