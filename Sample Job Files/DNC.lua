--Groverton

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "16"
MacroBook = "6"
MacroSet = "1"

--Uses Items Automatically
AutoItem = true

--Upon Job change will use a random lockstyleset
Random_Lockstyle = true

--Lockstyle sets to randomly equip
Lockstyle_List = {16,17,18}

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('DT','TP','SB','Farm') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

state.WeaponMode:options('Aeneas','Karambit')
state.WeaponMode:set('Aeneas')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Weapons = {}
	sets.Weapons['Terpsichore'] = {}
	sets.Weapons['Twashtar'] = {}
	sets.Weapons['Aeneas'] = {main="Aeneas", sub="Gleti's Knife",}
	sets.Weapons['Karambit'] = {main="Karambit",}

	sets.Idle = {}

	sets.Idle.DT = {
		ammo="Staunch Tathlum +1",
    	head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
    	neck={ name="Loricate Torque +1", augments={'Path: A',}},
    	waist="Flume Belt +1",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Infused Earring",
    	left_ring="Chirich Ring +1",
    	right_ring="Chirich Ring +1",
    	back="Sacro Mantle",
	}

	sets.Idle.TP = {
		ammo="Staunch Tathlum +1",
    	head="Gleti's Mask",
    	body="Gleti's Cuirass",
    	hands="Gleti's Gauntlets",
    	legs="Gleti's Breeches",
    	feet="Gleti's Boots",
    	neck={ name="Loricate Torque +1", augments={'Path: A',}},
    	waist="Flume Belt +1",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Infused Earring",
    	left_ring="Chirich Ring +1",
    	right_ring="Chirich Ring +1",
    	back="Sacro Mantle",
	}
	
	sets.Idle.SB = sets.Idle.DT
	
	sets.Idle.Farm = {
		ammo="Staunch Tathlum +1",
    	head="Nyame Helm",
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Nyame Gauntlets",
    	legs="Nyame Flanchard",
    	feet="Nyame Sollerets",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Silver Mog. Belt",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Tuisto Earring",
    	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    	right_ring="Moonlight Ring",
    	back="Moonlight Cape",
	}

	sets.Movement = {right_ring="Shneddick Ring",}

	sets.OffenseMode = {}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {
		ammo="Yamarang",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back="Sacro Mantle",
	}
	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    	legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    	feet="Malignance Boots",
    	neck="Anu Torque",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    	left_ear="Sherida Earring",
    	right_ear="Telos Earring",
    	left_ring="Gere Ring",
    	right_ring="Epona's Ring",
    	back="Sacro Mantle",
	}
	-- Subtle Blow Cap at 50 and II at 25 for a Total of 75.
	-- DNC Subtle Blow = 20/50 w/ Traits. Need +30 in Gear for SBI Cap.
	-- Subtle Blow I: 50/50 | Subtle Blow II:05/25 | DT:50/50 | ACC: High
	sets.OffenseMode.SB = {
		ammo="Yamarang",
    	head="Malignance Chapeau",
    	body="Malignance Tabard",
    	hands="Malignance Gloves",
    	legs="Malignance Tights",
    	feet="Malignance Boots",
    	neck="Anu Torque",
    	waist="Reiki Yotai",
    	left_ear="Sherida Earring", -- SBII+5
    	right_ear="Telos Earring",
    	left_ring="Chirich Ring +1", -- SB+10
    	right_ring="Chirich Ring +1", -- SB+10
    	back="Sacro Mantle", -- Ambu Cape has SB+10
	}

	sets.OffenseMode.Farm = {
		ammo="Staunch Tathlum +1",
    	head="Nyame Helm",
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Nyame Gauntlets",
    	legs="Nyame Flanchard",
    	feet="Nyame Sollerets",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Silver Mog. Belt",
    	left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    	right_ear="Tuisto Earring",
    	left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    	right_ring="Moonlight Ring",
    	back="Moonlight Cape",
	}

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {}
	--Dual Wield
	sets.OffenseMode.DW = {}

	sets.Precast = {}
	sets.Precast.FastCast = {}
	sets.Precast.Enmity = {}
	sets.Midcast = {}
	sets.Midcast.SIRD = {}
	sets.Midcast.Cure = {}
	sets.Midcast.Enhancing = {}
	sets.Midcast.Enfeebling = {}
	sets.Midcast["Stoneskin"] = {}

	-------------------  JA Sets  ----------------------
	sets.JA = {}

	sets.Waltzes = {    
		ammo="Yamarang",
    	head={ name="Horos Tiara +1", augments={'Enhances "Trance" effect',}},
    	body="Maxixi Casaque",
    	hands={ name="Horos Bangles +1", augments={'Enhances "Fan Dance" effect',}},
    	legs="Malignance Tights",
    	feet="Maxixi Toe Shoes",
    	neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    	waist="Chaac Belt",
    	left_ear="Enchntr. Earring +1",
    	right_ear="Cryptic Earring",
    	left_ring="Dawnsoul Ring",
    	right_ring="Asklepian Ring",
    	back="Moonlight Cape",
	}

	--When you combine with idle during JA's you'll get ~2 sec of high defense if not overwritten by specified gear
	sets.Samba = set_combine(sets.Idle.DT, {
		head="Maxixi Tiara",
	})

	sets.Jigs = set_combine(sets.Idle.DT, {
		feet="Maxixi Toe Shoes",
	})

	sets.Steps = set_combine(sets.Idle.DT, {

	})

	sets.JA["Animated Flourish"] = sets.Enmity

	sets.JA["Curing Waltz"] = sets.Waltzes
	sets.JA["Curing Waltz II"] = sets.Waltzes
	sets.JA["Curing Waltz III"] = sets.Waltzes
	sets.JA["Curing Waltz IV"] = sets.Waltzes
	sets.JA["Curing Waltz V"] = sets.Waltzes
	sets.JA["Divine Waltz"] = sets.Waltzes
	sets.JA["Divine Waltz II"] = sets.Waltzes
	sets.JA["Healing Waltz"] = sets.Waltzes

	sets.JA["Haste Samba"] = sets.Samba
	sets.JA["Aspir Samba"] = sets.Samba
	sets.JA["Aspir Samba II"] = sets.Samba
	sets.JA["Drain Samba"] = sets.Samba
	sets.JA["Drain Samba II"] = sets.Samba
	sets.JA["Drain Samba III"] = sets.Samba

	sets.JA["Quickstep"] = sets.Steps
	sets.JA["Box Step"] = sets.Steps
	sets.JA["Stutter Step"] = sets.Steps

	--Default WS set base
	sets.WS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    	head="Gleti's Mask",
    	body="Gleti's Cuirass",
    	hands="Meg. Gloves +2",
    	legs="Gleti's Breeches",
    	feet="Gleti's Boots",
    	neck="Anu Torque",
    	waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    	left_ear="Sherida Earring",
    	right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	left_ring="Gere Ring",
    	right_ring="Epona's Ring",
    	back="Sacro Mantle",
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	--WS Sets
	sets.WS["Wasp Sting"] = {}
	sets.WS["Viper Bite"] = {}
	sets.WS["Shadowstich"] = {}
	sets.WS["Gust Slash"] = {}
	sets.WS["Cyclone"] = {}
	sets.WS["Energy Steal"] = {}
	sets.WS["Energy Drain"] = {}
	sets.WS["Dancing Edge"] = {}
	sets.WS["Shark Bite"] = {}
	sets.WS["Evisceration"] = {
		ammo="Ginsen",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
    	body="Gleti's Cuirass",
    	hands="Gleti's Gauntlets",
    	legs="Gleti's Breeches",
    	feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Regal Ring",
		right_ring="Epona's Ring",
	}
	sets.WS["Aeolian Edge"] = {
		ammo="Yamarang",
    	head="Nyame Helm",
    	body={ name="Nyame Mail", augments={'Path: B',}},
    	hands="Nyame Gauntlets",
    	legs="Nyame Flanchard",
    	feet="Nyame Sollerets",
    	neck="Baetyl Pendant",
    	waist="Fotia Belt",
   		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    	right_ear="Friomisi Earring",
    	left_ring="Regal Ring",
    	right_ring="Ilabrat Ring",
    	back="Sacro Mantle",
	}

	sets.TreasureHunter = {head={ name="Herculean Helm", augments={'"Subtle Blow"+1','STR+3','"Treasure Hunter"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
	waist="Chaac Belt",}
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

	if player.sub_job == 'SAM' and player.sub_job_level > 8 then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		elseif not buffactive['Meditate'] and ja_recasts[134] == 0 then
			buff = "Meditate"
		end
	end

	if player.sub_job == 'WAR' and player.sub_job_level > 8 then
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