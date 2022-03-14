
--Mirdain

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

	-- This locks your weapon to a mode
	sets.Weapons['Nirvana'] = {
		main="Nirvana",
		sub="Elan Strap +1",
	}

	-- This is the default for Idle.  When unlocked any "main" or "sub" defined in a set will be used
	sets.Weapons['Unlocked'] = {
		main="Malignance Pole",
		sub="Enki Strap",
	}

	-- Standard Idle set with -DT,Refresh,Regen
	sets.Idle = {
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Shomonjijoe +1",
		hands="Nyame Gauntlets",
		legs="Assid. Pants +1",
		feet="Baaya. Sabots +1",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="C. Palug Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

	-- Perpetuation and Refresh Set
	sets.Idle.Pet = set_combine(sets.Idle, {
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
	})

	sets.Movement = {
		feet="Herald's Gaiters",
	}

	sets.OffenseMode = {}
	-- Base TP set
	sets.OffenseMode.TP = {}
	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = {}
	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = {}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Inyanga Jubbah +2",
		hands="Regal Cuffs",
		legs="Nyame Flanchard",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic Damage +13','Mag. Acc.+15',}},
		neck="Voltsurge Torque",
		waist="Regal Belt",
		left_ear="Malignance Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	    body="Baayami Robe +1",
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
		body="Baayami Robe +1",
	}

	-- Cure Set
	sets.Midcast.Cure = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Sancus Sachet +1",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		body="Baayami Robe +1",
		hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Nodens Gorget",
		waist="Regal Belt",
		left_ear="Mendi. Earring",
		right_ear="Roundel Earring",
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		main="Daybreak",
		sub="Ammurapi Shield",
	    head="Befouled Crown",
		neck="Incanter's Torque",
		waist="Embla Sash",
	    left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Regal Cuffs",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+2','INT+7','"Mag.Atk.Bns."+12',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Crep. Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
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

	sets.Midcast.Nuke = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		left_ring="Freke Ring",
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- BP Timer Gear
    sets.Midcast.BP = { -- 10 from Master
		ammo="Sancus Sachet +1", -- 7
		head="Beckoner's Horn +1", -- Avatar's Favor
		body="Con. Doublet +3", -- 15
	}

	sets.Midcast.Summon = set_combine(sets.Idle, {
		body="Baayami Robe +1"
	})

	sets.WS = {}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.Midcast.MAB = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
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
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

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
		hands={ name="Merlinic Dastanas", augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Blood Pact Dmg.+10','Pet: DEX+8','Pet: Mag. Acc.+5',}},
		legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

	-- Physical pacts which benefit more from TP than Pet:DA (like single-hit BP)
	sets.Pet_Midcast.Physical_BP_TP = set_combine(sets.Pet_Midcast.Physical_BP, {
		legs="Enticer's Pants",
	})

	-- Base magic pact set
	sets.Pet_Midcast.Magic_BP = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+19 Pet: "Mag.Atk.Bns."+19','Blood Pact Dmg.+10',}},
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring +1",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- Some magic pacts benefit more from TP than others.
	sets.Pet_Midcast.Magic_BP_TP = set_combine(sets.Pet_Midcast.Magic_BP, {
		legs="Enticer's Pants"
	})

	-- Similar to the Magic Set except Nirvana used
	sets.Pet_Midcast.FlamingCrush = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="C. Palug Crown",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+19 Pet: "Mag.Atk.Bns."+19','Blood Pact Dmg.+10',}},
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Gelos Earring",
		left_ring="Varar Ring +1",
		right_ring="C. Palug Ring",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	sets.Pet_Midcast.SummoningMagic = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Baayami Robe +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Baaya. Sabots +1",
		neck="Incanter's Torque",
		waist="Regal Belt",
		left_ear="Andoaa Earring",
		right_ear="C. Palug Earring",
		left_ring={ name="Stikini Ring +1", bag='wardrobe3'},
		right_ring={ name="Stikini Ring +1", bag='wardrobe4'},
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
	-- This section likely requires changes or removal if you aren't Pergatory
	if pet.isvalid then
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
			elseif Debuff_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
			elseif Buff_BPs_Healing:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
			elseif Buff_BPs_Duration:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
			elseif spell.name == "Flaming Crush" then
				equipSet = sets.Pet_Midcast.FlamingCrush
			elseif ImpactDebuff and (spell.name=="Impact" or spell.name=="Conflag Strike") then
				equipSet = sets.Pet_Midcast.SummoningMagic
			elseif Magic_BPs_TP:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP_TP
			elseif Magic_BPs_NoTP:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP
			elseif Merit_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.Magic_BP_TP
			elseif Debuff_Rage_BPs:contains(spell.name) then
				equipSet = sets.Pet_Midcast.SummoningMagic
			else
				equipSet = sets.Pet_Midcast.Physical_BP
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

--Function used to automate Job Ability use
function check_buff_JA()
	buff = ''
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = ''
	return buff
end