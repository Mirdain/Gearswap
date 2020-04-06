
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "2"
MacroSet = "1"

--Command to bind to the f9 key
send_command('bind f9 gs c Weaponlock')
--Log Message about what the key does
add_to_chat(8,'[F9] - Weapon Lock')

function get_sets()

	-- Standard Idle set with -DT,Refresh,Regen
	sets.Idle = {
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Shomonjijoe +1",
		hands="Convo. Bracers +3",
		legs="Assid. Pants +1",
		feet="Baayami Sabots +1",
		neck="Smn. Collar +2",
		waist="Eschan Stone",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {
	}
	sets.Movement = {
		feet="Herald's Gaiters",
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+9','Pet: INT+15','Pet: Mag. Acc.+24',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --11
		body="Inyanga Jubbah +2", --14
		hands="Convo. Bracers +3",
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}}, --5
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --6
		neck="Voltsurge Torque", --4
		waist="Witful Belt", --2
		left_ear="Loquac. Earring", --3
		right_ear="Etiolation Earring", --1
		left_ring="Kishar Ring", --4
		right_ring="Prolix Ring", --2
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}}, --10
	}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}
	-- Cure Set
	sets.Midcast.Cure = {
	    main={ name="Arka IV", augments={'"Cure" potency +24%',}},
		ammo="Sancus Sachet +1",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --17
		body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, --7
		feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}}, --11
		neck="Nodens Gorget", --5
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring", --5
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape", --7
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
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- Specific gear for spells
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
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- BP Timer Gear
    sets.Midcast.BP = {
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Baayami Robe +1",
		hands="Baayami Cuffs",
		legs="Baayami Slops",
		feet="Baayami Sabots +1",
		neck="Smn. Collar +2",
		waist="Lucidity Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	sets.Midcast.Summon = set_combine(sets.Precast.FastCast, {
		body="Baayami Robe +1"
	})
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
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
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
		neck="Smn. Collar +2",
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
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
		neck="Smn. Collar +2",
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- Some magic pacts benefit more from TP than others.
	sets.Pet_Midcast.Magic_BP_TP = set_combine(sets.Pet_Midcast.Magic_BP, {
		legs="Enticer's Pants"
	})
	-- Similar to the Magic Set except Nirvana used
	sets.Pet_Midcast.FlamingCrush = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+19 Pet: "Mag.Atk.Bns."+19','Blood Pact Dmg.+10',}},
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck="Smn. Collar +2",
		waist="Incarnation Sash",
		left_ear="Lugalbanda Earring",
		right_ear="Kyrene's Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	sets.Pet_Midcast.SummoningMagic = {
		head="Baayami Hat",
		body="Baayami Robe",
		hands="Baayami Cuffs",
		legs="Baayami Slops",
		feet="Baayami Sabots",
		neck="Smn. Collar +2",
		waist="Lucidity Sash",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
	-- Perpetuation and Refresh Set
	sets.Idle.Pet = {
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body="Shomonjijoe +1",
		hands="Convo. Bracers +3",
		legs="Assid. Pants +1",
		feet="Baayami Sabots +1",
		neck="Smn. Collar +2",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
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

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end