
-- Luthien

-- Load and initialize the include file.
include('Mirdain-Include')

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA','AoE') -- ACC effects WS and TP modes

--Enable JobMode for UI - Once locked-on and auto buff enabled it will do enmity actions
UI_Name = 'Auto Tank'
UI_Name2 = 'Runes'

Buff_Delay = 2 -- Used this to slow down auto buffing
Tank_Delay = 1 -- delays between tanking actions (only used when auto-buffing enabled and target locked on)

--Modes for specific to Paladin.  These are defined below in "Weapons".
state.WeaponMode:options('Burtgang','Naegling','Club','Shining One')
state.WeaponMode:set('Burtgang')

-- Function used to change pallets based off sub job and modes
function Macro_Sub_Job()
	local macro = 1
	if player.sub_job == "BLU" then
		state.OffenseMode:set('DT')
		macro = 1
		send_command('wait 2;aset set tanking')
	elseif player.sub_job == "RUN" then
		macro = 1
	else
		state.OffenseMode:set('DT')
		macro = 1
	end
	return macro
end

-- Blue spells used for tanking (Azureset)

--[[
    <tanking>
        <slot01>healing breeze</slot01>
        <slot02>sheep song</slot02>
        <slot03>wild carrot</slot03>
        <slot04>pollen</slot04>
        <slot05>terror touch</slot05>
        <slot06>grand slam</slot06>
        <slot07>cocoon</slot07>
        <slot08>jettatura</slot08>
        <slot09>blank gaze</slot09>
        <slot10>screwdriver</slot10>
        <slot11>geist wall</slot11>
        <slot12>sandspin</slot12>
    </tanking>
]]--

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit', 'Healing Breeze','Pollen', 'Wild Carrot'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{'Jettatura','Blank Gaze','Sheep Song','Geist Wall'}

-- Used when /RUN

--Modes for specific to /RUN
state.JobMode2:options('None','Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode2:set('None')

Runes = {
	Fire = {Name = "Ignis", Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"},
	Ice = {Name = "Gelus", Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"},
	Wind = {Name = "Flabra", Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"},
	Earth = {Name = "Tellus", Description = "[LIGHTNING RESISTANCE] and deals [EARTH DAMAGE]"},
	Lightning = {Name = "Sulpor", Description = "[WATER RESISTANCE] and deals [LIGHTNING DAMAGE]"},
	Water = {Name = "Unda", Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"},
	Light = {Name = "Lux", Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"},
	Dark = {Name = "Tenebrae", Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"},
	None = {Name = 'None', Description = "None"}
}

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "13"
MacroBook = "5"
MacroSet = Macro_Sub_Job()

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--
-- HP balancing: 2800 HP
-- MP balancing: 900 MP
--

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Burtgang'] = {
		main={ name="Burtgang", augments={'Path: A',}},
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
	}

	sets.Weapons['Club'] = {
		main="Beryllium Mace +1",
	}

	sets.Weapons['Shining One'] = {
		main="Shining One",
		sub="Alber strap",
	}

	--Default Shield
	sets.Weapons.Shield = {}

	-- Standard Idle set
	sets.Idle = {
		ammo="Homiliary",
		head="Sakpata's Helm", -- 7
		body={ name="Sakpata's Plate", augments={'Path: A',}}, -- 10
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}}, -- 8
		legs="Sakpata's Cuisses", -- 9
		feet="Sakpata's Leggings", -- 6
		neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=1},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}}, -- 3
		right_ear="Sanare Earring",
		left_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe2", priority=3},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Mag. Evasion+15',}, priority=4},
	}

	sets.Idle.TP = set_combine( sets.Idle, {})

	sets.Idle.DT = set_combine( sets.Idle, {
		sub="Aegis",
		ammo="Staunch Tathlum +1",
	})

	sets.Idle.PDT = set_combine( sets.Idle, {
		sub="Ochain",
	    waist="Flume Belt +1",
		right_ear="Ethereal Earring",
	})

	sets.Idle.MEVA = set_combine( sets.Idle, {
		sub="Aegis",
		ammo="Staunch Tathlum +1",
		neck="Warder's Charm +1",
		right_ear="Sanare Earring",
		waist="Plat. Mog. Belt",
	})

	sets.MEVA = set_combine( sets.Idle.MEVA, {
		sub="Aegis",
		ammo="Staunch Tathlum +1",
		neck="Warder's Charm +1",
		right_ear="Sanare Earring",
		waist="Plat. Mog. Belt",
	})

	sets.Idle.AoE = set_combine( sets.Idle, {
		waist="Flume Belt +1",
	})

	sets.Movement = {
		ammo="Staunch Tathlum +1",
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
		right_ear="Chev. Earring +1",
    }

	-- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Eshmun's Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Eshmun's Ring", bag="wardrobe2", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = set_combine( sets.Idle, {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Hjarrandi Helm",
		body="Dagon Breast.",
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck={ name="Vim Torque +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Telos Earring",
		right_ear="Crep. Earring",
		left_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe2", priority=3},
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	})

	--Base TP set to build off
	sets.OffenseMode.TP = set_combine( sets.OffenseMode, {

	})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine( sets.OffenseMode, {

	})

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine( sets.OffenseMode, {
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	})

	--This set is used when OffenseMode is PDT and Enaged (Augments the TP base set)
	sets.OffenseMode.PDT = set_combine( sets.Idle.PDT, {
		waist="Flume Belt +1",
		left_ear="Ethereal Earring",
	})

	--This set is used when OffenseMode is MEVA and Enaged (Augments the TP base set)
	sets.OffenseMode.MEVA = set_combine( sets.Idle.MEVA, {
		left_ear="Telos Earring",
		right_ear="Chev. Earring +1",
		left_ring="Lehko's Ring",
		back="Null Shawl",
	})

	--This set is used when OffenseMode is AoE and Enaged (Augments the TP base set)
	sets.OffenseMode.AoE = set_combine( sets.Idle.AoE, {

	})

	sets.Enmity = { -- Goal is 200 total -Crusade is 30 and Burtang is 23
		ammo="Sapience Orb", -- 2
		head={ name="Loess Barbuta +1", augments={'Path: A',}}, -- 24
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=1}, -- 20
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=2}, -- 9
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=3}, -- 9
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=4}, -- 9
		neck="Moonlight Necklace", -- 15
		waist="Creed Baudrier", -- 5
		left_ear="Trux Earring", -- 5
		right_ear="Cryptic Earring", -- 5
		left_ring="Apeile Ring +1", -- 9
		right_ring="Eihwaz Ring", -- 5
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Mag. Evasion+15',}}, -- 10
	} -- 127 in gear with Burtang (163 with Crusade)

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = { -- 61 FC with 3029/890
		ammo="Sapience Orb", -- 2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		body="Rev. Surcoat +3", -- 10
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs={ name="Odyssean Cuisses", augments={'"Fast Cast"+6','Accuracy+13','Attack+2',}}, -- 6
		feet={ name="Odyssean Greaves", augments={'Rng.Acc.+14','MND+8','"Fast Cast"+6','Accuracy+19 Attack+19',}}, -- 11
		neck="Voltsurge Torque", -- 4
		waist={ name="Plat. Mog. Belt", priority=1},
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear="Etiolation Earring", -- 1
		left_ring="Weather. Ring", -- 5
		right_ring="Kishar Ring", -- 4
		back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}}, -- 10
	}

	-- Augments the base Fast Cast set when a cure spell is used
	sets.Precast.Cure = {
		left_ring="Rahab Ring",
	}
	-- Augments the base Fast Cast set when a cure or raise is used.
	sets.Precast.QuickMagic = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine( sets.Idle, {
	
	})

	--This set is used in conjuction with set_combine
	sets.Midcast.SIRD = {
		ammo="Staunch Tathlum +1", -- 11
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 20
		legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}}, -- 30
		neck="Moonlight Necklace", -- 15
		waist="Audumbla Sash", -- 10
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Spell interruption rate down-10%',}}, -- 10
	} -- 96 +10 merits = 106

	-- Cure Set (special SIRD set)
	sets.Midcast.Cure = {
		ammo="Staunch Tathlum +1", -- 11 SIRD / 3 DT
		head={ name="Sakpata's Helm", augments={'Path: A',}}, -- 7 DT / 5 Cure
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}}, -- 8 DT
		legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}}, -- 30 SIRD
		feet={ name="Odyssean Greaves", augments={'"Cure" potency +6%','MND+9','"Mag.Atk.Bns."+11',}}, -- 20 SIRD / 13 Cure
		neck="Moonlight Necklace", -- 15 SIRD
		waist={ name="Plat. Mog. Belt", priority=2}, -- 3 DT
		left_ear={ name="Nourish. Earring +1", augments={'Path: A',}}, -- 5 SIRD / 6 Cure
		right_ear="Chev. Earring +1", -- 3 DT / 11 Cure
		left_ring={ name="Moonlight Ring", bag="wardrobe1", priority=1}, -- 5 DT
		right_ring="Defending Ring", -- 10 DT
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Spell interruption rate down-10%',}}, -- 10 SIRD / 10 Cure
	} -- 91 + 10 Merits = 101 SIRD / 49 DT / 56 Cure

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
		legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
		feet="Sakpata's Leggings",
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Chev. Earring +1",
		left_ring={ name="Moonlight Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe2", priority=3},
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	sets.Midcast.Divine = set_combine( sets.Idle, sets.Enmity, sets.Midcast.SIRD, {
	
	})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}

	sets.Midcast["Phalanx"] = set_combine( sets.Idle, sets.Midcast.SIRD, {
		hands="Regal Gauntlets",
		legs="Sakpata's Cuisses",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=4}, -- 9
	})


	sets.Midcast["Reprisal"] = { -- Block rate is based off HP
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands="Regal Gauntlets",
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Plat. Mog. Belt",
		left_ear="Tuisto Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
	}

	sets.Midcast["Flash"] = set_combine( sets.Idle, sets.Enmity, sets.Midcast.SIRD, {
	
	})

	sets.Cover = { 
		body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}}
	}

	sets.JA = {}
	sets.JA["Invincible"] = set_combine( sets.Enmity, { legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}} })
	sets.JA["Shield Bash"] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}} })
	sets.JA["Holy Circle"] = set_combine( sets.Enmity, { })
	sets.JA["Sentinel"] = set_combine( sets.Enmity, { feet={ name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}} })
	sets.JA["Cover"] = set_combine( sets.Enmity, { }) -- Need AF head
	sets.JA["Provoke"] = set_combine( sets.Enmity, { })
	sets.JA["Rampart"] = set_combine( sets.Enmity, { head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}} })
	sets.JA["Divine Emblem"] = set_combine( sets.Enmity, { })
	sets.JA["Sepulcher"] = set_combine( sets.Enmity, { })
	sets.JA["Palisade"] = set_combine( sets.Enmity, { })
	sets.JA["Intervene"] = set_combine( sets.Enmity, { })
	sets.JA["Iron Will"] = set_combine( sets.Enmity, { head={ name="Cab. Coronet +3", augments={'Enhances "Iron Will" effect',}} })
	sets.JA["Fealty"] = set_combine( sets.Enmity, { body={ name="Cab. Surcoat +3", augments={'Enhances "Fealty" effect',}} })
	sets.JA["Chivalry"] = set_combine( sets.Enmity, { hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}} })
	sets.JA["Majesty"] = set_combine( sets.Enmity, { })
	sets.JA["Berserk"] = set_combine( sets.Enmity, { })
	sets.JA["Defender"] = set_combine( sets.Enmity, { })
	sets.JA["Aggressor"] = set_combine( sets.Enmity, { })

	--Default WS set base
	sets.WS = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Cornelia's Ring",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Swift Blade"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Atonement"] = sets.Enmity
	sets.WS["Chant du Cygne"] = {}
	sets.WS["Requiescat"] = {}

	--Custom sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		body="Volte Jupon",
		waist="Chaac Belt",
	}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

buff_time = os.clock()
tank_time = os.clock()
JA_Delay = os.clock()

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
		if buffactive['Rampart'] and (spell.type == 'WhiteMagic' or spell.type == 'BlueMagic') then
			equipSet = sets.Midcast.Rampart
		end
		if state.OffenseMode.value == 'MEVA' and not spell.name:contains('Cure') then
			equipSet = set_combine(equipSet, sets.MEVA)
		end
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

	if buffactive['Cover'] and gain then
		equipSet = sets.Cover
	end

	if name == "Rampart" and not gain then
		send_command('input /ap Rampart [OFF]')
	elseif name == "Sentinel" and not gain then
		send_command('input /p Sentinel [OFF]')
	elseif name == "Invincible" and not gain then
		send_command('input /p Invincible [OFF]')
	end

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	 if buffactive['Cover'] then
		equipSet = sets.Cover
	 end
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

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local ja_recasts = windower.ffxi.get_ability_recasts()

		if player.sub_job == 'SAM' and player.sub_job_level > 24 then
			if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 and player.sub_job_level > 24 then
				buff = "Hasso"
			end
		end

		if player.sub_job == 'WAR' then
			if not buffactive['Berserk'] and ja_recasts[1] == 0 and player.sub_job_level > 14 then
				buff = "Berserk"
			end
			if not buffactive['Aggressor'] and ja_recasts[4] == 0 and player.sub_job_level > 44 then
				buff = "Aggressor"
			end
			if not buffactive['Warcry'] and ja_recasts[2] == 0 and player.sub_job_level > 34 then
				buff = "Warcry"
			end
		end

		if player.sub_job == 'RUN' then
			--Rune sets
			if Runes[state.JobMode2.value].Name ~= "None" and player.sub_job_level > 4 then
				if ja_recasts[92] == 0 and buffactive[Runes[state.JobMode2.value].Name] ~= 2 then
					buff = Runes[state.JobMode2.value].Name
					info(Runes[state.JobMode2.value].Description)
				end
			end
		end

		if not buffactive['Majesty'] and ja_recasts[150] == 0 and player.main_job_level > 69 then
			buff = "Majesty"
		end

		if buff ~= 'None' then
			buff_time = os.clock()
		end
	end
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local sp_recasts = windower.ffxi.get_spell_recasts()
		if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 18 and player.main_job_level > 87 then
			buff = "Crusade"
		elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 21 and player.main_job_level > 76 then
			buff = "Phalanx"
		elseif not buffactive['Reprisal'] and sp_recasts[97] == 0 and player.mp > 25 and player.main_job_level > 60 then
			buff = "Reprisal"
		elseif not buffactive['Enlight'] and sp_recasts[274] == 0 and player.mp > 25 and player.main_job_level > 84 then
			buff = "Enlight II"
		end
		if player.sub_job == "BLU" then
			if not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 and player.sub_job_level > 8 then
				buff = "Cocoon"
			end
		end
		if buff ~= 'None' then
			buff_time = os.clock()
		else
			buff = check_tank()
		end
	end
	return buff
end

function check_tank()
	buff = 'None'
	if os.clock() - tank_time > Tank_Delay then
		if (player.status == "Engaged" or windower.ffxi.get_player().target_locked) and state.JobMode.value == "ON" then
			local sp_recasts = windower.ffxi.get_spell_recasts()
			local ja_recasts = windower.ffxi.get_ability_recasts()
			if sp_recasts[112] == 0 and player.mp > 25 and player.main_job_level > 36 then
				buff = "Flash"
			elseif ja_recasts[46] == 0 and state.JobMode.value == "ON" and player.main_job_level > 14 then
				buff = "Shield Bash"
			elseif ja_recasts[159] == 0 and player.mp < 150 and player.tp > 2000 and state.JobMode.value == "ON" and player.main_job_level > 14 then
				buff = "Chivalry"
			elseif sp_recasts[840] == 0 and player.mp > 48 and player.sub_job == "RUN" and player.sub_job_level > 57 then
				buff = "Foil"
			end
		end
	end

	if buff ~= 'None' then
		tank_time = os.clock()
	end
	return buff
end

-- Function is called when the job lua is unloaded
function user_file_unload()

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