--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "8"
MacroBook = "4"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- This determines if a WS set is augmented with a sash
Elemental_WS = S{'Aeolian Edge', 'Seraph Blade', 'Shining Blade','Red Lotus Blade', 'Burning Blade', 'Sanguine Blade', 'Energy Drain','Energy Steal','Cyclone','Gust Slash'}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','PDL','ACC','DT','PDT','MEVA','CRIT')

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

--Weapons options
state.WeaponMode:options('Chango','Shining One','Savage Blade','Decimation', 'Aeolian Edge', 'Ukonvasara','Unlocked')
state.WeaponMode:set('Chango')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Chango'] = {
		main={ name="Chango", augments={'Path: A',}},
		sub="Utu Grip",
	}
	sets.Weapons['Shining One'] = {
		main="Shining One",
		sub="Utu Grip",
	}
	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Zantetsuken",
	}
	sets.Weapons['Decimation'] = {
		main="Dolichenus",
		sub={ name="Digirbalag", augments={'"Dbl.Atk."+4','Accuracy+11','Attack+8',}},
	}
	sets.Weapons['Aeolian Edge'] = {
		main={ name="Ternion Dagger +1", augments={'Path: A',}},
		sub="Naegling",
	}
	sets.Weapons['Ukonvasara'] = {
		main={ name="Chango", augments={'Path: A',}},
		sub="Utu Grip",
	}
	-- This stops GS from chaning weapons (Abyssea Proc etc)
	sets.Weapons['Unlocked'] ={
		main={ name="Chango", augments={'Path: A',}},
		sub="Utu Grip",
	}
	-- This is used when you do not have dual wield and is not a two handed weapon
	sets.Weapons.Shield = {
		sub="Blurred Shield +1",
	}

	-- Base set for when the player is not engaged or casting.  Other sets build off this set
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

	sets.Idle.DT = {}
	sets.Idle.PDT = {}
	sets.Idle.MEVA = {}

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe3", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe4", priority=1},
		waist="Gishdubar Sash",
	}

	--WAR Double attack
	--28% Job Trait
	--5% Merits

	-- Sets the base equipset for OffenseMode
	sets.OffenseMode = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Flam. Zucchetto +2",
		body="Dagon Breast.",
		hands="Sakpata's Gauntlets",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.OffenseMode.TP = {}

	sets.OffenseMode.DT = {
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
	}

	sets.OffenseMode.PDL = {
		ammo="Crepuscular Pebble",
		right_ring="Sroda Ring",
	}

	--This set is used when OffenseMode is ACC and Enaged
	sets.OffenseMode.ACC = {}

	--This set is used when OffenseMode is CRIT and Engaged
	sets.OffenseMode.CRIT = {}

	--These base set are used when an aftermath is active and player is enaged and correct weapon type set (Augments the current OffenseMode)
	sets.OffenseMode.AM1 = {}
	sets.OffenseMode.AM2 = {}
	sets.OffenseMode.AM3 = {}

	sets.OffenseMode.AM1['Ukonvasara'] = {}
	sets.OffenseMode.AM2['Ukonvasara'] = {}
	sets.OffenseMode.AM3['Ukonvasara'] = {}

	sets.DualWield = {
		waist="Reiki Yotai",
		right_ear="Eabani Earring",
	}

	sets.Precast = set_combine(sets.Idle, {})

	-- For Cure Cast Time reduction
	sets.Precast.Cure = {}

	-- For Enhancing Cast Time reduction
	sets.Precast.Enhancing = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb", --2
		head="Sakpata's Helm", --8
		body="Sacro Breastplate", --10
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
		neck="Voltsurge Torque", -- 4
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", -- 3
		left_ring="Prolix Ring", -- 2
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
	} --44%

	-- For instant casts (Like Raises/Reraise)
	sets.Precast.QuickMagic = {}

	sets.Precast.Enmity = {
		ammo="Sapience Orb", -- 2
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --20
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --9
		neck="Moonlight Necklace", --15
		left_ear="Cryptic Earring", --4
		right_ear="Trux Earring", --5
		left_ring="Petrov Ring", --4
		right_ring="Eihwaz Ring", --5
	} --91

	sets.Precast['Utsusemi: Ichi'] = {}
	sets.Precast['Utsusemi: Ni'] = {}

	-- Ranged Attack
	sets.Precast.RA = {}
    sets.Precast.RA.ACC = {}
	sets.Precast.RA.Flurry = {}
	sets.Precast.RA.Flurry_II = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	    ammo="Staunch Tathlum +1", --11
		--feet={ name="Odyssean Greaves", augments={'Attack+1','"Fast Cast"+6',}}, --20
		neck="Moonlight Necklace", --15
		left_ear="Magnetic Earring", --8
		waist="Audumbla Sash", --10
	}

	-- Enhancing
	sets.Midcast.Enhancing = {}
	sets.Midcast.Enhancing.Others = {}
	
	-- Enfeebling
	sets.Midcast.Enfeebling = {}
	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = {}
	-- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = {}
	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = {}

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {}
    sets.Midcast.RA.ACC = {}
    sets.Midcast.RA.PDL = {}
	sets.Midcast.RA.CRIT = {}
	sets.Midcast.RA.AM3 = {}

	-- Healing
	sets.Midcast.Cure = {}
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.Regen = {}

	-- Dancer JA
	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, {})
	sets.Step = set_combine(sets.OffenseMode.DT, {})
	sets.Waltz = set_combine(sets.OffenseMode.DT, {})

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.Midcast['Utsusemi: Ichi'] = {}
	sets.Midcast['Utsusemi: Ni'] = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Mighty Strikes"] = {}
	sets.JA["Berserk"] = {body="Pumm. Lorica +3"}
	sets.JA["Warcry"] = {head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}}}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Tomahawk"] = {ammo="Thr. Tomahawk",} -- Need to add feet
	sets.JA["Retaliation"] = {}
	sets.JA["Restraint"] = {}
	sets.JA["Blood Rage"] = {}
	sets.JA["Brazen Rush"] = {}

	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
		body="Pumm. Lorica +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Thrud Earring",
		right_ear="Boii Earring +1",
		left_ring="Karieyh Ring +1",
		right_ring="Cornelia's Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	}
	sets.WS.RA = {}

	sets.WS.CRIT = {
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Hjarrandi Breast.",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		left_ring="Niqmaddu Ring",
		right_ring="Sroda Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.WS.CRIT.RA = {}

	sets.WS.WSD = {}
	sets.WS.WSD.RA = {}

	sets.WS.ACC = {}
	sets.WS.ACC.RA = {}

	sets.WS.SB = {}
	sets.WS.SB.RA = {}

	sets.WS.PDL = {}
	sets.WS.PDL.RA = {}

	--These set are used when a weaponskill is used with that level of aftermath with the correct weapon
	--They Augment any built weaponskill set
	sets.WS.AM1 = {}
	sets.WS.AM2 = {}
	sets.WS.AM3 = {}

	sets.WS.AM1['Ukonvasara'] = {}
	sets.WS.AM2['Ukonvasara'] = {}
	sets.WS.AM3['Ukonvasara'] = {}

	-- Set these
	sets.WS.AM1.RA = {}
	sets.WS.AM2.RA = {}
	sets.WS.AM3.RA = {}
	sets.WS.AM1.RA['Ukonvasara'] = {}
	sets.WS.AM2.RA['Ukonvasara'] = {}
	sets.WS.AM3.RA['Ukonvasara'] = {}

	--Axe WS
	sets.WS["Ragin Axe"] = {}
	sets.WS["Smash Axe"] = {}
	sets.WS["Gale Axe"] = {}
	sets.WS["Avalanche Axe"] = {}
	sets.WS["Spinning Axe"] = {}
	sets.WS["Rampage"] = {}
	sets.WS["Calamity"] = {}
	sets.WS["Mistral Axe"] = {}
	sets.WS["Decimation"] = sets.WS.CRIT
	sets.WS["Bora Axe"] = {}
	sets.WS["Cloudsplitter"] = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Polearm
	sets.WS["Impulse Drive"] = sets.WS.CRIT

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		waist="Chaac Belt",
		body="Volte Jupon",
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

function user_file_unload()
	
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if not buffactive['Berserk'] and ja_recasts[1] == 0 then
		buff = "Berserk"
	elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
		buff = "Aggressor"
	elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
		buff = "Warcry"
	end
	if player.sub_job == 'SAM' then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		end
	end
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end
