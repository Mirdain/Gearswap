
--Salidar

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "8"
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Modes for specific to Corsair
state.JobMode = M{['description']='Blue Mage Mode'}
state.JobMode:options('TP','Cleave') -- Can add Crit for Armageddon
state.JobMode:set('Cleave')

--Enable JobMode for UI
UI_Name = 'Mode'

-- Set to true to run organizer on job changes
Organizer = true

--Command to bind to the f9 key
send_command('bind f9 gs c togglecleave')
--Log Message about what the key does
add_to_chat(8,'[F9] - '..UI_Name..' is ['..state.JobMode.value..']')

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons.TP = {
		main="Almace",
		sub="Zantetsuken",
	}

	sets.Weapons.Cleave = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Shamash Robe",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Tuisto Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
    }

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Malignance Boots",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Chirich Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.OffenseMode.DT = set_combine ( sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})

	sets.OffenseMode.ACC = set_combine ( sets.OffenseMode.DT,{
	
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

	sets.Midcast = {}
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
		head="Nyame Helm",
		body="Nyame Mail",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}}, -- 10
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}}, --12
		neck="Incanter's Torque",
		waist="Gishdubar Sash", -- 10% recieved
		left_ear="Mendi. Earring", --5
		right_ear="Regal Earring",
		left_ring="Lebeche Ring", -- 3
		right_ring="Menelaus's Ring", --5
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
	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Hecate's Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}},
	}

	sets.WS = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Odr Earring",
		left_ring="Epona's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
		body={ name="Herculean Vest", augments={'DEX+11','Accuracy+7','"Treasure Hunter"+1',}},
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

	return equipSet
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

	return Weapon_Check(equipSet)
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return Weapon_Check(equipSet)
end
--Function is called when a self command is issued
function self_command_custom(command)
	if command == 'togglecleave' then
		weaponcheck()
		for i,v in ipairs(state.JobMode) do
			if state.JobMode.value == v then
				if state.JobMode.value ~= state.JobMode[#state.JobMode] then
					state.JobMode:set(state.JobMode[i+1])
					send_command('input //aset spellset magic;input /macro book 8;wait .1; input /macro set 2')
				else
					state.JobMode:set(state.JobMode[1])
					send_command('input //aset spellset tp;input /macro book 8;wait .1; input /macro set 1')
				end
				info('Mode: ['..state.JobMode.value..']')
				equip(set_combine(choose_set(),choose_set_custom()))
				return
			end
		end
	end
end

 function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])
	if DualWield == false then
		equipSet = set_combine(equipSet,sets.Weapons.Shield)
	end
	return equipSet
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
	buff = ''
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end