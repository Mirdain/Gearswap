
--Colonnello

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
state.WeaponMode:options('Decimation','Pangu','Unlocked', 'Locked')
state.WeaponMode:set('Decimation')

--Enable JobMode for UI.
UI_Name = 'Pet'

--Modes for specific Pets
state.JobMode:options('None','FatsoFargann','ScissorlegXerin','GenerousArthur','BlackbeardRandy','AcuexFamiliar')
state.JobMode:set('FatsoFargann')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- This uses a set Jug based off the Pet selected in the "JobMode"
	sets.Jugs = {}
	sets.Jugs['FatsoFargann'] = {ammo="C. Plasma Broth" }
	sets.Jugs['AcuexFamiliar'] = {ammo="Venomous Broth"}
	sets.Jugs['GenerousArthur'] = {ammo="Dire Broth"}
	sets.Jugs['BlackbeardRandy'] = {ammo="Meaty Broth"}
	sets.Jugs['ScissorlegXerin'] = {ammo="Spicy Broth"}


	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Decimation'] = {
		main="Dolichenus",
		sub="Ikenga's Axe",
	}

	sets.Weapons['Pangu'] = {
		main="Pangu",
		sub="Ikenga's Axe",
	}

	sets.Weapons.Shield = {
		--sub="Sacro Bulwark"
	}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe2", priority=1},
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
    }

	sets.Idle.Pet = {}

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		--feet="Hermes' Sandals",
	}

    -- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Gleti's Mask", augments={'Path: A',}},
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Bst. Collar +2",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear="Crep. Earring",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

	--Base TP set to build off
	sets.OffenseMode.TP = set_combine (sets.OffenseMode, {

	})
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP,{

	})
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP,{

	})

	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP,{

	})

	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.TP,{
		neck="Warder's Charm +1",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	-- Cap is 75% - 50% limit in I or II
	sets.OffenseMode.SB = {}

	set.DualWield = {
		left_ear="Eabani Earring",
		waist="Reiki Yotai",
	}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {}

	sets.Precast.Enmity = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	sets.Pet_Midcast = {
		sub="Agwu's Axe",
		ammo="Voluspa Tathlum",
		head="Nuk. Cabasset +3",
		neck="Bst. Collar +2",
		ear1="Sroda Earring",
		ear2="Nukumi Earring +1",
		body="Nukumi Gausape +3",
		hands="Nukumi Manoplas +3",
		ring1="Varar Ring +1",
		ring2="C. Palug Ring",
		waist="Incarnation Sash",
		legs="Tot. Trousers +3",
		feet="Tot. Gaiters +3"
	}
	sets.Pet_Midcast['Bone Crusher'] = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA['Familiar'] = set_combine(sets.Idle, {}) --legs="Ankusa Trousers +3"
	sets.JA['Charm'] = set_combine(sets.Idle, {})
	sets.JA['Gauge'] = set_combine(sets.Idle, {})
	sets.JA['Tame'] = set_combine(sets.Idle, {}) -- head="Totemic Helm +3"
	sets.JA['Reward'] = set_combine(sets.Idle, { ammo="Pet Food Theta",})
	sets.JA['Call Beast'] = set_combine(sets.Idle, {}) -- hands="Ankusa Gloves +3"
	sets.JA['Feral Howl'] = set_combine(sets.Idle, {})
	sets.JA['Unleash'] = set_combine(sets.Idle, {})
	sets.JA['Bestial Loyalty'] = set_combine(sets.Idle, {}) --hands="Ankusa Gloves +3"
	sets.JA['Killer Instinct'] = set_combine(sets.Idle, {}) --head="Ankusa Helm +3"

	-- Pet Commands
	sets.JA['Fight'] = set_combine(sets.Idle, {})
	sets.JA['Heel'] = set_combine(sets.Idle, {})
	sets.JA['Leave'] = set_combine(sets.Idle, {})
	sets.JA['Stay'] = set_combine(sets.Idle, {})
	sets.JA['Snarl'] = set_combine(sets.Idle, {})
	sets.JA['Ready'] = set_combine(sets.Idle, {})
	sets.JA['Spur'] = set_combine(sets.Idle, {}) -- feet="Nukumi Ocreae +3"
	sets.JA['Run Wild'] = set_combine(sets.Idle, {})	

	--Default WS set base
	sets.WS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Gleti's Mask", augments={'Path: A',}},
		body={ name="Gleti's Cuirass", augments={'Path: A',}},
		hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
		legs={ name="Gleti's Breeches", augments={'Path: A',}},
		feet={ name="Gleti's Boots", augments={'Path: A',}},
		neck="Bst. Collar +2",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Pet: "Dbl. Atk."+6',}},
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.WS.SB = set_combine( sets.WS, { -- This maximize SB

	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS,{})

	sets.WS.PDL = set_combine(sets.WS,{})

	--WS Sets
	sets.WS["Ragin Axe"] = set_combine(sets.WS,{})
	sets.WS["Smash Axe"] = set_combine(sets.WS,{})
	sets.WS["Gale Axe"] = set_combine(sets.WS,{})
	sets.WS["Avalanche Axe"] = set_combine(sets.WS,{})
	sets.WS["Spinning Axe"] = set_combine(sets.WS,{})
	sets.WS["Rampage"] = set_combine(sets.WS,{})
	sets.WS["Calamity"] = set_combine(sets.WS,{})
	sets.WS["Mistral Axe"] = set_combine(sets.WS,{})
	sets.WS["Decimation"] = set_combine(sets.WS,{})
	sets.WS["Bora Axe"] = set_combine(sets.WS,{})

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