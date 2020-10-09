
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "10"
MacroBook = "1"
MacroSet = "1"

UtsusemiSpell = S{'Utsusemi: San','Utsusemi: San', 'Utsusemi: San'}

function get_sets()
	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.Custom.Utsusemi ={}
	sets.Custom.Utsusemi.Midcast = {
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
		feet="Hattori Kyahan +1",
	}
	sets.Custom.Utsusemi.Precast = {
	    --body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}}
	}
	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		main={ name="Kannagi", augments={'Path: A',}},
		sub="Gokotai",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Ilabrat Ring",
		back="Moonbeam Cape",
    }
	sets.Movement = {feet="Danzo Sune-Ate"}

	sets.Movement.Night = {feet="Hachi. Kyahan +1"}

	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'"Fast Cast"+5','MND+10','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+23','"Fast Cast"+6','VIT+4','"Mag.Atk.Bns."+1',}},
		neck="Voltsurge Torque",
		waist="Tempus Fugit",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	sets.Precast.Enmity = {
	    neck="Moonlight Necklace", --10
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}}, --8
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
	}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs="Malignance Tights",
		feet={ name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
		neck="Moonlight Necklace",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	-- High MAB for spells
	sets.Midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Hachiya Hatsu. +3",
		body="Malignance Tabard",
		hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
		legs="Malignance Tights",
		feet={ name="Mochi. Kyahan +3", augments={'Reduces elem. ninjutsu III cast time',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {waist="Siegel Sash",}
	sets.Midcast["Utsusemi: Ichi"] = sets.Custom.Utsusemi.Midcast
	sets.Midcast["Utsusemi: Ni"] = sets.Custom.Utsusemi.Midcast
	sets.Midcast["Utsusemi: San"] = sets.Custom.Utsusemi.Midcast

	sets.JA = {}
	sets.JA["Futae"] = {hands="Hattori Tekko"}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Mijin Gakure"] = {}
	sets.JA["Yonin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Innin"] = {head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}}}
	sets.JA["Issekigan"] = {}
	sets.JA["Mikage"] = {}

	--Base TP set to build off
	sets.TP = {
		ammo="Happo Shuriken +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue +1",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Ken. Sune-Ate +1",
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Hetairoi Ring",
		right_ring="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Parrying rate+5%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
		body="Malignance Tabard",
		legs="Malignance Tights",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {
	    head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
	}
	sets.TP.DW = {}
	--Default WS set base
	sets.WS = {
		ammo="Expeditious Pinion",
		head="Ken. Jinpachi +1",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands="Ken. Tekko +1",
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Ilabrat Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Parrying rate+5%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {	    
		head="Ken. Jinpachi +1",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		}
	sets.WS.CRIT = {
	    ammo="Yetshila +1",
		head="Hachiya Hatsu. +3",
		body="Ken. Samue +1",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Ninja Nodowa +2",
		waist="Windbuffet Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Brutal Earring",
		left_ring="Mummu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.WS.MAB = {
	    ammo="Pemphredo Tathlum",
		head={ name="Mochi. Hatsuburi +3", augments={'Enhances "Yonin" and "Innin" effect',}},
		body="Mummu Jacket +2",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Ken. Hakama +1",
		feet="Hachi. Kyahan +1",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hermetic Earring",
		left_ring="Karieyh Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	--WS Sets
	sets.WS["Blade: Rin"] = sets.WS.CRIT
	sets.WS["Blade: Retsu"] = {}
	sets.WS["Blade: Teki"] = sets.WS.MAB
	sets.WS["Blade: To"] = sets.WS.MAB
	sets.WS["Blade: Chi"] = sets.WS.MAB
	sets.WS["Blade: Ei"] = sets.WS.MAB
	sets.WS["Blade: Jin"] = sets.WS.CRIT
	sets.WS["Blade: Ten"] = {}
	sets.WS["Blade: Ku"] = {}
	sets.WS["Blade: Kamu"] = {}
	sets.WS["Blade: Yu"] = sets.WS.MAB
	sets.WS["Blade: Hi"] = sets.WS.CRIT
	sets.WS["Blade: Shun"] = {}

	sets.TreasureHunter = {
	    head="Wh. Rarab Cap +1",
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		waist="Chaac Belt",
	}

	organizer_items  = {		
		item1 = "Echo Drops",
		item2 = "Remedy",
		item3 = "Holy Water",
	}	
	jobsetup (LockStylePallet,MacroBook,MacroSet)
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}
	--windower.add_to_chat(8,'['..spell.name..']')
	if UtsusemiSpell:contains(spell.name) then
		equipSet = sets.Custom.Utsusemi.Precast
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
--Function is called by the gearswap command
function self_command_custom(command)
	if command == 'movement' then
		if world.time >= 17*60 or world.time <= 7*60 then
			equip(sets.Movement.Night)
		else
			equip(sets.Movement)
		end
	end
end
--used to register the time change to equip correct feet
windower.register_event('time change', function(time)
    if (world.time == 17*60 or world.time == 7*60) and player.status == 'Idle' then
        windower.send_command('gs c movement')
    end
end)