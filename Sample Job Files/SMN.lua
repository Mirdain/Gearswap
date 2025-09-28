
--Morwen

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "2"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Grape Daifuku"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = true

--Weapons options
state.WeaponMode:options('Nirvana','Unlocked')
state.WeaponMode:set('Nirvana')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Nirvana'] = {
		main="Nirvana",
		sub="Elan Strap +1",
	}

	sets.Weapons['Unlocked'] = {
		--main="Malignance Pole",
		sub="Enki Strap",
	}

	sets.Weapons.Physical = {
		main="Nirvana",
		sub="Elan Strap +1",
	}

	sets.Weapons.Magic = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
		sub="Elan Strap +1",
	}

	--Shield used when not using a staf
	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen
	sets.Idle = {
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Bunzi's Robe",
		hands={ name="Bunzi's Gloves", augments={'Path: A',}},
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="C. Palug Earring",
		right_ear="Beck. Earring +1",
		left_ring="Defending Ring",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}},
    }

	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.PDT = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- Perpetuation and Refresh Set
	sets.Idle.Pet = set_combine(sets.Idle, {
		waist="Lucidity Sash",
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
	})

	sets.Movement = {
		feet="Herald's Gaiters",
	}

	-- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}
	sets.OffenseMode.TP = {}
	sets.OffenseMode.ACC = {}
	sets.OffenseMode.DT = {}
	sets.OffenseMode.MEVA = {}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sancus Sachet +1",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','STR+6',}},
		body="Inyanga Jubbah +2",
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+26','"Fast Cast"+7',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23','"Fast Cast"+7','VIT+3','"Mag.Atk.Bns."+13',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+12','"Fast Cast"+7','INT+9','"Mag.Atk.Bns."+8',}},
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Malignance Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	sets.Precast.Cure = set_combine(sets.Precast.FastCast, {})

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}

	-- Cure Set
	sets.Midcast.Cure = {
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Bunzi's Robe", augments={'Path: A',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Roundel Earring",
		right_ear="Etiolation Earring",
		left_ring="Naji's Loop",
		right_ring="Lehko's Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
	    main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Inyanga Jubbah +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs="Inyanga Shalwar +2",
		feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Hermetic Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	sets.Midcast.Nuke = {
	    main={ name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+24','"Mag.Atk.Bns."+27',}},
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Inyanga Jubbah +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs="Inyanga Shalwar +2",
		feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Hermetic Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- BP Timer Gear
    sets.Midcast.BP = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+23 Pet: "Mag.Atk.Bns."+23','Blood Pact Dmg.+9','Pet: INT+3',}},
		legs="Assiduity Pants",
		feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Lucidity Sash",
		left_ear="C. Palug Earring",
		right_ear="Andoaa Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back="Solemnity Cape",
	}
	sets.Midcast.Summon = set_combine(sets.Idle, {
		body="Baayami Robe +1"
	})

	sets.Midcast.MAB = {
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Inyanga Jubbah +2",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash"
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}


	sets.WS["Garland of Bliss"] = sets.Midcast.MAB
	sets.WS["Shattersoul"] = sets.Midcast.MAB
	sets.WS["Cataclysm"] = sets.Midcast.MAB

	sets.Pet_Midcast = {}

	-- Main physical pact set (Volt Strike, Pred Claws, etc.)
	sets.Pet_Midcast.Physical_BP = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+23 Pet: "Mag.Atk.Bns."+23','Blood Pact Dmg.+9','Pet: INT+3',}},
		legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
		feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}},
	}
	-- Physical pacts which benefit more from TP than Pet:DA (like single-hit BP)
	sets.Pet_Midcast.Physical_BP_TP = set_combine(sets.Pet_Midcast.Physical_BP, {
		legs="Enticer's Pants",
	})
	-- Base magic pact set
	sets.Pet_Midcast.Magic_BP = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: STR+7','Pet: Mag. Acc.+26','Pet: "Mag.Atk.Bns."+30',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="C. Palug Crown",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+23 Pet: "Mag.Atk.Bns."+23','Blood Pact Dmg.+9','Pet: INT+3',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Beck. Earring +1",
		left_ring={name="Varar Ring +1", bag="wardrobe2"},
		right_ring={name="Varar Ring +1", bag="wardrobe1"},
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	-- Some magic pacts benefit more from TP than others.
	sets.Pet_Midcast.Magic_BP_TP = set_combine(sets.Pet_Midcast.Magic_BP, {
		legs="Enticer's Pants"
	})
	-- Similar to the Magic Set except Nirvana used
	sets.Pet_Midcast.FlamingCrush = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: STR+7','Pet: Mag. Acc.+26','Pet: "Mag.Atk.Bns."+30',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+23 Pet: "Mag.Atk.Bns."+23','Blood Pact Dmg.+9','Pet: INT+3',}},
		legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
		feet={ name="Apogee Pumps +1", augments={'Pet: Attack+25','Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	sets.Pet_Midcast.SummoningMagic = {
		ammo="Sancus Sachet +1",
		head="Baayami Hat +1",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		legs="Baayami Slops",
		feet="Baaya. Sabots +1",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Lucidity Sash",
		left_ear="Lugalbanda Earring",
		right_ear="C. Palug Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Convert"] = {}
	sets.JA["Astral Flow"] = {}
	sets.JA["Elemental Siphon"] = {}
	sets.JA["Mana Cede"] = {}
	sets.JA["Astral Conduit"] = {}
	sets.JA["Apogee"] = {}

	sets.TreasureHunter = {
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
	if pet.isvalid and not buffactive["Avatar\'s Favor"] and spell.name ~= "Avatar\'s Favor" then
		add_to_chat(8,'Avatar\'s Favor is Down')
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

function pet_change_custom(pet,gain)
	equipSet = {}
	-- Select initial macro set and set lockstyle
	-- This section likely requires changes or removal if you aren't Pergatory Macro layout
	if pet and gain then
		log('Macro Change ['..pet.name..']')
		if pet.name=='Fenrir' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 2')
		elseif pet.name=='Ifrit' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 3')
		elseif pet.name=='Titan' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 4')
		elseif pet.name=='Leviathan' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 5')
		elseif pet.name=='Garuda' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 6')
		elseif pet.name=='Shiva' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 7')
		elseif pet.name=='Ramuh' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 8')
		elseif pet.name=='Diabolos' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 9')
		elseif pet.name=='Cait Sith' then
			send_command('input /macro book '..MacroBook..';wait .1;input /macro set 10')
		end
	else
		log('Macro Change (No Avatar)')
		send_command('input /macro book '..MacroBook..';wait .1;input /macro set 1')
	end
	-- End macro set
	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}
		-- This section is for SMN Blood Pact abilities
		if player.main_job == "SMN" then
			is_Busy = true
			if spell.name == "Perfect Defense" then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Physical)
				end
			elseif Debuff_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Physical)
				end
			elseif Buff_BPs_Healing:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Physical)
				end
			elseif Buff_BPs_Duration:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Physical)
				end
			elseif spell.name == "Flaming Crush" then
				equipSet = sets.Pet_Midcast.FlamingCrush
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			elseif ImpactDebuff and (spell.name=="Impact" or spell.name=="Conflag Strike") then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			elseif Magic_BPs_TP:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP_TP
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			elseif Magic_BPs_NoTP:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			elseif Merit_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP_TP
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			elseif Debuff_Rage_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Magic)
				end
			else
				equipSet = sets.Pet_Midcast.Physical_BP
				if state.WeaponMode.value == "Unlocked" then
					equipSet = set_combine(equipSet, sets.Weapons.Physical)
				end
			end
		end
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end
-- This function is called when the job file is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end