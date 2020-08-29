
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
MacroBook = "3"
MacroSet = "1"

function get_sets()

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main="Earth Staff",
		sub="Clerisy Strap",
		ammo="Homiliary",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Jhakri Robe +2",
		hands="Aya. Manopolas +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		sub="Clerisy Strap",
		ammo="Impatiens",
		head="Atro. Chapeau +1",
		body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Aya. Cosciales +2",
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}}}
	sets.JA["Saboteur"] = {}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+28','Spell interruption rate down -9%','INT+12',}}, --19
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, --20
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --16
	    right_ring="Freke Ring", --10
		waist="Rumination Sash", --10
		ammo="Staunch Tathlum +1", --11
		right_ear="Magnetic Earring", --8
		--104 with Merits
	}
	-- Cure Set
	sets.Midcast.Cure = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		sub="Clerisy Strap",
		ammo="Hydrocera",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Atrophy Tights +1",
		feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
		neck="Nodens Gorget",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Roundel Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
	    ammo="Hydrocera",
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +1",
		neck="Dls. Torque +2",
		waist="Siegel Sash",
		left_ear="Halasz Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Lethargy Sayon +1",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Spell interruption rate down -4%','Mag. Acc.+11','"Mag.Atk.Bns."+4',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Atrophy Tabard +2",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
		feet="Leth. Houseaux +1",
		waist="Gishdubar Sash",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
	})
	sets.Midcast.Nuke = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
	    sub="Clerisy Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Jhakri Robe +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10',}},
	}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}
	sets.Custom.Saboteur = {
	    hands="Leth. Gantherots +1",
	}

	sets.TP = {}
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
	if buffactive['Saboteur'] then
		equipSet = sets.Custom.Saboteur
	end
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if not buffactive['Composure'] and spell.name ~=  "Composure" then
		add_to_chat(8,'Composure is down')
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
		if player.tp > 500 then
			windower.add_to_chat(8,'TP over 500 Locking weapons')
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

end