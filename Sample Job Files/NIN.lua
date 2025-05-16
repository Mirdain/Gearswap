
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "10"
MacroBook = "1"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT)
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

--Modes for specific to Ninja
state.WeaponMode:options('Kannagi','Savage Blade','Karambit','Aeolian Edge','Abyssea','Ninjitsu')
state.WeaponMode:set('Kannagi')

elemental_ws = S{'Aeolian Edge', 'Blade: Teki', 'Blade: To','Blade: Chi','Blade: Ei','Blade: Yu'}

jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Kannagi'] = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
	}

	sets.Weapons['Ninjitsu'] = {
		main="Tauret",
		sub="Gokotai",
	}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Blurred Knife +1",
	}

	sets.Weapons['Karambit'] = {
		main="Karambit",
		sub="empty",
	}

	sets.Weapons['Aeolian Edge'] = {
		main="Tauret",
		sub="Naegling",
	}

	sets.Weapons['Abyssea'] = {
		main="",
		sub="",
	}

	sets.Weapons.Shield = {}
	sets.Weapons.Sleep = {}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Eihwaz Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})

	--Defined below based off time of day
	sets.Movement = {}

	sets.Movement.Day = {
		feet="Danzo Sune-Ate",
	}
	sets.Movement.Night = {
		feet="Hachi. Kyahan +1",
	}
	sets.Movement.Dusk = {
		feet="Hachi. Kyahan +1",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe3", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe4", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo="Happo Shuriken +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Ken. Sune-Ate +1",
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Hattori Earring +1",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine (sets.OffenseMode.TP, {
	    head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine (sets.OffenseMode.TP, {
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	})
	sets.OffenseMode.PDL = set_combine (sets.OffenseMode.TP, {
	    head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})

	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT,{
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
	})

	sets.OffenseMode.SB = set_combine(sets.OffenseMode.DT,{ })

	sets.DualWield = {}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6',}}, --13
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}}, -- 6
		feet={ name="Herculean Boots", augments={'"Fast Cast"+6',}}, -- 6
		neck="Voltsurge Torque", -- 4
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring", -- 1
		right_ear="Loquac. Earring", -- 2
		left_ring="Kishar Ring", -- 4
		right_ring="Rahab Ring", -- 2
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, -- 10
	} -- 67

	sets.Precast.Utsusemi = {
		neck="Magoraga Beads", -- 10 FC (+6)
	}

	sets.Precast.QuickMagic = {

	}

	sets.Enmity = { -- Head and Back upgrade slots
		ammo="Sapience Orb", --2
		body="Emet Harness +1", --10
		hands="Kurys Gloves", --9
		--="Zoar Subligar +1", --6
		feet="Ahosi Leggings", --7
		neck="Moonlight Necklace", --15
		waist="Kasiri Belt", --3
		left_ear="Cryptic Earring", --4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", --4
		right_ring="Eihwaz Ring", --5
	}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})
	-- Utsusemi Set
	sets.Midcast.Utsusemi = {
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		feet="Hattori Kyahan +1",
	}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo="Hydrocera",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Moonlight Necklace",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Crep. Earring",
		left_ring={ name="Stikini Ring +1", bag="wardrobe1",},
		right_ring={ name="Stikini Ring +1", bag="wardrobe2",},
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	-- High MAB for spells
	sets.Midcast.Nuke = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Hermetic Earring",
    right_ear="Friomisi Earring",
	left_ring={ name="Stikini Ring +1", bag="wardrobe1",},
	right_ring={ name="Stikini Ring +1", bag="wardrobe2",},
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {waist="Siegel Sash",}

	sets.JA = {}
	sets.JA["Futae"] = {} --hands="Hattori Tekko"
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Enmity
	sets.JA["Mijin Gakure"] = {}
	sets.JA["Yonin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Innin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Issekigan"] = {}
	sets.JA["Mikage"] = {}

	--Default WS set base
	sets.WS = {
		ammo="Yetshila +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Odr Earring",
		right_ear="Ishvara Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS.WSD = set_combine({ sets.WS,
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring +1",
	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine({ sets.WS,	    
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	})

	sets.WS.CRIT = {
		ammo="Yetshila +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.WS.MAB = set_combine({ sets.WS,
		ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	})

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

	sets.WS["Asuran Fists"] = {
	    ammo="Yetshila +1",
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Odr Earring",
		left_ring="Hetairoi Ring",
		right_ring="Gere Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS["Savage Blade"] = {
	    ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Cornelia's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.TreasureHunter = {
	    head="Volte Cap",
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
--Function is called by the gearswap command
function self_command_custom(command)

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

Cycle_Time = 1
function Cycle_Timer()
	if world.time >= 17*60 or world.time <= 7*60 then
		if world.time >= (18*60) or world.time <= (6*60) then
			sets.Movement = set_combine(sets.Movement, sets.Movement.Night)
			log('Night Feet')
		else
			sets.Movement = set_combine(sets.Movement, sets.Movement.Dusk)
			log('Dusk Feet')
		end
	else
		sets.Movement = set_combine(sets.Movement, sets.Movement.Day)
		log('Day Feet')
	end
end

function pet_change_custom(pet,gain)
	equipSet = {}
	
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