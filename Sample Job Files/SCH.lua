--Yavanna

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "19"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Weapon Modes
state.WeaponMode:options('Musa','Mpaca','Unlocked','Locked')
state.WeaponMode:set('Musa')

function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Musa'] ={
		main={ name="Musa", augments={'Path: C',}},
		sub="Enki Strap",
	}

	sets.Weapons['Mpaca'] ={
		main={ name="Mpaca's Staff", augments={'Path: A',}},
		sub="Enki Strap",
	}

	sets.Weapons['Unlocked'] ={
		main={ name="Musa", augments={'Path: C',}},
		sub="Enki Strap",
	}
	
	sets.Weapons.Shield ={
		main="Daybreak",
		sub="Genmei Shield",
	}

	sets.Weapons.Sleep ={
		main="Opashoro",
	}

	-- Standard idle set
	sets.Idle = { -- HP:2151 MP:1493
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1", -- 3/3
		head="Arbatel Bonnet +3", -- 10/10
		body="Arbatel Gown +3", -- 12/12 -- +3 Refresh
		hands={ name="Nyame Gauntlets", priority=2}, -- 7/7
		legs="Arbatel Pants +3", -- 12/12
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +2 Refresh
		neck="Loricate Torque +1", -- 6/6
		waist="Carrier's Sash",
		left_ear="Lugalbanda Earring",
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/3
		left_ring={name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe2"}, -- +1 Refresh
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}, -- 5/5
    } -- 57 PDT / 58 MDT

	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		head="Acad. Mortar. +3", -- +4 Submlimation when active
		right_ring="Defending Ring",
	    waist="Embla Sash", -- +3 Submlimation when active
	})
	sets.Idle.Resting = sets.Idle
	sets.Idle.TP = sets.Idle
	sets.Idle.ACC = sets.Idle
	sets.Idle.DT = sets.Idle
	sets.Idle.PDL = sets.Idle
	sets.Idle.SB = sets.Idle
	sets.Idle.MEVA = sets.Idle

	-- Set to swap into when player is moving
	sets.Movement = {
		feet="Herald's Gaiters"
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	-- Sets are used for when player is engaged
	sets.OffenseMode = {
		ammo="Staunch Tathlum +1",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Arbatel Pants +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Grunfeld Rope",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Base TP set
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, { })

	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = set_combine(sets.OffenseMode, { })

	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, { })

	-- Set to use when Dual Wielding
	sets.DualWield = {}

	-- Set to use when casting spells (sent with Mid-Cast packet - only concern is HP/MP and Fastcast)
	sets.Precast = {}

	sets.Precast.FastCast = {
		-- 10 FC from Musa staff 
		ammo="Impatiens", -- Quick Magic
		head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}}, -- 13% Grimoire, 6% Haste
		body="Pinga Tunic +1", -- 15% FC, Haste
		hands="Acad. Bracers +3", -- 9% FC, 3% Haste
		legs="Pinga Pants +1", -- 13% FC, 5% Haste
		feet="Acad. Loafers +3", -- 12% Grimoire, 3% Haste
		neck="Voltsurge Torque", -- 4% FC
		waist="Witful Belt", -- 3% FC and 3 Quick Magic 
		left_ear="Malignance Earring", -- 4% FC
		right_ear="Etiolation Earring", -- 1% FC
		left_ring="Weather. Ring", -- 5% FC 3 Quick Magic
		right_ring="Lebeche Ring", -- 2 Quick Magic
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}, -- 10% FC
	} -- 80 Fastcast, and 25% Grimoire all in one

	sets.Precast.Enhancing = set_combine(sets.Precast.QuickMagic, {})

	sets.Precast.Cure = set_combine(sets.Precast.QuickMagic, {})

	-- Swaps for Grimoire Fast Cast (Should be over 80% FC)
	sets.Precast.Grimoire = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Light Arts"] = {}
	sets.JA["Penury"] = {}
	sets.JA["Celerity"] = {}
	sets.JA["Rapture"] = {}
	sets.JA["Accession"] = {}
	sets.JA["Perpetuance"] = {}
	sets.JA["Addendum: White"] = {}

	sets.JA["Dark Arts"] = {}
	sets.JA["Parsimony"] = {}
	sets.JA["Alacrity"] = {}
	sets.JA["Ebullience"] = {}
	sets.JA["Manifestation"] = {}
	sets.JA["Focalization"] = {}
	sets.JA["Immanence"] = {}
	sets.JA["Addendum: White"] = {}

	sets.JA["Sublimation"] = {}
	sets.JA["Tabula Rasa"] = {legs={ name="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}}}
	sets.JA["Modus Veritas"] = {}
	sets.JA["Libra"] = {}
	sets.JA["Caper Emissarius"] = {}

	sets.JA["Convert"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Hasty Pinion +1",
		head="Arbatel Bonnet +3",
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Nodens Gorget",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Mendi. Earring",
		left_ring="Naji's Loop",
		right_ring="Defending Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
    }	

	-- Cursna Gear
	sets.Midcast.Cursna = set_combine(sets.Midcast.Cure, {
		body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
		legs="Acad. Pants +3",
		feet="Gende. Galosh. +1",
		neck="Debilis Medallion",
	    left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
	})

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ammo="Psilomene",
		head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
		hands={ name="Telchine Gloves", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Evasion+19','"Regen"+2','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear={ name="Etiolation Earring", priority=1},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Spells that require SKILL
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {})

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
		body={ name="Telchine Chas.", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		back={ name="Bookworm's Cape", augments={'INT+1','MND+2','Helix eff. dur. +10','"Regen" potency+10',}},
		head="Arbatel Bonnet +3",
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
	})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Acad. Mortar. +3",
		body="Acad. Gown +3",
		hands="Acad. Bracers +3",
		legs="Arbatel Pants +3",
		feet="Acad. Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist={ name="Obstin. Sash", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})
	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

	 -- Used for Vagary (6k+ nuke no kill)
	sets.Midcast.Vagary = {
	    main="Chatoyant Staff",
		ammo="Hasty Pinion +1",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Zendik Robe",
		hands="Gende. Gages +1",
		legs="Pinga Pants +1",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+29','"Fast Cast"+6','DEX+7','Mag. Acc.+14',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring="Weather. Ring",
		right_ring="Kishar Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.Midcast.Nuke = {
		main={ name="Bunzi's Rod", augments={'Path: A',}},
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
		body="Arbatel Gown +3",
		hands={ name="Agwu's Gages", augments={'Path: A',}},
		legs={ name="Agwu's Slops", augments={'Path: A',}},
		feet="Arbatel Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

	sets.Midcast.Nuke.Earth = {
	    neck="Quanpur Necklace",
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {})

	sets.Midcast.Helix = set_combine(sets.Midcast.Nuke, {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Agwu's Cap", augments={'Path: A',}},
		body={ name="Agwu's Robe", augments={'Path: A',}},
		hands={ name="Agwu's Gages", augments={'Path: A',}},
		legs={ name="Agwu's Slops", augments={'Path: A',}},
		feet="Arbatel Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	})

	sets.Perpetuance = {
		hands="Arbatel Bracers +3",
	}

	sets.Immanence = {
		hands="Arbatel Bracers +3",
	}

	sets.Ebullience = {
		head="Arbatel Bonnet +3",
	}

	sets.Rapture = {
		head="Arbatel Bonnet +3",
	}
	-- not swapped due to duration
	sets.Penury = {
		legs="Arbatel Pants +3",
	}

	sets.Parsimony = {
		legs="Arbatel Pants +3",
	}

	sets.Klimaform = {
		feet="Arbatel Loafers +3",
	}

	sets.Storms = {
		feet="Arbatel Loafers +3", -- Pedagogy Loafers +3
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Hasty Pinion +1",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Arbatel Pants +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		waist="Siegel Sash",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		neck="Nodens Gorget",
		left_ear="Earthcry Earring",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	sets.Midcast["Klimaform"] = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast["Impact"] = set_combine(sets.Midcast.Enfeebling, {
		body="Crepuscular Cloak",	
	})

	sets.Midcast["Embrava"] = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast["Stun"] = set_combine(sets.Midcast.Enfeebling.MACC, {})

	sets.WS = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Cornelia's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Lugh's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Set used to tag treasure hunger
	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		head="Volte Cap",
		legs="Volte Hose",
		waist="Chaac Belt",
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
	local equipSet = {}
	if spell.type == "WhiteMagic" and (buffactive["Light Arts"] or buffactive["Addendum: White"]) then 
		log("Grimoire Set (White)")
		equipSet = set_combine(equipSet, sets.Precast.Grimoire)
	elseif spell.type == "BlackMagic" and (buffactive["Dark Arts"] or buffactive["Addendum: Black"]) then
		log("Grimoire Set (Dark)")
		equipSet = set_combine(equipSet, sets.Precast.Grimoire)
	end
	return equipSet
end

-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}

	if spell.skill == 'Elemental Magic' and not Elemental_Enfeeble:contains(spell.name) then

		if spell.name:contains('helix') then
			equipSet = set_combine(equipSet, sets.Midcast.Helix)
			windower.add_to_chat(8,'Helix Detected!')
		end

		if spell.element == "Earth" and not spell.name:contains('helix') then
			equipSet = set_combine(equipSet, sets.Midcast.Nuke.Earth)
			windower.add_to_chat(8,'Earth Element Detected!')
		end
	end

	-- This function swaps in elemental buffs
	if spell.name:contains('Cure') then
		-- Matching bonus
		if spell.element == world.weather_element or spell.element == world.day_element then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi"})
			if state.WeaponMode.value == "Unlocked" then
				equipSet = set_combine(equipSet, {main="Chatoyant Staff"})
				log('Element Match found for Curing - Swapping Waist and Weapon')
			else
				log('Element Match found for Curing - Swapping Waist')
			end
		else
			log('No Day/Weather match and too far.  Using default')
		end
	end

	if buffactive["Immanence"] then
		log("Immanence Set")
		equipSet = set_combine(equipSet, sets.Immanence)
	end

	if buffactive["Ebullience"] then
		log("Ebullience Set")
		equipSet = set_combine(equipSet, sets.Ebullience)
	end

	if buffactive["Rapture"] then
		log("Rapture Set")
		equipSet = set_combine(equipSet, sets.Rapture)
	end

	-- Skipping Penury due to lack of duration gear (Embrava)
	--[[
	if buffactive["Penury"] then
		log("Penury Set")
		equipSet = sets.Penury
	end
	]]--

	if buffactive["Parsimony"] then
		log("Parsimony Set") 
		equipSet = set_combine(equipSet, sets.Parsimony)
	end

	if buffactive["Perpetuance"] then
		log("Perpetuance Set")
		equipSet = set_combine(equipSet, sets.Perpetuance)
	end

	return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}

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

-- This function is called when the job file is unloaded
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