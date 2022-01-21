
--Inyana

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
MacroBook = "3"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for TP
state.WeaponMode:options('Seraph Blade', 'Sanguine Blade', 'Chant du Cygne','Savage Blade', 'Eviceration', 'Aeolian Edge', 'Black Halo','Unlocked')
state.WeaponMode:set('Sanguine Blade')

-- Set to true to run organizer on job changes
Organizer = false

elemental_ws = S{'Aeolian Edge', 'Seraph Blade', 'Shining Blade','Red Lotus Blade', 'Burning Blade', 'Sanguine Blade', 'Energy Drain','Energy Steal','Cyclone','Gust Slash'}

-- Goal 2100 hp and 1300 MP
function get_sets()

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Seraph Blade'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Daybreak"
	}

	sets.Weapons['Sanguine Blade'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Chant du Cygne'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Savage Blade'] ={
		main="Naegling",
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Eviceration'] ={
		main="Tauret",
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Aeolian Edge'] ={
		main="Tauret",
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Black Halo'] ={
		main="Maxentius",
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Unlocked'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	--Shield used when melee and not dual wield.
	sets.Weapons.Shield = {
		sub="Sacro Bulwark",
	}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1", -- 3/3
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy'}, priority=3}, -- +3 Refresh
		body="Malignance Tabard", -- 9/9
		hands="Malignance Gloves", -- 5/5
		legs="Malignance Tights", -- 7/7
		feet={ name="Chironic Slippers", augments={'CHR+4','Attack+21','"Refresh"+2','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +2 Refresh
		neck="Loricate Torque +1", -- 6/6
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}, priority=2},
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/1
		left_ring={ name="Stikini Ring +1", bag="wardrobe1"}, -- +1 Refresh
		right_ring='Defending Ring', -- 10/10
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10/0
		-- 50% PDT, 44% MDT, 6 MP/Tic
    }
	-- Gear to swap out for Movement
	sets.Movement = {legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}}

	-- Set to be used if you get 
	sets.Cursna_Recieved = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
		ammo="Paeapua",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Orpheus's Sash",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Hetairoi Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
	sets.OffenseMode.DT = sets.OffenseMode.TP
	sets.OffenseMode.ACC = sets.OffenseMode.TP
	sets.DualWield = {back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}}

	-- Used for Magic Spells
	sets.Precast = {}

	-- 50% Fast Cast is needed on RDM (Fast Cast V - 30%)
	sets.Precast.FastCast = {
	    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Malignance Gloves",
		legs="Aya. Cosciales +2", -- 6
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Embla Sash", -- 5
		left_ear={ name="Eabani Earring", priority=4},
		right_ear={ name="Etiolation Earring", priority=3}, --1
		left_ring={ name="Etana Ring", priority=2},
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10
	} -- 51% total Fast Cast

	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		-- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		left_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}}
	sets.JA["Saboteur"] = {}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
		sub="Sacro Bulwark",
		ammo="Psilomene",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		body="Zendik Robe",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck="Incanter's Torque",
		waist="Sacro Cord",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Mendi. Earring",
		left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Atrophy Gloves +3", -- 20
		legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet="Leth. Houseaux +1", -- 30
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, --25
		waist="Embla Sash", --10
		left_ear="Mimir Earring",
		right_ear={ name="Etiolation Earring", priority=2}, -- Used to Keep HP/MP pool
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe2"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 20
	} -- 150% Duration

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		legs="Leth. Fuseau +1",
	})

	-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
	    right_ear="Andoaa Earring",
	})

	-- used to boost Gain Spells
	sets.Midcast.Enhancing.Gain = set_combine(sets.Midcast.Enhancing, {
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
	})

	-- Enfeebling
	sets.Midcast.Enfeebling = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +8','MND+1','Mag. Acc.+12',}},
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Snotra Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe2"},
		right_ring={name="Stikini Ring +1", bag="wardrobe1"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {

	})

	 -- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
		ammo="Regal Gem", -- 10%
		body="Lethargy Sayon +1", -- 14%
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10%
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}}, -- 10%
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, -- 10%
	})

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, sets.Midcast.Enfeebling.MND, {
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}}, -- 15s (3 seconds x 5 merits)
		--hands="Regal Cuffs" --20%
		right_ear="Snotra Earring", -- 10%
		left_ring="Kishar Ring", -- 10%
		waist={ name="Obstin. Sash", augments={'Path: A',}}, -- 5%
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, -- 25%
	})

	sets.Enspell = {hands="Aya. Manopolas +2", waist="Orpheus's Sash",}

	sets.Saboteur = {hands="Leth. Gantherots +1",}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	-- Spells that require SKILL - RDM only needs +500 skill except Temper II
	sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Hydrocera",
		head="Befouled Crown",
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		back="Perimede Cape",
	}) -- Max Enhancing 613

	sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)
	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Atrophy Tabard +3",
		legs="Leth. Fuseau +1",
		right_ear={ name="Tuisto Earring", priority=1},
	})

	sets.Midcast.Nuke = {
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		neck="Mizu. Kubikazari",
	})

	sets.WS = {}

	sets.WS.ACC = {}

	sets.WS.WSD = { -- Setup for Capped Attack
	    ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Malignance Tabard",
		hands="Atrophy Gloves +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Ishvara Earring", -- Need to get
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Stikini Ring +1", -- Upgrade to Rufescent Ring
		right_ring="Epaminondas's Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS.MAB = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="C. Palug Crown",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
	    right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS.CRIT = { -- Setup for Capped Attack
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
	}

	sets.WS["Seraph Blade"] =  set_combine(sets.WS.MAB, {
		left_ring="Weather. Ring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

	sets.WS["Sanguine Blade"] = set_combine(sets.WS.MAB, {
		head="Pixie Hairpin +1",
		right_ring="Archon Ring",
	})

	sets.WS["Red Lotus Blade"] = sets.WS.MAB

	sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		body="Nyame Mail",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Orpheus's Sash"
	})

	sets.WS["Chant du Cygne"] = sets.WS.CRIT

	sets.WS["Savage Blade"] = sets.WS.WSD

	sets.TreasureHunter = {
	    hands={ name="Merlinic Dastanas", augments={'Pet: INT+6','Phys. dmg. taken -4%','"Treasure Hunter"+2',}},
		waist="Chaac Belt",
	}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

Enspell_Buff = false

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
	if buffactive['Saboteur'] and spell.skill == 'Enfeebling Magic' then
		equipSet = sets.Saboteur
	end
	return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if not buffactive['Composure'] and spell.name ~=  "Composure" then
		add_to_chat(8,'Composure is down')
	end
	coroutine.schedule(Enspell_Check,1) -- windower is not firing buff_change correctly with Enspells and has a delay

	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	Enspell_Check()
	return equipSet
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end
-- This function is called when the job file is unloaded
function user_file_unload()

end

function Enspell_Check()
	-- Tier I
	if buffactive["Enfire"] or buffactive["Enwater"] or buffactive["Enthunder"] or buffactive["Enstone"] or buffactive["Enblizzard"] or buffactive["Enaero"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	-- Tier II
	elseif buffactive["Enfire II"] or buffactive["Enwater II"] or buffactive["Enthunder II"] or buffactive["Enstone II"] or buffactive["Enblizzard II"] or buffactive["Enaero II"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	else
		Enspell_Buff = false
	end
end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'

	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'

	return buff
end