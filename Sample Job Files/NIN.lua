
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "10"
MacroBook = "1"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Enable JobMode for UI
UI_Name = 'DPS'

--Modes for specific to Ninja
state.JobMode = M{['description']='Ninja Damage Mode'}
state.JobMode:options('Kannagi', 'Naegling', 'Aeolian Edge')
state.JobMode:set('Kannagi')

elemental_ws = S{'Aeolian Edge', 'Blade: Teki', 'Blade: To','Blade: Chi','Blade: Ei','Blade: Yu'}

UtsusemiSpell = S{'Utsusemi: San','Utsusemi: San', 'Utsusemi: San'}

jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Kannagi'] = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Gokotai",
	}

	sets.Weapons['Aeolian Edge'] = {
		main={ name="Ternion Dagger +1", augments={'Path: A',}},
		sub="Levante Dagger",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
		ammo="Happo Shuriken +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Gere Ring",
		right_ring="Ilabrat Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Parrying rate+5%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
		ammo="Happo Shuriken +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Gere Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Parrying rate+5%',}},
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	}
	sets.DualWield = {}
	--Default WS set base
		sets.WS = set_combine(sets.OffenseMode.TP, {
		waist="Reiki Yotai",
	})

	sets.Utsusemi ={}
	sets.Utsusemi.Midcast = {
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		feet="Hattori Kyahan +1",
	}
	sets.Utsusemi.Precast = {
	    --body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}}
	}
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Ilabrat Ring",
		back="Moonbeam Cape",
    }

	--Defined below based off time of day
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    left_ring="Saida Ring",
		right_ring="Saida Ring",
		waist="Gishdubar Sash",
	}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}},
		feet={ name="Herculean Boots", augments={'"Fast Cast"+6',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	sets.Precast.Enmity = {
	    neck="Moonlight Necklace", --10
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}}, --8
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs="Malignance Tights",
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Moonlight Necklace",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	-- High MAB for spells
	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs="Malignance Tights",
		feet={ name="Mochi. Kyahan +3", augments={'Reduces elem. ninjutsu III cast time',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {waist="Siegel Sash",}
	sets.Midcast["Utsusemi: Ichi"] = sets.Utsusemi.Midcast
	sets.Midcast["Utsusemi: Ni"] = sets.Utsusemi.Midcast
	sets.Midcast["Utsusemi: San"] = sets.Utsusemi.Midcast

	sets.JA = {}
	sets.JA["Futae"] = {hands="Hattori Tekko"}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Mijin Gakure"] = {}
	sets.JA["Yonin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Innin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Issekigan"] = {}
	sets.JA["Mikage"] = {}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {	    
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	}
	sets.WS.CRIT = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
		ammo="Yetshila +1",
		head="Hachiya Hatsu. +3",
		body="Ken. Samue +1",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Ken. Sune-Ate +1",
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Regal Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.WS.MAB = {
		ammo="Yamarang",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body="Mummu Jacket +2",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Malignance Tights",
		feet="Hachi. Kyahan +1",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring +1",
		right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}


	--WS Sets
	sets.WS["Blade: Rin"] = sets.WS.CRIT
	sets.WS["Blade: Retsu"] = {}
	sets.WS["Blade: Teki"] = sets.WS.MAB
	sets.WS["Blade: To"] = sets.WS.MAB
	sets.WS["Blade: Chi"] = sets.WS.MAB
	sets.WS["Blade: Ei"] = set_combine(sets.WS.MAB, {head="Pixie Hairpin +1", left_ring="Archon Ring"})
	sets.WS["Blade: Jin"] = sets.WS.CRIT
	sets.WS["Blade: Ten"] = {}
	sets.WS["Blade: Ku"] = {}
	sets.WS["Blade: Kamu"] = {}
	sets.WS["Blade: Yu"] = sets.WS.MAB
	sets.WS["Blade: Hi"] = sets.WS.CRIT
	sets.WS["Blade: Shun"] = {}

	sets.TreasureHunter = {
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		feet={ name="Herculean Boots", augments={'Accuracy+11','"Subtle Blow"+2','"Treasure Hunter"+2',}},
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
	if UtsusemiSpell:contains(spell.name) then
		equipSet = sets.Utsusemi.Precast
	end

	equipSet = Elemental_check(equipSet, spell)

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	return Weapon_Check(equipSet)
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	return Weapon_Check(equipSet)
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	NIN_Movement()
	return Weapon_Check(equipSet)
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	return Weapon_Check(equipSet)
end
--Function is called by the gearswap command
function self_command_custom(command)
	if command == "wave1" then
		state.JobMode:set('Kannagi')
		equip(set_combine(choose_set(),choose_set_custom()))
	elseif command == "wave2" then
		state.JobMode:set('Kannagi')
		equip(set_combine(choose_set(),choose_set_custom()))
	elseif command == "wave3" then
		state.JobMode:set('Kannagi')
		equip(set_combine(choose_set(),choose_set_custom()))
	elseif command == "aoe" then
		state.JobMode:set('Aeolian Edge')
		equip(set_combine(choose_set(),choose_set_custom()))
	end
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
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

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])
	if DualWield == false then
		equipSet = set_combine(equipSet,sets.Weapons.Shield)
	end
	return equipSet
end

function Elemental_check(equipSet, spell)
	-- This function swaps in the Orpheus or Hachirin as needed
	if elemental_ws:contains(spell.name) then
		-- Matching double weather (w/o day conflict).
		if spell.element == world.weather_element and world.weather_intensity == 2 then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'Weather is Double ['.. world.weather_element .. '] - using Hachirin-no-Obi')
		-- Matching day and weather.
		elseif spell.element == world.day_element and spell.element == world.weather_element then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			-- Target distance less than 6 yalms
		elseif spell.target.distance < (6 + spell.target.model_size) then
			equipSet = set_combine(equipSet, {waist="Orpheus's Sash",})
			windower.add_to_chat(8,'Distance is ['.. round(spell.target.distance,2) .. '] using Orpheus Sash')
		-- Match day or weather.
		elseif spell.element == world.day_element or spell.element == world.weather_element then
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
		end
	end
	return equipSet
end

--used to register the time change to equip correct feet
windower.register_event('time change', function(time)
     NIN_Movement()
end)

function NIN_Movement ()
	if world.time >= 17*60 or world.time <= 7*60 then
		sets.Movement = {feet="Hachi. Kyahan +1"}
	else
		sets.Movement = {feet="Danzo Sune-Ate"}
	end
end