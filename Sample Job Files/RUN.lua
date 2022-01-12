
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Metallic Body','Mighty Guard'}
BlueTank = S{'Jettatura','Geist Wall','Blank Gaze','Sheep Song','Sandspin','Healing Breeze'}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA','AoE') -- ACC effects WS and TP modes

-- Function used to change pallets based off sub job and modes
function Macro_Sub_Job()
	local macro = 1
	if player.sub_job == "BLU" then
		state.OffenseMode:set('DT')
		--Set you macro pallet for when you are /BLU
		macro = 1
		send_command('wait 2;aset set tanking')
	else
		state.OffenseMode:set('DT')
		--Set you macro pallet for when you are NOT /BLU
		macro = 1
	end
	return macro
end

Buff_Delay = 4 -- Used this to slow down auto buffing
Tank_Delay = 4 -- delays between tanking actions (only used when auto-buffing enabled and target locked on)

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "12"
MacroSet = Macro_Sub_Job()

-- Set to true to run organizer on job changes
Organizer = true

--Modes for specific to Paladin.  These are defined below in "Weapons".
state.WeaponMode:options('Epeolatry','Naegling','Club')
state.WeaponMode:set('Epeolatry')

--Enable JobMode for UI.
UI_Name = 'Runes'
--Modes for specific to RUN
state.JobMode:options('None','Fire','Ice','Wind','Earth','Lighting','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode:set('None')

Runes = {
	Fire = {Name = "Ignis", Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"},
	Ice = {Name = "Gelus", Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"},
	Wind = {Name = "Flabra", Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"},
	Earth = {Name = "Tellus", Description = "[LIGHTING RESISTANCE] and deals [EARTH DAMAGE]"},
	Lighting = {Name = "Sulpor", Description = "[WATER RESISTANCE] and deals [LIGHTING DAMAGE]"},
	Water = {Name = "Unda", Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"},
	Light = {Name = "Lux", Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"},
	Dark = {Name = "Tenebrae", Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"},
	None = {Name = 'None', Description = "None"}
}

jobsetup (LockStylePallet,MacroBook,MacroSet)

-- HP balancing: 3000 HP
-- MP balancing: 950 MP

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Epeolatry'] = {
		main="Epeolatry",
		sub="Utu Grip",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
	}

	sets.Weapons['Club'] = {
		main={ name="Loxotic Mace +1", augments={'Path: A',}},
	}

	-- Standard Idle set
	sets.Idle = {
		ammo="Staunch Tathlum +1", -- 3/3
		head="Nyame Helm", -- 7/7
		body="Runeist's Coat +3",
		hands="Nyame Gauntlets", -- 7/7
		legs="Nyame Flanchard", -- 8/8
		feet="Nyame Sollerets", -- 7/7
		neck={ name="Futhark Torque +2", augments={'Path: A',}}, -- 7/7
		waist="Carrier's Sash",
		left_ear="Sanare Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}}, -- 3/5
		left_ring={ name="Moonlight Ring", bag="wardrobe3", priority=2}, -- 5/5
		right_ring={ name="Moonlight Ring", bag="wardrobe4", priority=1}, -- 5/5
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10/0
    } -- 75 PDT / 50 MDT		3161 HP/ 1095 MP

	sets.Idle.AoE = set_combine( sets.Idle, {
		waist="Flume Belt +1", -- 4/0
		left_ear={ name="Etiolation Earring", priority=3},
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2}, -- 3/5
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=4}, -- 7/-1
		right_ring={ name="Moonlight Ring", bag="wardrobe4", priority=1}, -- 5/5
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10/0
	})

	sets.Idle.MEVA = set_combine( sets.Idle, {
		ammo="Yamarang",
		waist="Carrier's Sash",
		left_ear="Sanare Earring",
		right_ear="Etiolation Earring",
	})

	-- This gear will be equiped when the player is moving and not engaged
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}, priority=1},
    } -- 73 PDT / 33 MDT		3028 HP / 963 MP

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe3", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe4", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	--DPS set for tanking
	sets.OffenseMode.TP = {
		ammo="Yamarang",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Runeist's Coat +3",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck={ name="Futhark Torque +2", augments={'Path: A',}, priority=1},
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring={ name="Regal Ring", priority=2},
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	} -- No fucks given

	-- Gear to swap in for ACC when TP
	sets.OffenseMode.ACC = set_combine(sets.TP, {
	    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		right_ring={ name="Moonlight Ring", bag="wardrobe3", priority=1},
	})

	--Physical Damage Taken set for tanking
	sets.OffenseMode.PDT = set_combine(sets.Idle, {
		ammo="Yamarang",
		body="Erilaz Surcoat +1",
		hands="Regal Gauntlets",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		back={ name="Ogma's cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}) -- Maintains Capped PDT with some DPS mixed in

	--Magic Evasion set for tanking
	sets.OffenseMode.MEVA = set_combine(sets.Idle,{
		ammo="Yamarang",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Nyame Flanchard",
		feet="Turms Leggings +1",
		waist="Carrier's Sash",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}) -- Focus on Magic Evasion with some DPS mixed in

	-- Standard Tanking TP set
	sets.OffenseMode.DT = set_combine(sets.Idle,{		
		ammo="Yamarang",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Ioskeha Belt +1",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		back={ name="Ogma's Cape", augments={'HP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})  -- 

	sets.OffenseMode.AoE = set_combine(sets.OffenseMode.PDT, {

	})

	sets.Precast = {}
	-- Used for Magic Spells

	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head="Rune. Bandeau +3", -- 14
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}}, -- 9
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+17','"Fast Cast"+6','STR+9',}}, -- 6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, priority=5}, -- 8
		neck="Voltsurge Torque", -- 4
		waist={ name="Kasiri Belt", priority=4},
		right_ear={ name="Tuisto Earring", priority=1},
		left_ear="Etiolation Earring", -- 1
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=2},
		right_ring={ name="Moonlight Ring", bag="wardrobe1", priority=3},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	} --62 FC

	sets.Precast.FastCast.Enhancing = set_combine(sets.Precast.FastCast, {
		waist="Siegel Sash",
	})

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
		ammo="Staunch Tathlum +1", -- 11
		head="Agwu's Cap", -- 10
		hands="Regal Gauntlets", -- 10
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}}, -- 20
		neck="Moonlight Necklace", -- 15
		waist="Audumbla Sash", -- 10
		left_ear="Magnetic Earring", -- 8
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}}, -- 10
	}	-- 104 With Merits

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	    head="Erilaz Galea +1",
		body="Nyame Mail",
		hands={ name="Regal Gauntlets", priority=2},
		legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
		feet="Nyame Sollerets",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe3"},
		right_ring={name="Stikini Ring +1", bag="wardrobe4"},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Idle, sets.Midcast.SIRD, {
	})

	sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
		head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}}, --7
	})

	sets.Midcast["Flash"] = set_combine(sets.Midcast.SIRD, sets.Enmity, {
	})

	-- Set used for hate generation on Job abilities
	sets.Enmity = { -- 23 Epo
		ammo="Sapience Orb", -- 2
		head="Nyame Helm",
		body="Emet Harness +1", -- 10
		hands="Kurys Gloves", -- 9
		legs="Eri. Leg Guards +1", -- 11
		feet="Ahosi Leggings", -- 7
		neck="Moonlight Necklace", -- 15
		waist="Kasiri Belt", -- 3
		left_ear={ name="Tuisto Earring", priority=2},
		right_ear="Cryptic Earring", -- 4
		left_ring="Eihwaz Ring", -- 5
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 10
	} -- 99 Enmity 2884 HP / 840 MP

	-- JOB ABILITIES --
	sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["Gambit"] = set_combine(sets.Enmity, { hands="Runeist's Mitons +3",})
    sets.JA["Rayke"] = set_combine(sets.Enmity, { feet="Futhark Boots +3" })
    sets.JA["Liement"] = set_combine(sets.Enmity, { body="Futhark Coat +3" })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
        legs="Futhark Trousers +3"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, { feet="Runeist Bottes +1" })
    sets.JA["Battuta"] = set_combine(sets.Enmity, { head="Futhark Bandeau +3" })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, { head="Erilaz Galea +1" })
    sets.JA["Embolden"] = set_combine(sets.Enmity, { back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+1',}},})
    sets.JA["Swordplay"] = set_combine(sets.Enmity, { hands="Futhark Mitons +3" })
	sets.JA["Provoke"] = sets.Enmity

	sets.Embolden = { back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+1',}},}

	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}
	sets.WS.DT = set_combine(sets.WS, {
	    head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	})

	--Great Sword WS
	sets.WS["Hard Slash"] = {}
	sets.WS["Frostbite"] = {}
	sets.WS["Freezebite"] = {}
	sets.WS["Shockwave"] = {}
	sets.WS["Crescent Moon"] = {}
	sets.WS["Sickle Moon"] = {}
	sets.WS["Spinning Slash"] = {}
	sets.WS["Herculean Slash"] = {}
	sets.WS["Resolution"] = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
	sets.WS["Dimidiation"] = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'AGI+6','Crit.hit rate+3','Quadruple Attack +2','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

	sets.TreasureHunter = {
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		feet={ name="Herculean Boots", augments={'Accuracy+11','"Subtle Blow"+2','"Treasure Hunter"+2',}},
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
	equipSet = set_combine(equipSet, Embolden_Check(spell))
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

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local ja_recasts = windower.ffxi.get_ability_recasts()
		local delay = os.clock() - JA_Delay

		if player.sub_job == 'SAM' then
			if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
				buff = "Hasso"
			end
		end

		if player.sub_job == 'WAR' then
			if not buffactive['Berserk'] and ja_recasts[1] == 0 then
				buff = "Berserk"
			elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
				buff = "Aggressor"
			elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
				buff = "Warcry"
			end
		end

		if buffactive[Runes[state.JobMode.value].Name] == 3 and windower.ffxi.get_player().target_locked then
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[23] == 0 and delay > 3 then
				buff = "Vallation" -- Next Single Target DT and FC
			end
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[113] == 0 then
				buff = "Valiance" -- AoE DT and FC
				JA_Delay = os.clock() -- Need to give Valiance a chance to register before Vallation is used
			end
		end

		--Rune sets
		if Runes[state.JobMode.value].Name ~= "None" then
			if ja_recasts[92] == 0 and buffactive[Runes[state.JobMode.value].Name] ~= 3 then
				buff = Runes[state.JobMode.value].Name
				info(Runes[state.JobMode.value].Description)
			end

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

		if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 100 then
			buff = "Crusade"
		elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 100 then
			buff = "Phalanx"
		elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 100 then
			buff = "Aquaveil"
		elseif not buffactive['Multi Strikes'] and sp_recasts[493] == 0 and player.mp > 36 then
			buff = "Temper"
		elseif not buffactive['Ice Spikes'] and sp_recasts[250] == 0 and player.mp > 16 then
			buff = "Ice Spikes"
		end

		if player.sub_job == "BLU" and player.sub_job_level > 8 then 
			if not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
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
		if player.status == "Engaged" or windower.ffxi.get_player().target_locked then
			local sp_recasts = windower.ffxi.get_spell_recasts()
			if sp_recasts[112] == 0 and player.mp > 25 then
				buff = "Flash"
			end
			if sp_recasts[840] == 0 and player.mp > 48 then
				buff = "Foil"
			end
		end
	end

	if buff ~= 'None' then
		tank_time = os.clock()
	end
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

-- Swaps back when embolden buff is active to extend duration
function Embolden_Check(spell)
	equipSet = {}
	if spell.target.name == player.name then
		if buffactive['Embolden'] then
			equipSet = sets.Embolden
			info('Embolden Set')
		end
	end
	return equipSet
end

