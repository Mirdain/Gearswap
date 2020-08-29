
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "5"
MacroSet = "1"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for Auto Buff
state.AutoTank = M{['description']='Auto Tank Mode'}
state.AutoTank:options('OFF','ON')
state.AutoTank:set('OFF')

info('[F9] - Auto Tank is ['..state.AutoTank.value..']')

--
-- PLD Set focus around ~3.2k HP and ~900 MP
--

function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main="Burtgang",
		sub="Ochain",
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',} , priority=2},
		body="Sacro Breastplate",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=1},
		neck="Moonlight Necklace",
		waist="Flume Belt +1",
		left_ear="Ethereal Earring",
		right_ear={ name="Tuisto Earring", priority=3},
		left_ring="Defending Ring",
		right_ring={ name="Moonlight Ring", priority=4},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }
	sets.Enmity = { -- Goal is 200 total -Crusaade is 30
	    ammo="Sapience Orb", --2
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		neck="Moonlight Necklace", --15
		waist="Creed Baudrier", --5
		left_ear="Trux Earring", --5
		right_ear="Cryptic Earring", --4
		left_ring="Apeile Ring +1", -- ~5-9
		right_ring="Eihwaz Ring", -- 5
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}}, --10
	}
	sets.Idle.Physical = {
	
	}
	sets.Idle.Magic = {
	
	}

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = { -- ~54 FC with 3046/899
		ammo="Sapience Orb", --2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body="Rev. Surcoat +3", --10
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		neck="Voltsurge Torque", --4
		waist= {name="Creed Baudrier", priority=4},
		left_ear={ name="Etiolation Earring", priority=1}, --1
		right_ear={ name="Tuisto Earring", priority=2},
		left_ring="Weather. Ring", --5
		right_ring={ name="Moonlight Ring", priority=3},
		back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, --10
	}
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	    ammo="Staunch Tathlum +1", --11
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
		legs={ name="Founder's Hose", augments={'MND+7','Mag. Acc.+10','Attack+10',}}, --30
		feet={ name="Odyssean Greaves", augments={'Attack+1','"Fast Cast"+6',}},
		waist="Rumination Sash", --10
		neck="Moonlight Necklace", --15
		left_ear="Magnetic Earring", --8
	}
	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
		feet={ name="Odyssean Greaves", augments={'"Cure" potency +6%','MND+9','"Mag.Atk.Bns."+11',}},
		neck="Sacro Gorget",
		waist="Audumbla Sash",
		left_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
		right_ear="Tuisto Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.Midcast["Phalanx"] = {
		ammo="Staunch Tathlum +1",
		head={ name="Odyssean Helm", augments={'Pet: "Dbl. Atk."+1','CHR+4','Phalanx +3','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		body={ name="Odyss. Chestplate", augments={'Magic dmg. taken -1%','Attack+25','Phalanx +3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Odyssean Greaves", augments={'"Cure" potency +6%','MND+9','"Mag.Atk.Bns."+11',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear={ name="Etiolation Earring", priority=1},
		right_ear={ name="Tuisto Earring", priority=2},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast["Flash"] = sets.Enmity

	sets.JA = {}
	sets.JA["Invincible"] = sets.Enmity
	sets.JA["Shield Bash"] = sets.Enmity
	sets.JA["Holy Circle"] = sets.Enmity
	sets.JA["Sentinel"] = sets.Enmity
	sets.JA["Cover"] = sets.Enmity
	sets.JA["Provoke"] = sets.Enmity
	sets.JA["Rampart"] = sets.Enmity
	sets.JA["Divine Emblem"] = sets.Enmity
	sets.JA["Sepulcher"] = sets.Enmity
	sets.JA["Palisade"] = sets.Enmity
	sets.JA["Intervene"] = sets.Enmity
	sets.JA["Majesty"] = sets.Enmity
	sets.JA["Berserk"] = sets.Enmity
	sets.JA["Defender"] = sets.Enmity
	sets.JA["Aggressor"] = sets.Enmity

	--Base TP set to build off
	sets.TP = {
	    ammo="Ginsen",
		head="Hjarrandi Helm",
		body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Cessance Earring",
		right_ear="Digni. Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		waist="Tempus Fugit",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {

	}
	--This set is used when sub job is NIN/THF/DNC and Enaged (Augments the TP base set)
	--Leave blank if you dont want to change gear or equip a grip or shield
	sets.TP.DW = {

	}
	--Default WS set base
	sets.WS = {

	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Swift Blade"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Atonemente"] = sets.Enmity
	sets.WS["Chant du Cygne"] = {}
	sets.WS["Requiescat"] = {}

	--Custom sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
		waist="Chaac Belt",
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
	if command == 'custom' then
		if state.AutoTank.value == 'OFF' then
			if windower.ffxi.get_mob_by_target( 't' ).valid_target == true then
				Enemy_ID = windower.ffxi.get_mob_by_target('t').id
				info('Enemy Set to ['..windower.ffxi.get_mob_by_target('t').name..']')
				state.AutoTank:set('ON')
				state.AutoBuff:set('ON')
			else
				info('Must target an Enemy')
			end
		else
			state.AutoTank:set('OFF')
			state.AutoBuff:set('OFF')
		end
		info('Auto Tank is ['..state.AutoTank.value..']')
		info('Auto Buff is ['..state.AutoBuff.value..']')
	end
end
-- Function is called when the job lua is unloaded
function user_file_unload()

end