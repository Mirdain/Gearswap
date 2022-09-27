
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "4"
MacroBook = "10"
MacroSet = "1"

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','SB','PDL') -- ACC effects WS and TP modes

--Set default mode (TP,ACC,DT,PDL) etc
state.OffenseMode:set('DT')

--Weapons specific to Samurai
state.WeaponMode:options('Masamune', 'Dojikiri', 'Shining One', 'Yoichinoyumi')
state.WeaponMode:set('Masamune')

jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Dojikiri'] = {
		main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
		sub="Utu Grip",
	}

	sets.Weapons['Masamune'] = {
		main={ name="Masamune", augments={'Path: A',}},
		sub="Utu Grip",
	}
	
	sets.Weapons['Yoichinoyumi'] = {
		main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
		sub="Utu Grip",
		range="Yoichinoyumi",
		ammo="Yoichi's Arrow",
	}

	sets.Weapons['Shining One'] = {
		main="Shining One",
		sub="Utu Grip",
	}

	--Default arrow to use
	Ammo.RA = "Yoichi's Arrow"

	-- Standard Idle set with -DT, Refresh and Regen gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Defending Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

	sets.Movement = {
		feet="Danzo Sune-Ate"
    }

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe3", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe4", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Flam. Zucchetto +2",
		body="Kasuga Domaru +2",
		hands="Ken. Tekko +1",
		legs="Kasuga Haidate +2",
		feet="Ken. Sune-Ate +1",
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		head="Kasuga Kabuto +2",
		hands="Mpaca's Gloves",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
		head="Kasuga Kabuto +2",
	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.SB = set_combine(sets.OffenseMode.TP, {
		-- 29 SB I and 5 SB II on TP gear
		head="Ken. Jinpachi +1",  --8
		body="Ken. Samue +1", -- 8
		waist="Sarissapho. Belt", -- 5
	})

	sets.Precast = {}

	-- 70 snapshot is Cap
	-- Rapid shot is like quick magic
	-- Snapshot is like Fast Cast

	-- True Shot Ranges (Increases RA and WS)
		-- Distances listed below are effected by Monster Size
		-- Gun ~6.5 yalms
		-- Short Bow ~8.6 yalms
		-- Crossbow ~10.7 yalms
		-- Long Bow ~ 11.8 yalms

	-- Flurry is 15% Snapshot
	-- Flurry II 30% Snapshot

	-- Snapshot / Rapidshot
	sets.Precast.RA = set_combine(sets.Precast, { -- 5 Snapshot on Perun +1 Augment if used
		ammo=Ammo.RA,
		waist="Yemaya Belt", -- 0 / 5
		right_ring="Crepuscular Ring", -- 3
    })	

	-- Only the bullet needs to be set for ACC sets (so that it will match the sets.Midcast.RA.ACC)
    sets.Precast.RA.ACC = set_combine(sets.Precast.RA, {
		ammo=Ammo.ACC,
    })

	-- Flurry - 55 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {

	}) 

	-- Flurry II - 40 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 

    })

	-- Used for Magic Spells (Fast Cast)
	sets.Precast.FastCast = set_combine (sets.Idle.DT, {
		ammo="Sapience Orb",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
	})

	sets.Precast.Enmity = set_combine (sets.Idle.DT, {
	    ammo="Sapience Orb", -- 2
		neck="Warder's Charm +1", -- 1-8 
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		waist="Kasiri Belt", -- 3
		left_ring="Petrov Ring", -- 4
		right_ring="Eihwaz Ring", -- 5
	})

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

		-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {

    })

	-- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
		ammo=Ammo.ACC,
    })

	-- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {

    })

	-- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {

    })
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Meikyo Shisui"] = {}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Third Eye"] = {}
	sets.JA["Meditate"] = {
	    head="Wakido Kabuto +3",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	sets.JA["Warding Circle"] = {
		head="Wakido Kabuto +3",
	}
	sets.JA["Shikikoyo"] = {}
	sets.JA["Hasso"] = {}
	sets.JA["Seigan"] = {}
	sets.JA["Sengikori"] = {}
	sets.JA["Hamanoha"] = {}
	sets.JA["Hagakure"] = {}
	sets.JA["Konzen-ittai"] = {}
	sets.JA["Yaegasumi"] = {}

	--Default Weapon Skill set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Thrud Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring +1",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine (sets.WS, {

	})

	sets.WS.SB = set_combine (sets.WS, {

	})

	--WS Sets
	sets.WS["Tachi: Enpi"] = {}
	sets.WS["Tachi: Hobaku"] = {}
	sets.WS["Tachi: Jinpu"] = set_combine (sets.WS, {
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
	})
	sets.WS["Tachi: Goten"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Kagero"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Koki"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Yukikaze"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Gekko"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Kasha"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Rana"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Ageha"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Fudo"] = set_combine (sets.WS, {})
	sets.WS["Tachi: Shoha"] = set_combine (sets.WS, {})

	sets.Seigan = {
	    head="Kasuga Kabuto +2",
		body="Kasuga Domaru +2",
	}
	sets.ThirdEye = {
		--legs={ name="Sakonji Haidate +3", augments={'Enhances "Shikikoyo" effect',}},
	}

	-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
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
	equipSet = choose_Seigan()
	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end

--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	equipSet = choose_Seigan()
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end

--Custom Function
function choose_Seigan()
	equipSet = {}
		if player.status == "Engaged" then
			if buffactive.Seigan then
				--Equip the Seigan custom set when active
				equipSet = sets.Seigan
				if buffactive["Third Eye"] then
					--Equip the Third Eye custom set when active
					equipSet = set_combine(equipSet, sets.ThirdEye)
				end
			end
		end
	return equipSet
end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
		buff = "Hasso"
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

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end