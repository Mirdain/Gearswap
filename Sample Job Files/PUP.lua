
--Morwen

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "19"
MacroBook = "19"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- Set to true to run organizer on job changes
Organizer = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

--Modes for specific to Ninja
state.WeaponMode:options('God Hands','Pole','Club')
state.WeaponMode:set('God Hands')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['God Hands'] = {
		main="Godhands",
		range={ name="Neo Animator", augments={'Path: A',}},
		ammo="Automat. Oil +3",
	}

	sets.Weapons['Club'] = {}

	sets.Weapons['Pole'] = {}

	sets.Weapons.Shield = {}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Regal Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

	sets.Idle.Pet = {}
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDT = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
	}

    -- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		head="Mpaca's Cap",
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Combatant's Torque",
		waist="Moonbow Belt +1",
		left_ear="Mache Earring +1",
		right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Store TP"+4',}},
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.TP,{
		neck="Warder's Charm +1",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	-- Cap is 75% - 50% in either I or II
	sets.OffenseMode.SB = 
	{
		-- Belt SB II 15%
		-- Mpaca Legs SB II 5%
		-- Ring SB II 5%
		-- Earring SB I 6%
		head="Volte Tiara", -- 6%
		body="Malignance Tabard",
		hands="Volte Mittens", -- 6%
		legs="Mpaca's Hose", -- 5%
		feet="Volte Spats", -- 6%
		waist="Moonbow Belt +1", -- 15%
		left_ear="Mache Earring +1",
		right_ear="Kara. Earring +1", -- 6%
		left_ring="Niqmaddu Ring", -- 5%
		right_ring="Chirich Ring +1", -- 10%
		back={ name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {}

	sets.Precast.Enmity = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	sets.Pet_Midcast = {}
	sets.Pet_Midcast['Bone Crusher'] = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA['Overdrive'] = set_combine(sets.Idle, {})
	sets.JA['Activate'] = set_combine(sets.Idle, {})
	sets.JA['Repair'] = set_combine(sets.Idle, {})
	sets.JA['Role Reversal'] = set_combine(sets.Idle, {})
	sets.JA['Ventriloquy'] = set_combine(sets.Idle, {})
	sets.JA['Tactical Switch'] = set_combine(sets.Idle, {})
	sets.JA['Cooldown'] = set_combine(sets.Idle, {})
	sets.JA['Deus Ex Automata'] = set_combine(sets.Idle, {})
	sets.JA['Maintenance'] = set_combine(sets.Idle, {})
	sets.JA['Heady Artifice'] = set_combine(sets.Idle, {})

	-- Pet commands
	sets.JA['Deploy'] = set_combine(sets.Idle, {})
	sets.JA['Deactivate'] = set_combine(sets.Idle, {})
	sets.JA['Retrieve'] = set_combine(sets.Idle, {})
	sets.JA.Maneuver = set_combine(sets.Idle, {})

	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity

	--Default WS set base
	sets.WS = {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear="Mache Earring +1",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Visucius's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.WS.SB = set_combine( sets.WS, { -- This maximize SB

	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS,{})

	sets.WS.PDL = set_combine(sets.WS,{})

	--WS Sets
	sets.WS["Combo"] = set_combine(sets.WS,{})
	sets.WS["Shoulder Tackle"] = set_combine(sets.WS,{})
	sets.WS["One Inch Punch"] = set_combine(sets.WS,{})
	sets.WS["Backhand Blow"] = set_combine(sets.WS,{})
	sets.WS["Raging Fists"] = set_combine(sets.WS,{})
	sets.WS["Spinning Attack"] = set_combine(sets.WS,{})
	sets.WS["Howling Fist"] = set_combine(sets.WS,{})
	sets.WS["Dragon Kick"] = set_combine(sets.WS,{})
	sets.WS["Asuran Fists"] = set_combine(sets.WS,{})
	sets.WS["Tornado Kick"] = set_combine(sets.WS,{})
	sets.WS["Victory Smite"] = set_combine(sets.WS,{})
	sets.WS["Shijin Spiral"] = set_combine(sets.WS,{})

	sets.TreasureHunter = {

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
	if spell.name:contains('Maneuver') then
		equipSet = sets.JA.Maneuver
	elseif spell.type == 'WeaponSkill' then
		if state.OffenseMode.value == "MEVA" then
			equipSet = { neck="Warder's Charm +1", }
		end
	end
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

	return choose_gear()
end

-- Called when the pet dies or is summoned
function pet_change_custom(pet,gain)
	equipSet = {}

	return equipSet
end

-- Called during a pet midcast
function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end

-- Called after the performs an action
function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return choose_gear()
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return choose_gear()
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return choose_gear()
end
--Function is called when a self command is issued
function self_command_custom(command)

end
--Custom Function
function choose_gear()
	equipSet = {}

	return equipSet
end

function check_buff_JA()
	buff = 'None'
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

	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end