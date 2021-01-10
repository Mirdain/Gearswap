
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "8"
MacroSet = "2"

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Modes for specific to Blue Mage
state.JobMode = M{['description']='Blue Mage Mode'}
state.JobMode:options('TP','Cleave')
state.JobMode:set('Cleave')

--Enable JobMode for UI
UI_Name = 'Mode'

--Command to bind to the f9 key
send_command('bind f9 gs c togglecleave')
--Log Message about what the key does
add_to_chat(8,'[F9] - '..UI_Name..' is ['..state.JobMode.value..']')

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons.TP = {
		main="Naegling",
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
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Thureous Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
    }
	sets.Movement = {
		legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    }

	sets.OffenseMode = {}
	sets.OffenseMode.TP = {}
	sets.OffenseMode.DT = {}
	sets.OffenseMode.ACC = {}

	sets.DualWield = {
		main="Naegling",
		sub={ name="Colada", augments={'Phys. dmg. taken -2%','Accuracy+23','Attack+23','DMG:+20',}},
	}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','HP+47',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Aya. Cosciales +2",
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
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

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	-- Default song duration / strength
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = { --Total = 15 merits + 84 gear = 99 - Cap is 105
	    ammo="Impatiens", --10
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --11
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, --20
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --16
		waist="Rumination Sash", --10
		left_ear="Magnetic Earring", --8
		right_ring="Evanescence Ring", --5
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}}, --4
	}
	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Hydrocera",
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		body="Malignance Tabard",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Incanter's Torque",
		waist="Gishdubar Sash",
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
    }
	-- Enhancing Skill
	sets.Midcast.Enhancing = {

	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {

	}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})
    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash"
	})
    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	sets.Midcast.Nuke = {
		ammo="Hydrocera",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body="Malignance Tabard",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Hermetic Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		waist="Chaac Belt",
	    head="Wh. Rarab Cap +1",
		body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
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