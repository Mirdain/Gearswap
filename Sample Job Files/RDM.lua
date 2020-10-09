
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
MacroBook = "3"
MacroSet = "1"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Text for the custom keybind
CustomBind = "Auto Burst Mode"
--Command to bind to the f9 key
send_command('bind f9 gs c AutoBurst')
--Log Message about what the key does
add_to_chat(8,'[F9] - Auto Burst Mode [OFF]')

--loads the Burst Plugin
windower.send_command('lua l Burst')

function get_sets()
	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark", -- 10/10
		ammo="Staunch Tathlum +1", -- 3/3
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy'}, priority=3}, -- +3 Refresh
		body="Malignance Tabard", -- 9/9
		hands="Malignance Gloves", -- 5/5
		legs="Malignance Tights", -- 7/7
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +2 Refresh
		neck="Loricate Torque +1", -- 6/6
		waist="Fucho-no-Obi", -- +1 Refresh
		left_ear={ name="Eabani Earring", priority=2},
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/1
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={ name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
		-- 51% PDT, 31% MDT, 10 MP/Tic
    }
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		-- 50% is needed on RDM (Fast Cast V - 30%) + 8 JP from gifts
		main={ name="Crocea Mors", augments={'Path: C',}}, --20
		sub="Ammurapi Shield",
		ammo={ name="Hydrocera", priority=4},
		head="Malignance Chapeau",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist={ name="Luminary Sash", priority=5},
		left_ear={ name="Eabani Earring", priority=3},
		right_ear={ name="Etiolation Earring", priority=2}, --1
		left_ring="Janniston Ring",
		right_ring={ name="Etana Ring", priority=1},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10
		-- 46%
	}
	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		-- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		right_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})
	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}}
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
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sors Shield",
		ammo={ name="Hydrocera", priority=5},
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Deviant Necklace",
		waist={ name="Luminary Sash", priority=3},
		left_ear="Halasz Earring",
		right_ear={ name="Tuisto Earring", priority=6},
		left_ring={ name="Lebeche Ring", priority=2},
		right_ring={ name="Janniston Ring", priority=1},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield", -- 10
		ammo="Staunch Tathlum +1",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}}, -- 10
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Atrophy Gloves +3", -- 20
		legs={ name="Telchine Braconi", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}, --10
		feet="Leth. Houseaux +1", -- 30
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, --25
		waist="Embla Sash", --10
		left_ear="Mimir Earring",
		right_ear={ name="Etiolation Earring", priority=2}, -- Used to Keep HP/MP pool
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 20
		-- 150% Duration
	}
	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",
	})
	-- Spells that require SKILL
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
		head="Befouled Crown",
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
		legs="Atrophy Tights +3",
		waist="Olympus Sash",
	})
	-- Enfeebling -- Default Duration
	sets.Midcast.Enfeebling = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+25','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Snotra Earring",
		left_ring="Kishar Ring",
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
		right_ear="Digni. Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
	})
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
		body="Lethargy Sayon +1",
	})
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast["Frazzle"] = sets.Midcast.Enfeebling.MACC
	sets.Midcast["Frazzle II"] = sets.Midcast.Enfeebling.MACC
	sets.Midcast["Frazzle III"] = sets.Midcast.Enfeebling.Potency
	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Atrophy Tabard +3",
		legs="Leth. Fuseau +1",
		right_ear={ name="Tuisto Earring", priority=1},
	})
	sets.Midcast["Stun"] = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+25','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Nuke = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.Burst = set_combine(sets.Midcast.Enhancing, {
		neck="Mizu. Kubikazari",
	})

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}
	sets.Custom.Saboteur = {
	    hands="Leth. Gantherots +1",
	}

	sets.TP = {
	    main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Genmei Shield",
		ammo="Ginsen",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		neck="Anu Torque",
		waist="Witful Belt",
		left_ear="Sherida Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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
-- This function is called when the job file is unloaded
function user_file_unload()
	windower.send_command('lua u Burst')
end