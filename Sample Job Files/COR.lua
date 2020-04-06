
--Mirdain

-- loads gear from Moogle
include('organizer-lib')
-- Modes is the include for a mode-tracking variable class.  Used for state vars, below.
include('Modes')
-- Load and initialize the include file for Treasure Hunter Tagging.
include('Mote-TreasureHunter')

--Set this value to delay swaps (Lag related)
Delay = .3

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "7"
MacroBook = "12"
MacroSet = "1"
AutoBuff = false
Zerg = false

--Used for autobuff delay
latency = 1

--Modes for Melee
state = state or {}
state.OffenseMode = M{['description']='Melee Mode'}
state.OffenseMode:options('TP','ACC','DT')
state.OffenseMode:set('TP')

--Ammunition
RAbullet = "Living Bullet"
WSbullet = "Living Bullet"
MAbullet = "Living Bullet"
QDbullet = "Living Bullet"

function get_sets()
	-- Single mode righit now (hybrid -DT)
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Malignance Tabard",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Mummu Gamash. +2",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}},
		back="Moonbeam Cape",
    }
	--Set used for pure -DT when not engaged (no TP considerations and Augments the Idle set)
	sets.DT = {

    }
	sets.Precast = {}
	--Corsair Rolls
	sets.Precast.CorsairRoll = {main={name="Rostam", bag="Wardrobe"},head="Lanun Tricorne +3",hands="Chasseur's Gants +1",neck="Regal Necklace",ring2="Luzaf's Ring"}
    sets.Precast.CorsairRoll["Caster's Roll"] = set_combine(sets.Precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.Precast.CorsairRoll["Courser's Roll"] = set_combine(sets.Precast.CorsairRoll, {feet="Navarch's Bottes +2"})
    sets.Precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.Precast.CorsairRoll, {head="Navarch's Tricorne +2"})
    sets.Precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.Precast.CorsairRoll, {body="Navarch's Frac +2"})
    sets.Precast.CorsairRoll["Allies' Roll"] = set_combine(sets.Precast.CorsairRoll, {hands="Chasseur's Gants +1"})

	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Accuracy+15','"Fast Cast"+5','INT+9','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Herculean Trousers", augments={'"Fast Cast"+5','MND+10','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+23','"Fast Cast"+6','VIT+4','"Mag.Atk.Bns."+1',}},
		neck="Voltsurge Torque",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Defending Ring",
	}
	sets.Precast.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	sets.Midcast = {}

	sets.JA = {}
	sets.JA["Wild Card"] = {feet="Lanun Bottes +3"}
	sets.JA["Phantom Roll"] = {}
	sets.JA["Double-Up"] = {}
	sets.JA["Quick Draw"] = {}
	sets.JA["Random Deal"] = {body="Lanun Frac +3"}
	sets.JA["Snake Eye"] = {legs="Lanun Culottes"}
	sets.JA["Fold"] = {}
    sets.JA['Triple Shot'] = {body="Navarch's Frac +2"}
	sets.JA["Cutting Cards"] = {}
	sets.JA["Crooked Cards"] = {}

	sets.TP = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Mummu Gamash. +2",
		neck="Sanctity Necklace",
		waist="Kentarch Belt +1",
		left_ear="Suppanomimi",
		right_ear="Cessance Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.TP.DT = {
	    body="Malignance Tabard",
		legs="Malignance Tights",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.TP.ACC = {

	}
	--set used when ranged attack is used
	sets.TP.RA = {
	}
	sets.WS = {
		ammo="Yetshila +1",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epona's Ring",
		right_ring="Epaminondas's Ring",
		back="Phalangite Mantle",
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {
	}
	sets.WS.WSD = {
	}
	sets.WS.MAB = {
	}
	sets.WS.MACC = {
	}
	sets.WS["Hot Shot"] = {}
	sets.WS["Split Shot"] = {}
	sets.WS["Sniper Shot"] = {}
	sets.WS["Slug Shot"] = {}
	sets.WS["Numbing Shot"] = {}
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Savage Blade"] = {}
	sets.WS["Requiescat"] = {}

	sets.TreasureHunter = {
		head="Wh. Rarab Cap +1",
	    body={ name="Herculean Vest", augments={'"Dual Wield"+4','Pet: Mag. Acc.+22 Pet: "Mag.Atk.Bns."+22','"Treasure Hunter"+2',}},
		waist="Chaac Belt",
	}
	sets.Phantom = {}

	organizer_items  = {		
		item1 = "Echo Drops",
		item2 = "Remedy",
		item3 = "Holy Water",
	}

	--Command to Lock Style and Set the correct macros
	send_command('wait 10;input /lockstyleset '..LockStylePallet..';wait 1;input /macro book '..MacroBook..';wait .1;input /macro set '..MacroSet..';wait .1;gs equip Idle;input /echo Change Complete')
	--Notify current states
	windower.add_to_chat(8,'[F12] - Melee Mode is [TP]')
	windower.add_to_chat(8,'[F11] - Treasure Hunter Mode is [OFF]')
	windower.add_to_chat(8,'[F10] - Auto Buff is [OFF]')
	windower.add_to_chat(8,'[F9] - Zerg is [OFF]')
end

function pretarget(spell,action)
	--Stop Gear swap when can't WS
	if spell.type == 'WeaponSkill' and player.tp < 1000 then
		cancel_spell()
		windower.add_to_chat(8,'TP:['..player.tp..']')
	--Cancel ability due to abilty not active
	elseif spell.type == 'JobAbility' then
		local abil_recasts_table = windower.ffxi.get_ability_recasts()
		local ability_time = abil_recasts_table[spell.recast_id]/60
		local min = math.floor(ability_time)
		local sec = (ability_time - min)*60
		if ability_time > 0 then
			windower.add_to_chat(8,''..spell.name..' ['..string.format("%02d:%02d",min,sec)..']')
			cancel_spell()
		end
	elseif spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' or spell.type == 'BlueMagic' or spell.type == 'BardSong' or spell.type == 'SummonerPact' or spell.type == 'CorsairRoll' then
		--Cancel spell due to abilty not active
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local spell_time = spell_recasts[spell.recast_id]/100
		if spell_time > 0 then
			windower.add_to_chat(8,''..spell.name..' ['..spell_time..']')
			cancel_spell()
		end
	end
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if spell.action_type == 'Magic' or spell.type == 'JobAbility' then
			if buffactive['Paralysis'] or buffactive['Silence'] then
				cancel_spell()
				send_command('input /item "Remedy" <me>')
			end
		end
	end
	if spell.type == 'WeaponSkill' then
		-- Leave for WS scripting
	end
end

function precast(spell)
	equipSet = {}
	if spell.type == 'WeaponSkill' then
		equipSet = sets.WS
		if equipSet[spell.english] then		
			equipSet = set_combine(equipSet, equipSet[spell.english])
			--Augments the set built for ACC
			if state.OffenseMode.value == 'ACC' then
				windower.add_to_chat(8, '['..spell.english..'] Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				windower.add_to_chat(8, '['..spell.english..'] Set')
			end
		else
			if state.OffenseMode.value == 'ACC' then
				windower.add_to_chat(8,'Using Default WS Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				windower.add_to_chat(8,'Using Default WS Set')
			end
		end
    elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'JobAbility' then
		equipSet = sets.JA
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			windower.add_to_chat(8, '['..spell.english..'] Set')
		else
			windower.add_to_chat(8,'JA not set')
		end
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'SummonerPact' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BardSong' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Trust' then
		equipSet = sets.Precast.FastCast
	end
	-- Equip the built set
	equip(equipSet)
 end

function midcast(spell)
	-- Not setting spells for SAM for simplicity sake
end

-- after our ws or ability, call the choose_set function to put on the correct gear.
function aftercast(spell)
	if spell.interrupted == true then
	--Action Filed - refire? Hook used for scripting
	end
	if AutoBuff == true and not spell.type == 'WeaponSkill' then
		coroutine.schedule(check_buff, 1)
	elseif Zerg == true then
		coroutine.schedule(check_buff, 1)
	end
	choose_set()
end

function check_buff()
	if player.status == "Engaged" then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.sub_job == 'WAR' or player.main_job == 'WAR' then
			if not buffactive['Berserk'] and abil_recasts[1] < latency then
				windower.chat.input('/ja "Berserk" <me>')
			elseif not buffactive['Aggressor'] and abil_recasts[4] < latency then
				windower.chat.input('/ja "Aggressor" <me>')
			elseif not buffactive['Warcry'] and not buffactive['Berserk'] and abil_recasts[2] < latency then
				windower.chat.input('/ja "Warcry" <me>')
			end
		end
	end
end

-- Used to determine state after casting
function choose_set()
	equipSet = {}
	if player.status == "Engaged" then
		equipSet = sets.TP
		if state.OffenseMode.value == 'ACC' then
			equipSet = set_combine(equipSet, sets.TP.ACC)
		elseif state.OffenseMode.value == 'DT' then
			equipSet = set_combine(equipSet, sets.TP.DT)
		end
    else
		equipSet = sets.Idle
		if state.OffenseMode.value == 'DT' then
			equipSet = set_combine(equipSet, sets.DT)
		end
	end
	gearswap.equip_sets:schedule(Delay, 'equip_command', nil, equipSet)
end

-- Useful hook to automate buffing
function buff_change(name,gain)
	--Buff Gained
	if gain == true then
		--In Combat
		if player.status == "Engaged" then

		end
	end
	--Buff Lost
	if gain == false then
		--In Combat
		if player.status == "Engaged" then

		end
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		choose_set()
    elseif new == 'Engaged' then
		choose_set()
		--Only equip TH when engaging - then let it overwrite on update
		if state.TreasureMode.value == 'Tag' then
			equip(sets.TreasureHunter)
		end
		if AutoBuff == true then
			check_buff()
		end
    end
end

function self_command(command)
	if command == 'update auto' then
		if player.status == "Engaged" and state.TreasureMode.value == 'Tag' then
			windower.add_to_chat(8,'Treasure Hunter Tagged')
			choose_set()
		end
	elseif command == "TH" then
		if 	state.TreasureMode.value == 'Tag' then
		    state.TreasureMode:set('None')
			if player.status == "Engaged" then
				send_command('input /attackoff')
			end
		else
			state.TreasureMode:set('Tag')
			if player.status == "Engaged" then
				send_command('input /attackoff')
			end
		end
		windower.add_to_chat(8,'Treasure Hunter Mode: ['..state.TreasureMode.value..']')
	elseif command == "Zerg" then
		if Zerg == true then
			Zerg = false
			windower.add_to_chat(8,'Zerg is [OFF]')
		else
			Zerg = true
			windower.add_to_chat(8,'Zerg is [ON]')
			check_buff()
		end
	elseif command == 'ModeChange' then
		if state.OffenseMode.value == 'TP' then
			state.OffenseMode:set('ACC')
		elseif state.OffenseMode.value == 'ACC' then
			state.OffenseMode:set('DT')
		elseif state.OffenseMode.value == 'DT' then
			state.OffenseMode:set('TP')
		end
		windower.add_to_chat(8,'Melee Mode: ['..state.OffenseMode.value..']')
		choose_set()
	end
end

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end

function file_unload()
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
end

 -- Puts on our fashion set, lockstyle it, then switch to our idle set.
 send_command('bind f12 gs c ModeChange')
 send_command('bind f11 gs c TH')
 send_command('bind f10 gs c AutoBuff')
 send_command('bind f9 gs c Zerg')

