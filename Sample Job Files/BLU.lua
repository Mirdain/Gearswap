
--Colonnello

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "20"
MacroBook = "8"
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Weapons specific to Blue Mage
state.WeaponMode:options('Tizona','Naegling','Cleave')
state.WeaponMode:set('Tizona')

--Enable JobMode for UI
UI_Name = 'Mode'

--Modes for specific to Blue Mage
state.JobMode:options('AoE','Melee')
state.JobMode:set('Melee')

-- Set to true to run organizer on job changes
Organizer = false

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Tizona'] = {
		main={ name="Tizona", augments={'Path: A',}},
		sub={ name="Machaera +2", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub={ name="Machaera +2", augments={'TP Bonus +1000',}},
	}

	sets.Weapons.Cleave = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}, bag="wardrobe1"},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}, bag="wardrobe2"},
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Stikini Ring +1", bag="wardrobe1",},
		right_ring={ name="Stikini Ring +1", bag="wardrobe3",},
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
    }

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    }

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Malignance Tights",
		feet="Nyame Sollerets",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
	}

	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
	})

	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {

	})

	sets.DualWield = {
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		waist="Reiki Yotai",
	}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Staunch Tathlum",
		head="Jhakri Coronal +2",
		body="Hashishin Mintan +1",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Aya. Cosciales +2",
		feet="Nyame Sollerets",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Jhakri Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
	}
	-- Job Abilities
	sets.JA = {}
	sets.JA["Azure Lore"] = {}
	sets.JA["Chain Affinity"] = {}
	sets.JA["Burst Affinity"] = {}
	sets.JA["Diffusion"] = {}
	sets.JA["Efflux"] = {}
	sets.JA["Unbridled Learning"] = {}
	sets.JA["Unbridled Wisdom"] = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}
	-- Cure Set
	sets.Midcast.Cure = {

    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {

	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {

	}

	sets.Midcast.Nuke = {

	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",

	})
    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {

	})
    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	})


	sets.WS = {
		ammo="Crepuscular Pebble",
		head="Gleti's Mask",
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
		feet="Gleti's Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Karieyh Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS, {
	
	})

	sets.WS.WSD = set_combine(sets.WS, {
	
	})

	sets.WS.CRIT = set_combine(sets.WS, {
	
	})

	--Sword WS
	sets.WS["Fast Blade"] = sets.WS.WSD
	sets.WS["Burning Blade"] = sets.WS.WSD
	sets.WS["Red Lotus Blade"] = sets.WS.WSD
	sets.WS["Flat Blade"] = sets.WS.WSD
	sets.WS["Shining Blade"] = sets.WS.WSD
	sets.WS["Seraph Blade"] = sets.WS.WSD
	sets.WS["Circle Blade"] = sets.WS.WSD
	sets.WS["Spirits Within"] = sets.WS.WSD
	sets.WS["Vorpal Blade"] = sets.WS.WSD
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = sets.WS.WSD
	sets.WS["Requiescat"] = sets.WS.WSD
	sets.WS["Chant du Cygne"] = sets.WS.CRIT
	sets.WS["Expiacion"] = sets.WS.WSD

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
	    head="Wh. Rarab Cap +1",
		hands={ name="Herculean Gloves", augments={'STR+9','Mag. Acc.+16','"Treasure Hunter"+2','Accuracy+14 Attack+14',}},
	}

	sets.Diffusion = {
	    feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
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
	buff = ''
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