
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "7"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

--Modes for weapons.  You must define the set in sets.Weapons['X']
state.WeaponMode:options('Verethragna','Karambit','Pole','Club')
state.WeaponMode:set('Verethragna')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon sets
	sets.Weapons['Verethragna'] = {
		main={ name="Verethragna", augments={'Path: A',}},
	}
	sets.Weapons['Karambit'] = {
		main="Karambit",
	}
	sets.Weapons['Pole'] = {
		main="Malignance Pole",
		sub="Alber Strap",
	}
	sets.Weapons['Club'] = {
		main="Warp Cudgel",
	}

	-- Idle sets
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Adamantite Armor",
		hands={ name="Mpaca's Gloves", augments={'Path: A',}},
		legs={ name="Mpaca's Hose", augments={'Path: A',}},
		feet={ name="Mpaca's Boots", augments={'Path: A',}},
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		waist="Null Belt",
		left_ear="Sanare Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Purity Ring",
		right_ring="Shadow Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
    }
	sets.Idle.TP = sets.Idle
	sets.Idle.ACC = sets.Idle
	sets.Idle.DT = sets.Idle
	sets.Idle.PDL = sets.Idle
	sets.Idle.SB = sets.Idle
	sets.Idle.MEVA = sets.Idle

	-- Engaged Sets
	sets.OffenseMode = {}
	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Lehko's Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	}
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP,{
		head={ name="Mpaca's Cap", augments={'Path: A',}},
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands={ name="Mpaca's Gloves", augments={'Path: A',}},
		legs="Bhikku Hose +3",
		feet={ name="Mpaca's Boots", augments={'Path: A',}},
	})
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP,{
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	})
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.DT,{
	    ammo="Crepuscular Pebble",
		legs={ name="Mpaca's Hose", augments={'Path: A',}},
	})
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT,{
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
	})

	--This set is used when OffenseMode is SB and Enaged (Augments the TP base set)
	-- MNK gets 35 Native Subtle Blow
	-- Cap is 75% - 50% caps either I or II
	sets.OffenseMode.SB = set_combine(sets.OffenseMode[state.OffenseMode.value], {
		waist="Moonbow Belt +1", -- SB II 15
		left_ear="Sherida Earring", -- SB II 5
		left_ring="Niqmaddu Ring", -- SB II 5
		right_ring="Chirich Ring +1", -- SB 10
		ammo="Coiste Bodhar", -- SB 3
		right_ear={ name="Schere Earring", augments={'Path: A',}}, -- SB 3
	}) -- 35 + 16% SB I + %25 SB II = 76 one under

	-- Augments the OffenseMode when in DT stance
	sets.Foot_Work = { feet="Anch. Gaiters +3", }

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
	}

	--Impetus set has priority over any other modes
	sets.Impetus = {
		body="Bhikku Cyclas +3",
	}

	sets.Boost = {
		waist="Ask Sash",
	}

	-- Set to be used if you get cursed
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.Enmity = {
	    ammo="Sapience Orb", -- 2
		head="Null Masque",
		neck="Moonlight Necklace", -- 15
		body="Emet Harness +1", -- 10
		hands="Kurys Gloves", -- 9
		legs="Bhikku Hose +3",
		feet="Ahosi Leggings", -- 7
		waist="Plat. Mog. Belt",
	    left_ear="Cryptic Earring", -- 4
		right_ear="Trux Earring", -- 5
		left_ring="Eihwaz Ring", -- 5
		right_ring="Petrov Ring", -- 4
	} -- 61

	-- Used for Magic Spells
	sets.Precast = {}
	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6',}}, --13
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}}, --9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}}, --6
		feet={ name="Herculean Boots", augments={'"Fast Cast"+6',}}, --6
		neck="Voltsurge Torque", --4
		waist={ name="Plat. Mog. Belt", priority=2},
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Prolix Ring", --3
		right_ring="Rahab Ring", -- 2
		back={ name="Segomo's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, --10
	} -- FC 66

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	sets.JA = {}
	sets.JA["Hundred Fists"] = {legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}}}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Enmity
	sets.JA["Focus"] = {}
	sets.JA["Dodge"] = {}
	sets.JA["Chakra"] = {
		ammo="Iron Gobbet",
		head="Null Masque",
		body="Anch. Cyclas +3",
		hands={ name="Hes. Gloves +3", augments={'Enhances "Invigorate" effect',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Regal Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	}
	sets.JA["Boost"] = {}
	sets.JA["Counterstance"] = {}
	sets.JA["Chi Blast"] = {
		head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
	}
	sets.JA["Mantra"] = {}
	sets.JA["Footwork"] = {}
	sets.JA["Perfect Counter"] = {}
	sets.JA["Impetus"] = {}
	sets.JA["Inner Strength"] = {}

	--Default WS set base
	sets.WS = { -- VS Base with Impetus Down
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}},
	}

	-- 35% SB I for MNK
	-- Belt SB II 15%
	-- Mpaca Legs -- SB II 5%
	-- Earring / Ring SB II 10%
	-- Need 4% SB
	sets.WS.SB = set_combine( sets.WS, { -- This maximize SB
		waist="Moonbow Belt +1", -- SB II 15
		left_ear="Sherida Earring", -- SB II 5
		left_ring="Niqmaddu Ring", -- SB II 5
		legs="Mpaca's Hose", -- SB II 5
		ammo="Coiste Bodhar", -- SB 3
		right_ear={ name="Schere Earring", augments={'Path: A',}}, -- SB 3
	})

	sets.WS.MEVA = set_combine( sets.WS, { -- This maximize SB
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		left_ring="Defending Ring",
	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS,{})

	sets.WS.PDL = set_combine(sets.WS,{})

	sets.WS.Kicks = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		body="Ken. Samue +1",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs={ name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}},
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		--left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}},
	}

	--WS Sets
	sets.WS["Combo"] = set_combine(sets.WS,{})
	sets.WS["Shoulder Tackle"] = set_combine(sets.WS,{})
	sets.WS["One Inch Punch"] = set_combine(sets.WS,{})
	sets.WS["Backhand Blow"] = set_combine(sets.WS,{})
	sets.WS["Raging Fists"] = set_combine(sets.WS,{
		neck="Mnk. Nodowa +2",
		feet="Ken. Sune-Ate +1",
	})
	sets.WS["Spinning Attack"] = set_combine(sets.WS,{})
	sets.WS["Howling Fist"] = set_combine(sets.WS,{
		neck="Mnk. Nodowa +2",
		feet="Ken. Sune-Ate +1",
	})
	sets.WS["Dragon Kick"] = sets.WS.Kicks
	sets.WS["Asuran Fists"] = set_combine(sets.WS,{})
	sets.WS["Tornado Kick"] = sets.WS.Kicks
	sets.WS["Victory Smite"] = set_combine(sets.WS,{})
	sets.WS["Shijin Spiral"] = set_combine(sets.WS,{
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	})

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		body="Volte Jupon",
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
	if spell.type == 'WeaponSkill' then
		if buffactive.Impetus then
			equipSet = sets.Impetus
		end	
	end
	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}

	return choose_gear()
end

-- Called when the pet dies or is summoned
function pet_change_custom(pet,gain)
	local equipSet = {}

	return equipSet
end

-- Called during a pet midcast
function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end

-- Called after the performs an action
function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return choose_gear()
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return choose_gear()
end

--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return choose_gear()
end

--Function is called when a self command is issued
function self_command_custom(command)

end

--Custom Function
function choose_gear()
	local equipSet = {}
	if player.status == "Engaged" then
		if buffactive['Impetus'] then
			equipSet = sets.Impetus
		end	
		if buffactive['Footwork'] then
			equipSet = set_combine(equipSet, sets.Foot_Work)
		end	
	end
	if buffactive['Boost'] then
		equipSet = set_combine(equipSet, sets.Boost)
	end
	return equipSet
end

function check_buff_JA()
	local buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	-- Sub job has least priority
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	-- Mantra Max priority
	if player.hpp < 51 and ja_recasts[15] == 0 then
		buff = "Chakra"
	elseif not buffactive.Impetus and ja_recasts[31] == 0 then
		buff = "Impetus"
	elseif not buffactive.Footwork and ja_recasts[21] == 0 then
		buff = "Footwork"
	elseif not buffactive.Mantra and ja_recasts[19] == 0 then
		buff = "Mantra"
	elseif not buffactive.Dodge and ja_recasts[14] == 0 then
		buff = "Dodge"
	elseif not buffactive.Focus and ja_recasts[13] == 0 then
		buff = "Focus"
	end

	return buff
end

function check_buff_SP()
	local buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end