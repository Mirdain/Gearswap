
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "5"
MacroSet = "1"

--Modes for Auto Buff
state.AutoTank = M{['description']='Auto Tank Mode'}
state.AutoTank:options('OFF','ON')
state.AutoTank:set('OFF')

info('[F9] - Auto Tank is ['..state.AutoTank.value..']')


function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main="Burtgang",
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Hjarrandi Breast.",
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear="Etiolation Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }
	sets.Idle.Physical = {
	
	}

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb", --2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body="Rev. Surcoat +3", --10
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, 
		legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+5','INT+2',}}, --5
		feet={ name="Odyssean Greaves", augments={'Mag. Acc.+5','"Fast Cast"+6','CHR+8',}}, --13
		neck="Voltsurge Torque", --4
		waist="Acerbic Sash +1",
		left_ear="Enchntr. Earring +1", --2
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Rahab Ring", --2
		back={ name="Rudianos's Mantle", augments={'MND+20','"Fast Cast"+10',}}, --10
	}
	sets.Precast.Enmity = {
		main="Burtgang",
		ammo="Sapience Orb",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Eschite Gauntlets", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
		legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+8','Enmity+7','STR+6',}},
		feet={ name="Souveran Schuhs +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
		neck="Moonlight Necklace",
		waist="Creed Baudrier",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Apeile Ring +1",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
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
		ammo="Staunch Tathlum +1", --11
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands="Macabre Gaunt. +1",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, --20
		feet={ name="Odyssean Greaves", augments={'"Cure" potency +6%','MND+9','"Mag.Atk.Bns."+11',}}, --20
		neck="Moonlight Necklace", --15
		waist="Acerbic Sash +1",
		left_ear="Knightly Earring", --9
		right_ear="Nourish. Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'MND+20','"Fast Cast"+10',}},
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
		waist="Siegel Sash",
	}
	sets.JA = {}
	sets.JA["Invincible"] = {}
	sets.JA["Shield Bash"] = {body="Pumm. Lorica +2"}
	sets.JA["Holy Circle"] = {head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}}}
	sets.JA["Sentinel"] = {}
	sets.JA["Cover"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Rampart"] = {}
	sets.JA["Divine Emblem"] = {}
	sets.JA["Sepulcher"] = {}
	sets.JA["Palisade"] = {}
	sets.JA["Intervene"] = {}
	sets.JA["Majesty"] = {}
	sets.JA["Berserk"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}

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
		neck="War. Beads +2",
		waist="Tempus Fugit",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {

	}
	--This set is used when sub job is NIN/THF/DNC and Enaged (Augments the TP base set)
	--Leave blank if you dont want to change gear or equip a grip or shield
	sets.TP.DW = {
		body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}}, --9
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		left_ear="Suppanomimi",
	}
	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
		body="Hjarrandi Breast.",
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs={ name="Odyssean Cuisses", augments={'Attack+30','"Avatar perpetuation cost" -4','Weapon skill damage +7%',}},
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {
		ammo="Knobkierrie",
		head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
		body="Hjarrandi Breast.",
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs={ name="Odyssean Cuisses", augments={'Attack+30','"Avatar perpetuation cost" -4','Weapon skill damage +7%',}},
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.CRIT = {
	    ammo="Yetshila +1",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body="Hjarrandi Breast.",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Hetairoi Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--Axe WS
	sets.WS["Ragin Axe"] = {}
	sets.WS["Smash Axe"] = {}
	sets.WS["Gale Axe"] = {}
	sets.WS["Avalanche Axe"] = {}
	sets.WS["Spinning Axe"] = {}
	sets.WS["Rampage"] = {}
	sets.WS["Calamity"] = {}
	sets.WS["Mistral Axe"] = {}
	sets.WS["Decimation"] = sets.WS.CRIT
	sets.WS["Bora Axe"] = {}
	sets.WS["Cloudsplitter"] = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Custom sets for each jobsetup
	sets.Custom = {}

	sets.Custom.Physical = {
		sub="Ochain",
    }

	sets.Custom.Magic = {
		main="Burtgang",
		sub="Aegis",
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Hjarrandi Breast.",
		hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'Accuracy+13','Attack+12','Enmity+5',}},
		neck="Warder's Charm +1",
		waist="Asklepian Belt",
		left_ear="Sanare Earring",
		right_ear="Ethereal Earring",
		left_ring="Fortified Ring",
		right_ring="Archon Ring",
		back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }

	sets.TreasureHunter = {
	    hands={ name="Valorous Mitts", augments={'MND+8','Pet: Accuracy+15 Pet: Rng. Acc.+15','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
	    feet={ name="Valorous Greaves", augments={'Pet: STR+14','AGI+5','"Treasure Hunter"+1','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
		waist="Chaac Belt",
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