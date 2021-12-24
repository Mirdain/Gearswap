
--Elendnur

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "2"
MacroSet = "1"

--Uses Items Automatically
AutoItem = true

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {}

--Enable JobMode for UI
UI_Name = 'DPS'

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

state.OffenseMode = M{['description']='Engaged Mode'}
-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them
state.OffenseMode:options('DT','TP','PDL','ACC','SB') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

--Modes for specific to Dragoon
state.JobMode = M{['description']='Weapon Modes'}
state.JobMode:options('Trishula','Savage Blade','Staff')
state.JobMode:set('Trishula')

-- load addons
--send_command('lua l porterpacker')
--send_command('wait 2;input //po repack')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

function get_sets()
	-- Standard Idle set with -DT, Refresh and Regen gear

	sets.Weapons = {}

	sets.Weapons['Trishula'] = {
		main={ name="Trishula", augments={'Path: A',}},
		sub="Utu Grip",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="empty"
	}

	sets.Weapons['Staff'] = {
		main="Malignance Pole",
		sub="Utu Grip",
	}

	sets.Idle = {
	    ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Eabani Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	}

	sets.Idle.DT = set_combine(sets.Idle, {

	})

	--Regain set
	sets.Idle.TP = set_combine(sets.Idle, {

	})
	

	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
	}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Hjarrandi Breast.",
		hands="Flam. Manopolas +2",
		legs="Nyame Flanchard", --   Need Upgrade
		feet="Flam. Gambieras +2",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Moonlight Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	}

	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
	    head="Nyame Helm",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
	})
	
	--Same TP set but WSD can be altered also
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {

	})

	sets.OffenseMode.SB =  set_combine(sets.OffenseMode.TP, {

	})
	
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {

	})

	sets.DualWield = {}

	sets.Precast = {}

	-- Used for Magic Spells (Fast Cast)
	sets.Precast.FastCast = {
		ammo="Sapience Orb", --2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+44',}}, --9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		neck="Voltsurge Torque", --4
		left_ear="Etiolation Earring", --1
		left_ring="Weather. Ring", --5
	}
		
	sets.Enmity = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	}
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Third Eye"] = {}
	sets.JA["Meditate"] = {}
	sets.JA["Warding Circle"] = {}
	sets.JA["Hasso"] = {}
	sets.JA["Seigan"] = {}
	sets.JA['Call Wyvern'] = {body="Ptero. Mail +3"}
	sets.JA['Spirit Surge'] = {
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		legs="Vishap Brais +3",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
	}
	sets.JA['Ancient Circle'] = {legs="Vishap Brais +3"}
	sets.JA['Spirit Link'] = {
		head="Vishap Armet +3",
		hands="Pel. Vambraces",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck={ name="Dgn. Collar +2", augments={'Path: A',}},
	}

	sets.Jump = {
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		hands="Flam. Manopolas +2",
		legs="Gleti's Breeches",
		feet="Flam. Gambieras +2",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Crepuscular Ring",
		right_ring="Moonlight Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
	}

	sets.JA['Jump'] = set_combine(sets.Jump, {

	})
	
	sets.JA['High Jump'] = set_combine(sets.Jump, {

	})

	sets.JA['Spirit Jump'] = set_combine(sets.Jump, {

	})

	sets.JA['Soul Jump'] = set_combine(sets.Jump, {

	})
	
	sets.JA['Super Jump'] = set_combine(sets.Jump, {

	})
	
	sets.JA['Angon'] = {
		ammo="Angon",
		hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
	}

	--WS Sets
	sets.WS = {
		ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Rufescent Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Magic dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS, {

	})

	sets.WS.PDL = set_combine(sets.WS, {
	    head="Gleti's Mask",

	})

	sets.WS.WSD = set_combine(sets.WS, {
	    head="Gleti's Mask",
		left_ear="Thrud Earring",
	    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})

	sets.WS.CRIT = set_combine(sets.WS, {
	
	
	})

	sets.WS.Multi_Hit = set_combine(sets.WS, {
	
	
	})

	sets.WS["Camlann's Torment"] = sets.WS.CRIT
	sets.WS['Drakesbane'] = sets.WS.CRIT
	sets.WS['Geirskogul'] = sets.WS.CRIT
	sets.WS['Impulse Drive'] = sets.WS.CRIT
	sets.WS['Sonic Thrust'] = sets.WS.CRIT
	sets.WS['Stardiver'] = sets.WS.CRIT
	sets.WS['Raiden Thrust'] = sets.WS.WSD
	sets.WS['Thunder Thrust'] = sets.WS.WSD
	sets.WS['Leg Sweep'] = sets.WS.WSD
	sets.WS['Savage Blade'] = sets.WS.WSD
	
-- Wyvern Ability Gear Sets Below
	sets.Pet_Midcast = {}

	sets.Pet_Midcast['Steady Wing'] = {}

	sets.Pet_Midcast['Smiting Breath'] = {
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
    	neck="Adad Amulet",}

	sets.Pet_Midcast['Restoring Breath'] = {
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
    	legs="Vishap Brais +3",
    	feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
    	neck={ name="Dgn. Collar +2", augments={'Path: A',}},}

	sets.Pet_Midcast.Breath = {
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
    	neck="Adad Amulet",}

	sets.Pet_Midcast['Flame Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Frost Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Sand Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Gust Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Hydro Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Lightning Breath'] = sets.Pet_Midcast.Breath
	 
-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
		legs={ name="Valorous Hose", augments={'Accuracy+29','Pet: Haste+1','"Treasure Hunter"+2',}},
		feet={ name="Valorous Greaves", augments={'"Store TP"+4','Pet: VIT+7','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
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

	return Weapon_Check(equipSet)
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return Weapon_Check(equipSet)
end
--Function is called when a self command is issued
function self_command_custom(command)

end
--Function is called when a lua is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if player.sub_job == 'SAM' and player.sub_job_level == 49 then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		elseif not buffactive['Meditate'] and ja_recasts[134] == 0 then
			buff = "Meditate"
		end
	end

	if player.sub_job == 'WAR' and player.sub_job_level == 49 then
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

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])

	return equipSet
end