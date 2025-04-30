
--Elendnur

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "15"
MacroBook = "2"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Set to true to run organizer on job changes
Organizer = true

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them
state.OffenseMode:options('DT','TP','PDL','ACC','SB') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

--Weapon Modes
state.WeaponMode:options('Scythe','Great Sword','Sword','Club','Axe')
state.WeaponMode:set('Scythe')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Scythe'] = {
		main="Anguta",
		sub="Utu Grip",
	}

	sets.Weapons['Great Sword'] = {
		--main={ name="Trishula", augments={'Path: A',}},
		sub="Utu Grip",
	}

	sets.Weapons['Sword'] = {
		main="Naegling",
		sub={ name="Ternion Dagger +1", augments={'Path: A',}},
	}

	sets.Weapons['Club'] = {
		main={ name="Loxotic Mace +1", augments={'Path: A',}},
		sub="Blurred Shield +1",
	}

	sets.Weapons['Axe'] = {
		main="Dolichenus",
		sub={ name="Ternion Dagger +1", augments={'Path: A',}},
	}

	sets.Weapons.Shield = 
	{
		sub="Blurred Shield +1",
	}

	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Etiolation Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Moonlight Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
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
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Flam. Gambieras +2",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Moonlight Ring",
		right_ring="Niqmaddu Ring",
		back="Null Shawl",
	}

	--Base TP set to build off
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {

	})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		feet="Sakpata's Leggings",
	})
	
	--Same TP set but WSD can be altered also
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode, {

	})

	-- This caps with Auspice from WHM
	sets.Subtle_Blow = {
		body="Dagon Breast.",
		feet="Sakpata's Leggings",
		hands="Sakpata's Gauntlets",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
	}

	sets.OffenseMode.SB =  set_combine(sets.OffenseMode.DT, sets.Subtle_Blow, {

	})
	
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {

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
	
	})

	sets.Midcast.SIRD = {}

	sets.Midcast.Enfeebling = set_combine(sets.Midcast, {
	
	})

	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
	
	})

	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
	
	})

	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {
	
	})

	sets.Midcast.Enfeebling.Drain = set_combine(sets.Midcast.Enfeebling, {
	
	})

	sets.Midcast.Enfeebling.Aspir = set_combine(sets.Midcast.Enfeebling, {
	
	})
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Blood Weapon"] = {}
	sets.JA["Souleater"] = {}
	sets.JA["Arcane Circle"] = {}
	sets.JA["Weapon Bash"] = {}
	sets.JA["Nether Void"] = {}
	sets.JA["Arcane Crest"] = {}
	sets.JA["Scarlet Delirium"] = {}
	sets.JA["Soul Enslavement"] = {}
	sets.JA["Consume Mana"] = {}


	--WS Sets
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Nyame Helm", augments={'Path: B',}}, -- Need Heathen
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS, {

	})

	sets.WS.PDL = set_combine(sets.WS, {


	})

	sets.WS.WSD = set_combine(sets.WS, {

	})

	sets.WS.CRIT = set_combine(sets.WS, {
	
	})

	sets.WS.Multi_Hit = set_combine(sets.WS, {
	
	})

	sets.WS.SB = set_combine(sets.Subtle_Blow, {
	
	})

	sets.WS['Catastrophe'] = set_combine(sets.WS, { 
		left_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})

	sets.WS['Origin'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})

	sets.WS['Entropy'] = set_combine(sets.WS, { 
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	})

	sets.WS['Quietus'] = set_combine(sets.WS, { 
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})

	sets.WS['Cross Reaper'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ring="Regal Ring",
	})

	sets.WS['Insurgency'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ring="Regal Ring",
	})

	sets.WS['Torcleaver'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})

	sets.WS['Fimbulvetr'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ring="Regal Ring",
	})

	sets.WS['Scourge'] = set_combine(sets.WS, { 
		left_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ring="Regal Ring",
	})

	sets.WS['Resolution'] = set_combine(sets.WS, { 
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		left_ring="Sroda Ring",
	})

	sets.WS['Judgment'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck={ name="Abyssal Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
	})


-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		legs="Volte Hose",
	    feet="Volte Boots",
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