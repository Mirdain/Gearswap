
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "8"
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueACC = S{'Cruel Joke','Dream Flower'}
BlueHealing = S{'Magic Fruit','Healing Breeze','Wild Carrot','Plenilune Embrace'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Weapons specific to Blue Mage
state.WeaponMode:options('Almace','Naegling','Black Halo','Cleave')
state.WeaponMode:set('Black Halo')

--Enable JobMode for UI
UI_Name = 'Mode'

--Modes for specific to Blue Mage
state.JobMode:options('AoE','Melee')
state.JobMode:set('Melee')

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Almace'] = {
		main="Almace",
		sub="Zantetsuken",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Zantetsuken",
		--sub={ name="Machaera +2", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Black Halo'] = {
	    main="Maxentius",
		sub="Bunzi's Rod",
	}

	sets.Weapons['Cleave'] = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
    }

	-- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe3", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe4", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Gleti's Mask", augments={'Path: A',}},
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring={ name="Chirich Ring +1", bag="wardrobe2",},
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.OffenseMode.DT = set_combine ( sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		left_ring="Defending Ring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	})

	sets.OffenseMode.ACC = set_combine ( sets.OffenseMode.DT,{
	
	})

	sets.OffenseMode.PDL = set_combine ( sets.OffenseMode.DT,{
	
	})

	sets.OffenseMode.MEVA = set_combine ( sets.OffenseMode.DT,{
		left_ring={ name="Chirich Ring +1", bag="wardrobe1", priority=2},
		right_ring={ name="Chirich Ring +1", bag="wardrobe2", priority=1},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		neck="Warder's Charm +1",
	})

	sets.OffenseMode.SB = set_combine ( sets.OffenseMode.TP,{
		left_ring={ name="Chirich Ring +1", bag="wardrobe1", priority=2},
		right_ring={ name="Chirich Ring +1", bag="wardrobe2", priority=1},
	})

	sets.DualWield = {
		left_ear="Eabani Earring",
		waist="Reiki Yotai",
	}


	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb", --2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+40',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs="Aya. Cosciales +2", --6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		neck="Voltsurge Torque", -- 4
		waist="Witful Belt", --3
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weather. Ring", --5
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}}, --10
	} -- 76

	-- Job Abilities
	sets.JA = {}
	sets.JA["Azure Lore"] = {}
	sets.JA["Chain Affinity"] = {}
	sets.JA["Burst Affinity"] = {}
	sets.JA["Diffusion"] = {}
	sets.JA["Efflux"] = {}
	sets.JA["Unbridled Learning"] = {}
	sets.JA["Unbridled Wisdom"] = {}

	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, { })
	sets.Step = set_combine(sets.OffenseMode.DT, {})
	sets.Samba = set_combine(sets.Idle.DT, {})
	sets.Waltz = set_combine(sets.OffenseMode.DT, {
		ammo="Yamarang", -- 5
		body={ name="Gleti's Cuirass", augments={'Path: A',}}, -- 10
		hands="Slither Gloves +1", -- 5
		legs="Dashing Subligar", -- 10
	}) -- 30% Potency


	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = { --Total = 15 merits + 84 gear = 99 - Cap is 105
		ammo="Staunch Tathlum +1", -- 11
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --11
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',},}, -- 20
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --16
		waist="Rumination Sash", --10
	}

	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Hashishin Mintan +3",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs="Hashishin Tayt +3",
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Incanter's Torque",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear={ name="Hashi. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
		left_ring="Lebeche Ring",
		right_ring="Menelaus's Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
    } --35 %

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	    ammo="Staunch Tathlum +1",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mimir Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=1},
		left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {

	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {
		waist="Gishdubar Sash"
	})

    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	})

	sets.Midcast["Cruel Joke"] = set_combine(sets.Midcast.Enhancing, {
	    ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Crep. Earring",
		right_ear="Hermetic Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	})

	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet="Hashi. Basmak +3",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.WS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Hashishin Kavuk +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS['Black Halo'] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Hashishin Kavuk +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
		body="Volte Jupon",
		ammo="Per. Lucky Egg",
	}

	sets.Diffusion = {
	    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
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
	if spell.type == 'WeaponSkill' then
		if state.OffenseMode.value == "MEVA" then
			equipSet = set_combine(equipSet, { neck="Warder's Charm +1", })
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
	if command == 'jobmode' then
		if state.JobMode.value == 'AoE' then
			send_command('input //aset spellset magic;input /macro book 8;wait .1; input /macro set 2')
		else
			send_command('input //aset spellset tp;input /macro book 8;wait .1; input /macro set 1')
		end
	end
end

-- Function is called when the job lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	local sp_recasts = windower.ffxi.get_spell_recasts()
	if not buffactive['Phalanx'] and sp_recasts[517] == 0 and player.mp >= 19 then
		buff = "Metallic Body"
	elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 12 then
		buff = "Aquaveil"
	elseif not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
		buff = "Cocoon"
	end
	return buff
end