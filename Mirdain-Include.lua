res = require 'resources'
config = require('config')

-- loads gear from Moogle
include('organizer-lib')
-- Modes is the include for a mode-tracking variable class.  Used for state vars, below.
include('Modes')

default = {
	visible = true,
	debug = false,
	info = true,
	Display_Box = {text={size=10,font='Consolas',red=255,green=255,blue=255,alpha=255},pos={x=1647,y=835},bg={visible=true,red=0,green=0,blue=0,alpha=102},},
	Debug_Box = {text={size=10,font='Consolas',red=255,green=255,blue=255,alpha=255},pos={x=1483,y=791},bg={visible=true,red=0,green=0,blue=0,alpha=102},},
	}

settings = config.load(default)

DualWield = false
SpellCastTime = 0
Spellstart = os.time()

UpdateTime = os.clock()

command_JA = "None"
command_SP = "None"
command_BP = "None"

UI_Name = ''
UI_State = ''

Enemy_ID = 0

avatar = "None"

is_Busy = false
is_Pianissimo = false
is_moving = false
Time_Out = false

--Variable to monitor during debug mode
debug_value = 0

state = state or {}

-- Required gear set.  Expand this in the job file when defining sets.
sets.TreasureHunter = {}

--Modes for Melee
state.OffenseMode = M{['description']='Melee Mode'}
state.OffenseMode:options('TP','ACC','DT')
state.OffenseMode:set('TP')

--Modes for Auto Buff
state.AutoBuff = M{['description']='Auto Buff Mode'}
state.AutoBuff:options('OFF','ON')
state.AutoBuff:set('OFF')

--TH mode handling
state.TreasureMode = M{['description']='Treasure Mode'}
if player.main_job == "THF" then
	state.TreasureMode:options('None','Tag','Fulltime','SATA')
	state.TreasureMode:set('Tag')
else
	state.TreasureMode:options('None','Tag')
	state.TreasureMode:set('None')
end

--Job specific modes
state.JobMode = {}
state.JobMode = M{['description']='Job Specific Mode'}
state.JobMode:options('OFF','ON')
state.JobMode:set('OFF')

--State for Ammunition check
state.warned = M(false)

--Unlock any previously locked gear
enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')

--Ammunition
Ammo = {}
Ammo.Bullet = {}
Ammo.Arrow = {}
Ammo.Bolt = {}

gs_status = {}
gs_status = texts.new("",settings.Display_Box)

-- UI for displaying the current states
function display_box_update()
	lines = T{}
	lines:insert('State' ..string.format('[%s]',state.OffenseMode.value):lpad(' ',14))
	lines:insert('TH Mode' ..string.format('[%s]',state.TreasureMode.value):lpad(' ',12))
	lines:insert('Auto Buff' ..string.format('[%s]',state.AutoBuff.value):lpad(' ',10))
	if UI_Name ~= '' then
		lines:insert(UI_Name ..string.format('[%s]',state.JobMode.value):lpad(' ',19-string.len(UI_Name)))
	end
	local maxWidth = math.max(1, table.reduce(lines, function(a, b) return math.max(a, #b) end, '1'))
	for i,line in ipairs(lines) do lines[i] = lines[i]:rpad(' ', maxWidth) end
    gs_status:text(lines:concat('\n'))
end

gs_debug = {}
gs_debug = texts.new("",settings.Debug_Box)

-- Used to help debug issues
function debug_box_update()
	lines = T{}

	lines:insert('is_Busy' ..string.format('[%s]',tostring(is_Busy)):lpad(' ',12))
	lines:insert('is_Moving' ..string.format('[%s]',tostring(is_moving)):lpad(' ',10))
	lines:insert('DualWield' ..string.format('[%s]',tostring(DualWield)):lpad(' ',10))
	lines:insert('debug_value' ..string.format('[%s]',tostring(debug_value)):lpad(' ',8))
	local maxWidth = math.max(1, table.reduce(lines, function(a, b) return math.max(a, #b) end, '1'))
	for i,line in ipairs(lines) do lines[i] = lines[i]:rpad(' ', maxWidth) end
    gs_debug:text(lines:concat('\n'))
end

if settings.visible == true then
	gs_status:show()
end

if settings.debug == true then
	gs_debug:show()
end

function log (msg)
	if settings.debug == true then
		windower.add_to_chat(80,'-------'..msg..'-------')
	end
end

function info (msg)
	if settings.info == true then
		windower.add_to_chat(8,''..msg..'')
	end
end

watch_buffs = S{"light arts","addendum: white","penury","celerity","accession","perpetuance","rapture",
"dark arts","addendum: black","parsimony","alacrity","manifestation","ebullience","immanence",
"stun","petrified","silence","stun","sleep","slow","paralyze"}

SlotList = {"main","sub","range","ammo","head","body","hands","legs","feet","neck","waist","lear","rear","left_ring","right_ring","back"}

--Song Sets
EnfeebleSong = S{
'Foe Requiem','Foe Requiem II','Foe Requiem III','Foe Requiem IV','Foe Requiem V','Foe Requiem VI','Foe Requiem VII','Battlefield Elegy', 'Carnage Elegy',
'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody', 'Ltng. Threnody', 'Water Threnody', 'Light Threnody','Dark Threnody','Fire Threnody II',
'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II', 'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II','Dark Threnody II','Magic Finale', 'Pining Nocturne'}

Enfeeble_Acc = S{'Sleep','Sleep II','Sleepga','Sleepga II','Silence','Inundation','Dispel'}
Enfeeble_Potency = S{'Paralyze','Paralyze II','Slow','Slow II','Addle','Distract','Distract II','Distract III','Frazzle III'}
Enhancing_Skill = S{'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'}

RecastTimers = S{'WhiteMagic','BlackMagic','Ninjutsu','BlueMagic','BardSong','SummoningMagic','SummonerPact'}
SleepSongs = S{'Foe Lullaby','Foe Lullaby II','Horde Lullaby','Horde Lullaby II',}
EnfeeblingNinjitsu = S{'Jubaku: Ichi','Kurayami: Ni', 'Hojo: Ichi', 'Hojo: Ni', 'Kurayami: Ichi', 'Dokumori: Ichi', 'Aisha: Ichi', 'Yurin: Ichi'}
Mage_Job = S{'BLM','RDM','WHM','BRD','BLU','GEO','SCH','NIN','PLD','RUN','DRK','SMN'}
Buff_BPs_Duration = S{'Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Glittering Ruby','Earthen Ward','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing'}
Buff_BPs_Healing = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
Debuff_BPs = S{'Mewing Lullaby','Eerie Eye','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Slowga','Tidal Roar','Diamond Storm','Sleepga','Shock Squall'}
Debuff_Rage_BPs = S{'Moonlit Charge','Tail Whip'}
Elemental_Bar = S{'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzard','Baraero','Barstonra','Barthundra','Barwatera'}
Magic_BPs_NoTP = S{'Holy Mist','Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Night Terror','Thunderspark'}
Magic_BPs_TP = S{'Impact','Conflag Strike','Level ? Holy','Lunar Bay'}
Merit_BPs = S{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm'}
Physical_BPs_TP = S{'Rock Buster','Mountain Buster','Crescent Fang','Spinning Dive'}
AvatarList = S{'Shiva','Ramuh','Garuda','Leviathan','Diabolos','Titan','Fenrir','Ifrit','Carbuncle','Fire Spirit','Air Spirit','Ice Spirit','Thunder Spirit','Light Spirit','Dark Spirit','Earth Spirit','Water Spirit','Cait Sith','Alexander','Odin','Atomos'}

geomancy = M('Geo-Acumen', 'Geo-Attunement', 'Geo-Barrier', 'Geo-STR', 'Geo-DEX', 'Geo-VIT', 'Geo-AGI', 'Geo-INT', 'Geo-MND', 'Geo-CHR', 'Geo-Fade',
             'Geo-Fend', 'Geo-Focus', 'Geo-Frailty', 'Geo-Fury', 'Geo-Gravity', 'Geo-Haste', 'Geo-Languor', 'Geo-Malaise', 'Geo-Paralysis', 
             'Geo-Poison', 'Geo-Precision', 'Geo-Refresh', 'Geo-Regen', 'Geo-Slip', 'Geo-Slow', 'Geo-Torpor', 'Geo-Vex', 'Geo-Voidance', 'Geo-Wilt')

indicolure = M('Indi-Acumen', 'Indi-Attunement', 'Indi-Barrier', 'Indi-STR', 'Indi-DEX', 'Indi-VIT', 'Indi-AGI', 'Indi-INT', 'Indi-MND', 'Indi-CHR', 'Indi-Fade',
             'Indi-Fend', 'Indi-Focus', 'Indi-Frailty', 'Indi-Fury', 'Indi-Gravity', 'Indi-Haste', 'Indi-Languor', 'Indi-Malaise', 'Indi-Paralysis', 
             'Indi-Poison', 'Indi-Precision', 'Indi-Refresh', 'Indi-Regen', 'Indi-Slip', 'Indi-Slow', 'Indi-Torpor', 'Indi-Vex', 'Indi-Voidance', 'Indi-Wilt')

areas = {}

-- City areas for town gear and behavior.
areas.Cities = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower","Port San d'Oria","Northern San d'Oria",
	"Southern San d'Oria","Chateau d'Oraguille","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate","The Colosseum","Tavnazian Safehold","Nashmau","Selbina",
	"Mhaura","Rabao","Norg","Kazham","Eastern Adoulin","Western Adoulin","Celennia Memorial Library","Mog Garden","Leafallia"
}

TaggingCategories = S{1,2,3,4,6,11,14} -- For TH handling, which event IDs to register for tagging

-------------------------------------------------------------------------------------------------------------------
-- This function is called from the default GearSwap Function "pretarget" to validate the user action
-------------------------------------------------------------------------------------------------------------------

function pretargetcheck(spell,action)
	--Cancel if pet is in middle of move
    if (pet.isvalid and pet_midaction()) then
		cancel_spell()
		return
	end
	-- Status Ailment Check
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if buffactive['Paralysis'] and spell.type == 'JobAbility' then
			cancel_spell()
			send_command('input /item "Remedy" <me>')
			log('Cancel Spell - Using Items')
		end
		if spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()																							
			send_command('input /item "Remedy" <me>')
			log('Cancel Spell - Using Items')
		end											
	end
	--Weapon Skill checks
	if spell.type == 'WeaponSkill' then
		local ws_used = res.weapon_skills:with('en',spell.english)
		--Stop gear swap when you can't WS
		if player.tp < 1000 then
			cancel_spell()
			log('TP:['..player.tp..']')
			return
		--Stop gear swap when you can't WS
		elseif buffactive['Amnesia'] then
			cancel_spell()
			info('Can\'t Weapon Skill due to amnesia.')
			return
		end
	--Cancel ability due to abilty not ready
	elseif spell.type == 'JobAbility' or spell.type == 'BloodPactWard' or spell.type == 'BloodPactRage' or spell.type == 'PetCommand' then
		local abil_recasts_table = windower.ffxi.get_ability_recasts()
		local ability_time = abil_recasts_table[spell.recast_id]/60
		local min = math.floor(ability_time)
		local sec = (ability_time - min)*60
		if ability_time > 0 then
			info(''..spell.name..' ['..string.format("%02d:%02d",min,sec)..']')
			cancel_spell()
			return
		end
	elseif RecastTimers:contains(spell.type) then
		--Cancel certain actions (Defined by RecastTimers) if not ready
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local spell_time = spell_recasts[spell.recast_id]/100
		if spell_time > 0 then
			info(''..spell.name..' ['..spell_time..']')
			cancel_spell()
			return
		end
		--Cancel if null target and redirect to self if bard song
		if spell.target.type ==  null then
			if spell.type == 'BardSong' then
				if buffactive['Pianissimo'] then
					if is_Pianissimo == false then
						cancel_spell()
						--log('Piassimo Redirect - Select Character')
						send_command('input /ma "'..spell.name..'" <stpc>')
						is_Pianissimo = true
					else
						is_Pianissimo = false
					end
				else
					change_target('<me>')
				end
			else
				-- Cancel Spell
				log('Cancel Spell:[NO TARGET]')
				cancel_spell()
				return
			end
		else
			local cast_spell = res.spells:with('name', spell.name)
			log('['..tostring(cast_spell.targets)..']')
			-- Self Target spells
			if cast_spell.targets == '{Self}' then
				if spell.target.type ~= 'SELF' then
					-- Change Target Spell
					log('Redirect Spell:[SELF TARGET]')
					change_target('<me>')
				end
			-- Enemy Spells
			elseif tostring(cast_spell.targets) == '{Enemy}' then
				if spell.target.type ~= 'MONSTER' and not spell.name:contains('Lullaby') and not spell.name:contains('Sleep') then
					--Cancel Spell
					log('Cancel Spell:[ENEMY TARGET]')
					cancel_spell()
					return
				end
			-- Party Buffs
			elseif tostring(cast_spell.targets) == '{Self, Party}' or tostring(cast_spell.targets) == '{Self, Party, Ally, NPC}' then
				if spell.target.type == 'MONSTER' then
					if spell.type == 'BardSong' then
						if buffactive['pianissimo'] then
							if is_Pianissimo == false then
								cancel_spell()
								--log('Piassimo Redirect - Select Character')
								send_command('input /ma "'..spell.name..'" <stpc>')
								is_Pianissimo = true
							else
								is_Pianissimo = false
							end
						else
							change_target('<me>')
							log('Redirect Spell:[SELF TARGET]')
						end
					else
						-- Cancel Spell
						log('Cancel Spell:[PARTY TARGET]')
						cancel_spell()
						return
					end
				else
					if spell.type == 'BardSong' and spell.target.type == 'SELF' and buffactive['Pianissimo'] then
						log('Pianissimo Redirect - Select Character')
						cancel_spell()
						windower.send_command('input /ma \"'..spell.name..'\" <stpc>')
						return
					end
				end
			end
		end
	end
	--Used to fire a script
	if spell.name == "Poison" then
		info('Dancing Chains')
		if player.main_job == "RDM" then
			send_command('exec RDM/CP')
		elseif player.main_job == "GEO" then
			send_command('exec GEO/CP')
		elseif player.main_job == "SCH" then
			send_command('exec SCH/CP')
		elseif player.main_job == "BRD" then
			send_command('exec BRD/CP')
		elseif player.main_job == "RNG" then
			send_command('exec RNG/CP')
		end
		cancel_spell()
		return
	end
	--Used to fire a second script
	if spell.name == "Poison II" then
		info('Dancing Chains')
		if player.main_job == "RDM" then
			send_command('exec RDM/CP2')
		elseif player.main_job == "GEO" then
			send_command('exec GEO/CP2')
		elseif player.main_job == "SCH" then
			send_command('exec SCH/CP2')
		elseif player.main_job == "BRD" then
			send_command('exec BRD/CP2')
		elseif player.main_job == "RNG" then
			send_command('exec RNG/CP2')
		end
		cancel_spell()
		return
	end
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called from the default GearSwap Function "precast" to build an equipset
-------------------------------------------------------------------------------------------------------------------

function precastequip(spell)
	--Default gearset
	equipSet = {}
	--Cancel for SMN if Avatar is mid action and Item use
    if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	-- WeaponSkill
	if spell.type == 'WeaponSkill' then
		equipSet = sets.WS
		if equipSet[spell.english] then		
			equipSet = set_combine(equipSet, equipSet[spell.english])
			if state.OffenseMode.value == 'ACC' then
				--Augments the set built for ACC
				info( '['..spell.english..'] Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				info( '['..spell.english..'] Set')
			end
		else
			if state.OffenseMode.value == 'ACC' then
				--Augments the set built for ACC
				info('Using Default WS Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				info('Using Default WS Set')
			end
		end
		-- Check that proper ammo is available.
		if spell.skill == "Marksmanship" then
			if	player.equipment.ammo ~= "" and player.equipment.ranged ~= "" then
				do_bullet_checks(spell, spellMap, eventArgs, equipSet)
			end
		end
	-- Ranged attack
	elseif spell.action_type == 'Ranged Attack' then
		equipSet = sets.Precast.RA
		if buffactive[265] then
			equipSet = set_combine(equipSet, sets.Precast.RA.Flurry)
		elseif buffactive[581] then
			equipSet = set_combine(equipSet, sets.Precast.RA.Flurry_II)
		end
		-- Check that proper ammo is available.
		do_bullet_checks(spell, spellMap, eventArgs, equipSet)
	-- Ninjutsu
    elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, equipSet[spell.english])
			info('['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	-- JobAbility
	elseif spell.type == 'JobAbility' then
		equipSet = sets.JA
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info('['..spell.english..'] Set')
		elseif spell.id == 123 then
			equipSet = sets.PhantomRoll
			info('['..spell.english..'] Set')
		else
			info('JA not set for ['..spell.english..']')
		end
	-- CorsairRoll
	elseif spell.type == 'CorsairRoll' then
		equipSet = sets.PhantomRoll
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, equipSet[spell.english])
			info( '['..spell.english..'] Set')
		else
			info('Roll not set')
		end
	-- CorsairShot
	elseif spell.type == 'CorsairShot' then
		equipSet = sets.Midcast.QuickDraw
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, equipSet[spell.english])
			info( '['..spell.english..'] Set')
		else
			info('Quick Draw not set')
		end
	-- WhiteMagic
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		elseif spell.name:contains('Raise') or spell.name == "Arise" or spell.name:contains('Cura') or spell.name:contains('Cure') then
			equipSet = set_combine(sets.Precast.FastCast, sets.Precast.QuickMagic)
		else
			equipSet = sets.Precast.FastCast
		end
	-- BlackMagic
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	-- SummonerPact
	elseif spell.type == 'SummonerPact' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	-- BardSong
	elseif spell.type == 'BardSong' then
		-- Normal Song Casting
		if not buffactive['Nightingale'] then
			-- Song Count for Minne and Paeon
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Count)
			elseif spell.name == "Honor March" then
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Honor)
			else
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Strength)
			end
		-- NiTro Songs (Midcast Sets)
		else 
			info('Nitro Mode')
			-- Song Count for Minne and Paeon
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				info( '['..spell.english..'] Set (Song Count - Daurdabla)')
				equipSet = set_combine(sets.Precast.DummySongs, sets.Song.Count)
			-- Equip Marsyas
			elseif spell.name == "Honor March" then
				equipSet = set_combine(sets.Midcast, sets.Song.Honor)
			-- Equip Harp
			elseif spell.name:contains('Horde') then
				info( '['..spell.english..'] Set (AOE Sleep - Daurdabla)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.AOE_Sleep)
			-- Normal Enfeebles
			elseif EnfeebleSong:contains(spell.english) then
				info( '['..spell.english..'] Set (Enfeebling - Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.Strength)
			-- Augment the buff songs
			else
				info( '['..spell.english..'] Set (Buff - Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, equip_song_gear(spell), sets.Song.Strength)
			end
		end
	-- BlueMagic
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	-- Geomancy
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	-- Trust
	elseif spell.type == 'Trust' then
		equipSet = sets.Precast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			info( '['..spell.english..'] Set')
		else
			equipSet = sets.Precast.FastCast
		end
	end
	-- If TH mode is on - check if new mob and then equip TH gear
	if 	state.TreasureMode.value ~= 'None' and spell.target.type == 'MONSTER' and not th_info.tagged_mobs[spell.target.id] then
		equipSet = set_combine(equipSet, sets.TreasureHunter)
	end
	-- Final equipSet built to return.  This is not the final set as custom Job can Augment
	return equipSet
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called from the default GearSwap Function "midcast" to build an equipset
-------------------------------------------------------------------------------------------------------------------

function midcastequip(spell)
	--Default gearset
	equipSet = {}
	if spell.action_type == 'Ranged Attack' then
		equipSet = sets.Midcast.RA
		if state.OffenseMode.value == 'ACC' then
			--Augments the set built for ACC
			equipSet = set_combine(equipSet, sets.Midcast.RA.ACC)
		end
		if buffactive['Triple Shot'] then 
			equipSet = set_combine(equipSet, sets.Midcast.RA.TripleShot)
		end
	-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		-- Defined Gear Set
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			info('['..spell.english..'] Set')
		-- Enhancing Magic
		elseif spell.target.type == 'SELF' then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
			info('Enhancing set')
		-- Enfeebling
		elseif EnfeeblingNinjitsu:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
			info('Enfeebling set')
		-- Defaults to Nukes if not the above
		else
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			info('Nuke set')
		end
	-- WhiteMagic
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Midcast
		-- Defined Gear Set
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			info('['..spell.english..'] Set')
		-- Cure
		elseif spell.name:contains('Cure') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Cure)
			info('Cure Set')
		-- Regen
		elseif spell.name:contains('Regen') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Regen)
			info('Regen Set')
		-- Curaga 
		elseif spell.name:contains('Cura') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Curaga)
			info('Curaga Set')
		-- Raise (Stay in FastCast set for recast timers)
		elseif spell.name:contains('Raise') or spell.name == "Arise" then
			equipSet = sets.Precast.FastCast
			info('Raise Set')
		-- Enhancing
		elseif spell.skill == 'Enhancing Magic' then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
			--Cancel Stoneskin if it is being cast and is an active buff
			if spell.name == 'Stoneskin' then
				if buffactive['Stoneskin'] then
	  	 			info('Cancel Stoneskin')
					cancel('Stoneskin')
				end
			end
			if spell.target.type == 'SELF' then
				-- Refresh
				if spell.name:contains('Refresh') then
					info('Refresh Set')
					equipSet = set_combine(equipSet, sets.Midcast.Refresh)
				-- Bar Spells
				elseif Elemental_Bar:contains(spell.name) then 
					equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Elemental)
					info('Elemental Bar Set')
				-- Enhancing SKill
				elseif Enhancing_Skill:contains(spell.name) then 
					if buffactive['Accession'] then
						equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Skill, sets.Midcast.Enhancing.Others)
						info('Enhancing Skill')
					else
						equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Skill)
						info('Enhancing Skill')
					end
				-- Enhancing
				else
					info('Enhancing Magic Set')
				end
			else
				-- Refresh
				if spell.name:contains('Refresh') then
					info('Refresh Set')
					equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Others, sets.Midcast.Refresh)
				end
				-- Bar Spells
				if Elemental_Bar:contains(spell.name) then 
					equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Others, sets.Midcast.Enhancing.Elemental)
					info('Elemental Bar Set')
				-- Enhancing SKill
				elseif Enhancing_Skill:contains(spell.name) then 
					equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Skill)
					info('Enhancing Skill')
				-- Enhancing
				else
					equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Others)
					info('Enhancing Magic Set')
				end
			end
		-- Enfeebling Magic
		elseif spell.skill == 'Enfeebling Magic' then
			if Enfeeble_Acc:contains(spell.name) then 
				info('Enfeebling Magic Set - Magic Accuracy')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling, sets.Midcast.Enfeebling.MACC)
			elseif Enfeeble_Potency:contains(spell.name) then
				info('Enfeebling Magic Set - Potency')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling, sets.Midcast.Enfeebling.Potency)
			else
				info('Enfeebling Magic Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
			end
		else
			-- No type found and use default Midcast
			info('Midcast not set')
		end
	-- Black Magic
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Midcast
		-- Defined Gear Set
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			info( '['..spell.english..'] Set')
		-- Aspir Gear
		elseif spell.name:contains('Aspir') then
			info('Aspir Set')
			equipSet = set_combine(equipSet, sets.Midcast.Aspir)
		-- Drain Gear
		elseif spell.name:contains('Drain') then
			info('Drain Set')
			equipSet = set_combine(equipSet, sets.Midcast.Drain)
		-- Enfeebling Magic
		elseif spell.skill == 'Enfeebling Magic' then
			if Enfeeble_Acc:contains(spell.name) then 
				info('Enfeebling Magic Set - Magic Accuracy')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling, sets.Midcast.Enfeebling.MACC)
			elseif Enfeeble_Potency:contains(spell.name) then
				info('Enfeebling Magic Set - Potency')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling, sets.Midcast.Enfeebling.Potency)
			else
				info('Enfeebling Magic Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
			end
		-- Enhancing Magic
		elseif spell.skill == 'Enhancing Magic' then
			info('Enhancing Magic Set')
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
		else
			-- If Auto Burst mode is turned on it will use the equip set for Bursting
			if state.JobMode.value ~= 'OFF' then
				info('Burst Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Burst)
			else
				info('Nuke Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			end
		end
	-- Bard Song
	elseif spell.type == 'BardSong' and not buffactive['Nightingale'] then
		-- Song Count for Minne and Paeon
		if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
			info( '['..spell.english..'] Set (Song Count - Daurdabla)')
			equipSet = set_combine(sets.Precast.DummySongs, sets.Song.Count)
		-- Equip Marsyas
		elseif spell.name == "Honor March" then
			equipSet = set_combine(sets.Midcast, sets.Song.Honor)
		-- AoE Sleep
		elseif spell.name:contains('Horde') then
			info( '['..spell.english..'] Set (AOE Sleep - Daurdabla)')
			equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.AOE_Sleep)
		-- Normal Enfeebles
		elseif EnfeebleSong:contains(spell.english) then
			info( '['..spell.english..'] Set (Enfeebling - Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.Strength)
		-- Augment the buff songs
		else
			info( '['..spell.english..'] Set (Buff - Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, equip_song_gear(spell), sets.Song.Strength)
		end
	-- BlueMagic
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Midcast
		-- Defined Set
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			info( '['..spell.english..'] Set')
		-- Defined Blue Nukes
		elseif BlueNuke:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			info('Nuke set')
		-- Spells that benifit from Blue Magic Skill
		elseif BlueSkill:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			info('Blue Skill set')
		-- Default Spell set
		else
			info('Midcast not set')
		end
	-- Geomancy
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Midcast
		-- Defined Set
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			info( '['..spell.english..'] Set')
		-- Indi Equipment
		elseif indicolure:contains(spell.english) then
			if buffactive["Entrust"] then
				equipSet = sets.Geomancy.Indi.Entrust
				info('Indicolure set - Entrust')
			else
				equipSet = sets.Geomancy.Indi
				info('Indicolure set')
			end
		-- Bubble Equipment
		elseif geomancy:contains(spell.english) then
			equipSet = sets.Geomancy.Geo
			info('Geomancy set')
		-- Default set
		else
			info('Midcast not set')
		end
	-- Trust
	elseif spell.type == 'Trust' then
		equipSet = sets.FastCast
	-- BloodPactRage and BloodPactWard
	elseif spell.type=="BloodPactWard" or spell.type=="BloodPactRage" then
		-- BP Timer gear needs to swap here if not under Astral Conduit
		if not buffactive["Astral Conduit"] then
			equipSet = sets.Midcast
			equipSet = set_combine(equipSet, sets.Midcast.BP)
		end
	-- Elemental Siphon
	elseif spell.name=="Elemental Siphon" then
		equipSet = sets.Midcast
		equipSet = set_combine(equipSet, sets.Midcast.SummoningMagic)
	-- Summon Avatar
	elseif spell.type=="SummonerPact" then
		equipSet = sets.Midcast
		equipSet = set_combine(equipSet, sets.Midcast.Summon)
	end
	-- Auto-cancel existing buffs
	if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
		send_command('cancel 37;')
	elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
		send_command('cancel 71;')
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		send_command('wait 1;cancel 66;')
	end
	-- If TH mode is on - check if new mob and then equip TH gear
	if 	state.TreasureMode.value ~= 'None' and spell.target.type == 'MONSTER' and not th_info.tagged_mobs[spell.target.id] then
		equipSet = set_combine(equipSet, sets.TreasureHunter)
	end
	-- Built equipset to return
	return equipSet
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called from the default GearSwap Function "aftercast" to build an equipset
-------------------------------------------------------------------------------------------------------------------

function aftercastequip(spell)
	-- Dont change gear as the pet is still performing an action
    if pet_midaction() then
        return
    else
		equipSet = {}
		equipSet = equip(set_combine(choose_set(),choose_set_custom()))
		return equipSet
	end
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for pretarget checks
-------------------------------------------------------------------------------------------------------------------

function pretarget(spell,action)
	-- action is started
	if is_Busy == false then
		if RecastTimers:contains(spell.type) then
			local cast_spell = res.spells:with('name', spell.name)
			local spell_cast_time = cast_spell.cast_time *.2 + 3
			-- Get Spell Cast time
			SpellCastTime = spell_cast_time
		else
			-- Set duration of JA/WS
			SpellCastTime = 1.1
		end
		-- Spell timer counter
		Spellstart = os.time()
	else
		log('Player is Busy')
		cancel_spell()
		return
	end
	--Calls the function in the include file for basic checks
	pretargetcheck(spell,action)
	--Calls the job specific function
	pretarget_custom(spell,action)
	-- You passed the checks - player will begin action
	is_Busy = true
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for precast checks
-------------------------------------------------------------------------------------------------------------------

function precast(spell)
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(precastequip (spell), precast_custom(spell))
	-- here is where gear is actually equipped
	equip(equipSet)
 end

 -------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for midcast checks
-------------------------------------------------------------------------------------------------------------------

function midcast(spell)
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(midcastequip (spell), midcast_custom(spell))
	-- here is where gear is actually equipped
	equip(equipSet)
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for aftercast checks
-------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(aftercastequip (spell), aftercast_custom(spell))
	-- here is where gear is actually equipped
	equip(equipSet)

	-- Begin Rest Process - Spells have a hard delay where the JA's have a small delay
	if RecastTimers:contains(spell.type) then
		SpellCastTime = 3
	else
		SpellCastTime = .1
	end
	Spellstart = os.time()
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for any buff changes
-------------------------------------------------------------------------------------------------------------------

function buff_change(name,gain)
	equipSet = {}
	if is_Busy == false then
		--calls the include file and custom on a buff change
		equipSet = set_combine(choose_set(), buff_change_custom(name,gain))
		equip(equipSet)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for any player status changes
-------------------------------------------------------------------------------------------------------------------

function status_change(new,old)
	equipSet = {}
	--calls the include file and custom on a state change
	equipSet = set_combine(choose_set(), status_change_custom(new,old))
	equip(equipSet)
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for any pet changes
-------------------------------------------------------------------------------------------------------------------

function pet_change(pet,gain)
	equipSet = {}
	if player.main_job == 'SMN' or player.main_job == 'GEO' then
		if gain == false and player.main_job == 'SMN' then
			if not buffactive["Astral Conduit"] then
				avatar = "None"
				command_BP = 'None'
			else
				-- Avatar died during AFAC
			end
		else
			avatar = pet.name
			-- Default Offensive Blood Pacts
			if pet.name=='Ifrit' then
				command_BP = 'Flaming Crush'
			elseif pet.name=='Siren' then
				command_BP = 'Flaming Crush'
			elseif pet.name=='Ramuh' then
				command_BP = 'Volt Strike'
			elseif pet.name=='Cait Sith' then
				command_BP = 'Mewing Lulluby'
			else
				command_BP = 'None'
			end
		end
		equipSet = set_combine(choose_set(), pet_change_custom(pet,gain))
		equip(equipSet)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for pet mid actions
-------------------------------------------------------------------------------------------------------------------

function pet_midcast(spell)
	equipSet = {}
	-- This section is for SMN Blood Pact abilities
	if player.main_job == "SMN" then
		is_Busy = true
		if spell.name == "Perfect Defense" then
			equipSet = sets.Pet_Midcast.SummoningMagic
		elseif Debuff_BPs:contains(spell.name) then
			equipSet = sets.Pet_Midcast.SummoningMagic
		elseif Buff_BPs_Healing:contains(spell.name) then
			equipSet = sets.Pet_Midcast.SummoningMagic
		elseif Buff_BPs_Duration:contains(spell.name) then
			equipSet = sets.Pet_Midcast.SummoningMagic
		elseif spell.name == "Flaming Crush" then
			equipSet = sets.Pet_Midcast.FlamingCrush
		elseif ImpactDebuff and (spell.name=="Impact" or spell.name=="Conflag Strike") then
			equipSet = sets.Pet_Midcast.SummoningMagic
		elseif Magic_BPs_TP:contains(spell.name) then
			equipSet = sets.Pet_Midcast.Magic_BP_TP
		elseif Magic_BPs_NoTP:contains(spell.name) then
			equipSet = sets.Pet_Midcast.Magic_BP
		elseif Merit_BPs:contains(spell.name) then
			equipSet = sets.Pet_Midcast.Magic_BP_TP
		elseif Debuff_Rage_BPs:contains(spell.name) then
			equipSet = sets.Pet_Midcast.SummoningMagic
		else
			equipSet = sets.Pet_Midcast.Physical_BP
		end
	end
	equip(equipSet)
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by gearswap for pet after actions
-------------------------------------------------------------------------------------------------------------------

function pet_aftercast(spell)
	equipSet = {}
	equipSet = set_combine(choose_set(), pet_aftercast_custom(pet,gain))
	equip(equipSet)
	--action is compete release player unless its a BP
	coroutine.schedule(reset_action,.1)
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called to determine correct sets and not a built in gearswap call
-------------------------------------------------------------------------------------------------------------------

function choose_set()
	equipSet = {}
	-- Combat Checks
	if player.status == "Engaged" then
		-- Base line TP set
		if DualWield == true then
			equipSet = set_combine(equipSet,sets.OffenseMode[state.OffenseMode.value],sets.DualWield)
		else
			equipSet = set_combine(equipSet,sets.OffenseMode[state.OffenseMode.value])
		end
		-- Check if TreasureMode is active
		if state.TreasureMode.value ~= 'None' then
			-- Equip TH gear if mob is not marked as tagged
			if not th_info.tagged_mobs[player.target.id] then
				equipSet = set_combine(equipSet, sets.TreasureHunter)
			-- Equip TH gear if TreasureMode is Fulltime
			elseif state.TreasureMode.value == 'Fulltime' then
				equipSet = set_combine(equipSet, sets.TreasureHunter)
			-- Equip TH gear if TreasureMode is SATA and either SA, TA or Feint is active
			elseif state.TreasureMode.value == 'SATA' and (buffactive['Sneak Attack'] or buffactive['Trick Attack'] or buffactive['Feint']) then
				equipSet = set_combine(equipSet, sets.TreasureHunter)
			end
		end
	-- Idle sets
	else
		equipSet = sets.Idle
	end

	--Pet specific checks
	if pet.isvalid then
		--Augment built set for Perp cost
		equipSet = set_combine(equipSet, sets.Idle.Pet)
	end
	-- Equip movement gear
	if is_moving == true then
		equipSet = set_combine(equipSet, sets.Movement)
	end
	return equipSet
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called to determine if there are current buffs to be used
-------------------------------------------------------------------------------------------------------------------

function check_buff()

	if is_Busy == true then
		--Action not timed out yet
		if os.time() - Spellstart < SpellCastTime then
			return
		else 
			-- Action timed out
			is_Busy = false
		end
	end
	-- Auto Buff is on and not in a town
	if state.AutoBuff.value == 'ON' and is_Busy == false and not areas.Cities:contains(world.area) and not buffactive['Stun'] and not buffactive['Terror'] then

		command_JA = check_buff_JA()
		command_SP = 'None'
		if not is_moving then
			command_SP = check_buff_SP()
		end
		command_BP = 'None'
		if player.main_job == 'SMN' then
			command_BP = check_buff_BP()
		end

		if command_JA ~= 'None' then
			command_JA_execute()
		elseif command_SP ~= 'None' then
			command_SP_execute()
		elseif command_BP ~= 'None' then
			command_BP_execute()
		end
	end
end

function reset_action()
	Spellstart = os.time()
	is_Busy = false
end

-------------------------------------------------------------------------------------------------------------------
-- Determine whether we have sufficient ammo for the action being attempted.
-------------------------------------------------------------------------------------------------------------------

function do_bullet_checks(spell, spellMap, eventArgs, equipSet)
    local bullet_name
    local bullet_min_count = 1

	bullet_name = equipSet.ammo

    if spell.action_type == 'Ranged Attack' then
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end

    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == Ammo.Bullet.RA then
            add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
            return
        else
            add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
			cancel_spell()
			return
        end
    end
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == Ammo.Bullet.QD and available_bullets.count <= bullet_min_count then
        add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
		cancel_spell()
		return
    end
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and state.warned.value == false
        and available_bullets.count > 1 and available_bullets.count <= Ammo_Warning_Limit then
        local msg = '*****  LOW AMMO WARNING: '..tostring(available_bullets.count)..'x '..bullet_name..' on '..player.name..' *****'
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end

		send_command('send @others input /echo '..msg..'')
		
        add_to_chat(167, border)
        add_to_chat(167, msg)
        add_to_chat(167, border)

		--send_command('input /p <call10>')

        state.warned:set()
    elseif available_bullets.count > Ammo_Warning_Limit and state.warned then
        state.warned:reset()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- This function is called by the user via the self command - "gs c XXXX"
-------------------------------------------------------------------------------------------------------------------

function self_command(command)
	-- Updates the TH status
	command = command:lower()
	if command == 'update auto' then
		equip(set_combine(choose_set(),choose_set_custom()))
	-- Toggles the TH state
	elseif command == "th" then
		state.TreasureMode:cycle()
		info('Treasure Hunter Mode: ['..state.TreasureMode.value..']')
		equip(set_combine(choose_set(),choose_set_custom()))
	-- Toggles the Auto Buff function off/on
	elseif command == "autobuff" then
		state.AutoBuff:cycle()
		info('Auto Buff is ['..state.AutoBuff.value..']')
	elseif command == 'skillchain_burst' then
		if state.JobMode.value == 'Tier 1' then
			send_command('BT cast spell 1')
		elseif state.JobMode.value == 'Tier 2' then
			send_command('BT cast spell 2')
		elseif state.JobMode.value == 'Tier 3' then
			send_command('BT cast spell 3')
		elseif state.JobMode.value == 'Tier 4' then
			send_command('BT cast spell 4')
		elseif state.JobMode.value == 'Tier 5' then
			send_command('BT cast spell 5')
		elseif state.JobMode.value == 'Tier 6' then
			send_command('BT cast spell 6')
		end
	-- Shuts down instnace
	elseif command == 'shutdown' then
		send_command('terminate')
	-- Saves the location of HUD
	elseif command == 'save' then
		config.save(settings, windower.ffxi.get_player().name:lower())
		add_to_chat(80,'Settings saved')
	-- Toggles dispay of the HUD
	elseif command == 'display' then
		if settings.visible == true then
			settings.visible = false
			gs_status:hide()
			add_to_chat(80,'UI Hidden')
		else
			gs_status:show()
			settings.visible = true
			add_to_chat(80,'UI Shown')
		end
	elseif command == 'debug' then
		if settings.debug == true then
			settings.debug = false
			gs_debug:hide()
			windower.add_to_chat(80,'-------Debugging [OFF]-------')
		else
			settings.debug = true
			gs_debug:show()
			log('Debugging [ON]')
		end
	elseif command == 'info' then
		if settings.info == true then
			settings.info = false
			windower.add_to_chat(8,'Information [OFF]')
		else
			settings.info = true
			info('Information [ON]')
		end
	-- Esha Temps
	elseif command == 'temps' then
		escha_temps()
	-- Warp Ring
	elseif command == 'warp' then
		use_enchantment("Warp Ring")
	-- Warp Club
	elseif command == 'warp club' then
		use_enchantment("Warp Cudgel")
	-- Holla Teleport
	elseif command == 'holla' then
		use_enchantment("Dim. Ring (Holla)")
	-- Dem Teleport
	elseif command == 'dem' then
		use_enchantment("Dim. Ring (Dem)")
	-- Mea Teleport
	elseif command == 'mea' then
		use_enchantment("Dim. Ring (Mea)")
	-- CP Ring
	elseif command == 'cp' then
		use_enchantment("Trizek Ring")
	elseif command == "charmed" then
			state.Charmed.set("ON")
			enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
			info('Charm Set Equiped')
			equip(sets.Charm)
			disable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
	elseif command == "reset" then
			state.Charmed.set("OFF")
			enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
			info('Charm Set Unequiped')
			equip(set_combine(choose_set(),choose_set_custom()))
	-- Toggles the current player stances
	elseif command == 'modechange' then
		for i,v in ipairs(state.OffenseMode) do
			if state.OffenseMode.value == v then
				if state.OffenseMode.value ~= state.OffenseMode[#state.OffenseMode] then
					state.OffenseMode:set(state.OffenseMode[i+1])
				else
					state.OffenseMode:set(state.OffenseMode[1])
				end
				info('Mode: ['..state.OffenseMode.value..']')
				equip(set_combine(choose_set(),choose_set_custom()))
				return
			end
		end
	elseif command == 'jobmode' then
		for i,v in ipairs(state.JobMode) do
			if state.JobMode.value == v then
				if state.JobMode.value ~= state.JobMode[#state.JobMode] then
					state.JobMode:set(state.JobMode[i+1])
				else
					state.JobMode:set(state.JobMode[1])
				end
				info('Mode: ['..state.JobMode.value..']')
				equip(set_combine(choose_set(),choose_set_custom()))
				return
			end
		end
	elseif command == 'food' then
	    windower.send_command('input /item "'..Food..'" <me>')
	-- Command to use any enchanted item, can use either en or enl names from resources, autodetects slot, equip timeout and cast time
	elseif command:startswith('use') then
		use_enchantment(command:slice(5))
	end
	--use below for custom Job commands
	self_command_custom(command)
end

-- Functin used to exectue Job Abilities
function command_JA_execute()
	local cast_ability = res.job_abilities:with('name', command_JA)
	local target = ''
	if tostring(cast_ability.targets) == "{Self}" then
		target = '<me>'
	elseif tostring(cast_ability.targets) == "{Enemy}" then
		target = '<bt>'
	else
		target = '<me>'
	end
	--log('input /ja "'..command_JA..'" '..target..'')
	send_command('input /ja "'..command_JA..'" '..target..'')
end

-- Functin used to exectue Spells
function command_SP_execute()
	local cast_spell = res.spells:with('name', command_SP)
	local spell_cast_time = cast_spell.cast_time
	local target = ''
	if tostring(cast_spell.targets) == '{Self}' then
		target = '<me>'
	elseif tostring(cast_spell.targets) == '{Enemy}' then
		target = '<bt>'
	else
		target = '<me>'
	end
	--log('input /ma "'..command_SP..'" '..target..'')
	send_command('input /ma "'..command_SP..'" '..target..'')
end

-- Functin used to exectue Blood Pacts
function command_BP_execute()
	--log('input /ma "'..command_BP..'" <t>')
	send_command('input /pet "'..command_BP..'" <bt>')
end

-- Used for Escha Temp and Zerg
function escha_temps()
	info('Escha Temps')
	send_command("input /item \"Monarch's Drink\" <me>;wait 2.5;input /item \"Braver's Drink\" <me>;wait 2.5;input /item \"Fighter's Drink\" <me>;wait 2.5;input /item \"Champion's Drink\" <me>;wait 2.5;input /item \"Soldier's Drink\" <me>;wait 2.5;input /item \"Barbarian's Drink\" <me>")
end

-- Determines correct gear for the songs
function equip_song_gear(spell)
	equipSet = {}
	if spell.target.type == 'MONSTER' then
		if string.find(spell.english,'Finale') then equipSet = sets.Midcast.Finale end
		if string.find(spell.english,'Lullaby') then equipSet = sets.Midcast.Lullaby end
		if string.find(spell.english,'Threnody') then equipSet = sets.Midcast.Threnody end
		if string.find(spell.english,'Elegy') then equipSet = sets.Midcast.Elegy end
		if string.find(spell.english,'Requiem') then equipSet = sets.Midcast.Requiem end
	else
		if string.find(spell.english,'March') then equipSet = sets.Midcast.March end
		if string.find(spell.english,'Minuet') then equipSet = sets.Midcast.Minuet end
		if string.find(spell.english,'Madrigal') then equipSet = sets.Midcast.Madrigal end
		if string.find(spell.english,'Ballad') then equipSet = sets.Midcast.Ballad end
		if string.find(spell.english,'Scherzo') then equipSet = sets.Midcast.Scherzo end
		if string.find(spell.english,'Mazurka') then equipSet = sets.Midcast.Mazurka end
		if string.find(spell.english,'Paeon') then equipSet = sets.Midcast.Paeon end
		if string.find(spell.english,'Carol') then equipSet = sets.Midcast.Carol end
		if string.find(spell.english,'Minne') then equipSet = sets.Midcast.Minne end
		if string.find(spell.english,'Mambo') then equipSet = sets.Midcast.Mambo end
		if string.find(spell.english,'Etude') then equipSet = sets.Midcast.Etude end
		if string.find(spell.english,'Prelude') then equipSet = sets.Midcast.Prelude end
		if string.find(spell.english,'Dirge') then equipSet = sets.Midcast.Dirge end
		if string.find(spell.english,'Sirvente') then equipSet = sets.Midcast.Sirvente end
	end
	return equipSet
end

function use_enchantment(item)
    local item_table = res.items:with('enl',item) or res.items:with('en',item)
    if item_table == nil or not item_table.targets:contains('Self') then
        info("Invalid item.")
        return
    end
    is_Busy = true
    local slot =''
	if item_table.slots:contains(0) then
        slot = 'main'
    else
        for k,v in pairs(item_table.slots) do
            if v == true then
                slot = SlotList[k+1]
                break
            end
        end
    end
    enable(slot)
    equip({[slot]=item_table.en})
    disable(slot)
    windower.send_command('wait '..item_table.cast_delay+3 ..';input /item "'..item_table.en..'" <me>;wait '..item_table.cast_time-.5 ..';gs enable '..slot)
end

--Future Hooks for PT chat or tells
windower.register_event('chat message', function(message,sender,mode,gm)
	-- Mode 3 is tell
	-- Mode 4 is party

	--Ignore it if it's not party chat or a tell
    if mode ~= 3 or mode ~= 4 then 
		return
	end
     
    message = message:lower()
 
	-- Example Use
    if message:contains('hqzerg') then

    end

end)

-- Unbind Keys when the file is unloaded
function file_unload(file_name)
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	user_file_unload()
end

-- Puts on our fashion set, lockstyle it, then switch to our idle set.
send_command('bind f12 gs c ModeChange')
send_command('bind f11 gs c TH')
send_command('bind f10 gs c AutoBuff')
send_command('bind f9 gs c JobMode')

-- Command to Lock Style and Set the correct macros
function jobsetup(LockStylePallet,MacroBook,MacroSet)
	send_command('wait 10;input /lockstyleset '..LockStylePallet..';wait 1;input /macro book '..MacroBook..';wait 1;input /macro set '..MacroSet..';wait 1;input /echo Change Complete')
	coroutine.schedule(weaponcheck,5)
end

-- Called when the player's subjob changes.
function sub_job_change(new, old)
	send_command('wait 8;input /lockstyleset '..LockStylePallet..';')
	coroutine.schedule(weaponcheck,5)
	sub_job_change_custom()
end

-- Check if you have a Grip or shield to determinate if it's a Dual Wield build
function weaponcheck()
	current_abilities = windower.ffxi.get_abilities()
	if table.contains(current_abilities.job_traits,18) then -- Dual Wield trait
		DualWield = true
	else
		DualWield = false
	end
	equip(set_combine(choose_set(),choose_set_custom()))
end


-------------------------------------------------------------------------------------------------------------------
-- BELOW IS FROM MOTE TREASURE HUNTER TRACKER
-- ADDING DUE TO FACT YOU NEEDING TO BE ENGAGED TO HIT TREASURE HUNTER LOCKSET
-- CHANGED TO ALLOW ANY ENMITY GENERATING ACTION EQUIPING THE SET AND TRACK THE MOB
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Setup vars and events when first running the include.
-------------------------------------------------------------------------------------------------------------------

-- Ensure base tables are defined
th_info = th_info or {}

-- Tracking vars for TH.
th_info.tagged_mobs = T{}
th_info.last_player_target_index = 0
state.th_gear_is_locked = false

-- On changing targets, attempt to add TH gear.
function on_target_change_for_th(new_index, old_index)
    -- Only care about changing targets while we're engaged, either manually or via current target death.
    if player.status == 'Engaged' then
        -- If  the current player.target is the same as the new mob then we're actually
        -- engaged with it.
        -- If it's different than the last known mob, then we've actually changed targets.
        if player.target.index == new_index and new_index ~= th_info.last_player_target_index then
            th_info.last_player_target_index = player.target.index
            equip(set_combine(choose_set(),choose_set_custom()))
        end
    end
end

-- On any action event, mark mobs that we tag with TH.  Also, update the last time tagged mobs were acted on.
function on_action_for_th(action)
    --add_to_chat(123,'cat='..action.category..',param='..action.param)
    -- If player takes action, adjust TH tagging information
	if state.TreasureMode.value ~= 'None' then
		if action.actor_id == player.id and windower.ffxi.get_mob_by_id(action.targets[1].id).is_npc and TaggingCategories:contains(action.category) then
			if not th_info.tagged_mobs[action.targets[1].id] and settings.debug then
				add_to_chat(123,'Mob '..action.targets[1].id..' hit. Adding to tagged mobs table.')
			end
			th_info.tagged_mobs[action.targets[1].id] = os.time()
			if state.TreasureMode.value ~= 'Fulltime' then
				equip(set_combine(choose_set(),choose_set_custom()))
			end
		elseif th_info.tagged_mobs[action.actor_id] then
			th_info.tagged_mobs[action.actor_id] = os.time()
		else
			if th_info.tagged_mobs[action.targets[1].id] then
				th_info.tagged_mobs[action.targets[1].id] = os.time()
			end
		end
	end
	cleanup_tagged_mobs()
end

-- This function removes mobs from our tracking table when they die.
function on_incoming_chunk_for_th(id, data, modified, injected, blocked)
    if id == 0x29 then
        local target_id = data:unpack('I',0x09)
        local message_id = data:unpack('H',0x19)%32768

        -- Remove mobs that die from our tagged mobs list.
        if th_info.tagged_mobs[target_id] then
            -- 6 == actor defeats target
            -- 20 == target falls to the ground
            if message_id == 6 or message_id == 20 then
                if settings.debug then add_to_chat(123,'Mob '..target_id..' died. Removing from tagged mobs table.') end
                th_info.tagged_mobs[target_id] = nil
            end
        end
    end
end

-- Clear out the entire tagged mobs table when zoning.
function on_zone_change_for_th(new_zone, old_zone)
    if settings.debug then add_to_chat(123,'Zoning. Clearing tagged mobs table.') end
    th_info.tagged_mobs:clear()
end

-------------------------------------------------------------------------------------------------------------------
-- Extra utility functions.
-------------------------------------------------------------------------------------------------------------------

-- Remove mobs that we've marked as tagged with TH if we haven't seen any activity from or on them
-- for over 3 minutes.  This is to handle deagros, player deaths, or other random stuff where the
-- mob is lost, but doesn't die.
function cleanup_tagged_mobs()
    -- If it's been more than 3 minutes since an action on or by a tagged mob,
    -- remove them from the tagged mobs list.
    local current_time = os.time()
    local remove_mobs = S{}
    -- Search list and flag old entries.
    for target_id,action_time in pairs(th_info.tagged_mobs) do
        local time_since_last_action = current_time - action_time
        if time_since_last_action > 180 then
            remove_mobs:add(target_id)
            if settings.debug then add_to_chat(123,'Over 3 minutes since last action on mob '..target_id..'. Removing from tagged mobs list.') end
        end
    end
    -- Clean out mobs flagged for removal.
    for mob_id,_ in pairs(remove_mobs) do
        th_info.tagged_mobs[mob_id] = nil
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Event function registration calls.
-- Can call these now that the above functions have been defined.
-------------------------------------------------------------------------------------------------------------------

-- Register events to allow us to manage TH application.
windower.register_event('target change', on_target_change_for_th)
windower.register_event('action', on_action_for_th)
windower.raw_register_event('incoming chunk', on_incoming_chunk_for_th)
windower.raw_register_event('zone change', on_zone_change_for_th)

-------------------------------------------------------------------------------------------------------------------
-- BELOW IS FROM THE Aecho addon
-- ADDING DUE TO FACT SOME PEOPLE MAY NOT HAVE IT INSTALLED
-- ALLOWS CANCELING OF BUFFS EASIER
-------------------------------------------------------------------------------------------------------------------

windower.register_event('gain buff', function(id)
    local name = res.buffs[id].english
		if id == 6 and (Mage_Job:contains(player.main_job) or Mage_Job:contains(player.sub_job)) then
			if player.inventory['Echo Drops'] ~= nil then
				windower.send_command('input /item "Echo Drops" <me>')
			else 
				info('No Echo Drops in inventory.')
			end
		elseif id == 4 then
			if player.inventory['Remedy'] ~= nil then
				windower.send_command('input /item "Remedy" <me>')
			else 
				info('No Remedies in inventory.')
			end
		elseif id == 15 then
			if player.inventory['Holy Water'] ~= nil then -- Only here to notify player about Doom status and potential lack of Holy Waters
				info('DOOOOOOM!!!')
				windower.send_command('input /item "Holy Water" <me>')
			else 
				info('No Holy Waters in inventory. Unable to cure DOOM status!')
			end
		end
end)

-------------------------------------------------------------------------------------------------------------------
-- BELOW IS FROM THE CANCEL ADDON
-- ADDING DUE TO FACT SOME PEOPLE MAY NOT HAVE IT INSTALLED
-- ALLOWS CANCELING OF BUFFS EASIER
-------------------------------------------------------------------------------------------------------------------

language = windower.ffxi.get_info().language:lower()

function cancel(...)
	local command = table.concat({...},' ')
	if not command then return end
	local status_id_tab = command:split(',')
	status_id_tab.n = nil
	local ids = {}
	local buffs = {}
	for _,v in pairs(windower.ffxi.get_player().buffs) do
		for _,r in pairs(status_id_tab) do
			if windower.wc_match(res.buffs[v][language],r) or windower.wc_match(tostring(v),r) then
				cancel_buff(v)
				break
			end
		end
	end
end

function cancel_buff(id)
	windower.packets.inject_outgoing(0xF1,string.char(0xF1,0x04,0,0,id%256,math.floor(id/256),0,0)) -- Inject the cancel packet
end

-------------------------------------------------------------------------------------------------------------------
-- Movement Detection Section
-------------------------------------------------------------------------------------------------------------------

mov = {counter=0}

if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

windower.register_event('prerender',function()
	local now = os.clock()

	if now - UpdateTime > .1 then
		gs_status:text(display_box_update())
		gs_debug:text(debug_box_update())
		check_buff()
		UpdateTime = now
	end

    mov.counter = mov.counter + 1;
    if mov.counter > 5 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x and not buffactive['Mounted'] then
            local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.5
            if movement and not is_moving then
				if player.status ~= "Engaged" then
					is_moving = true
					--send_command('input /echo Moving! Status: '..player.status..'')
					equip(set_combine(choose_set(),choose_set_custom()))
				end
            elseif not movement and is_moving then
				is_moving = false
				--send_command('input /echo Stopped Moving! Status: '..player.status..'')
				equip(set_combine(choose_set(),choose_set_custom()))
			end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)

-- Section used to determine if player is performing an action
windower.register_event('action', function (data)
	if data ~= nil then
		local self = windower.ffxi.get_player()
		local targets = data.targets

		if data.actor_id == windower.ffxi.get_player().id then
		  if data.category == 4 then
			--info('Casting Finished')
		  elseif data.category == 8 then
			if data.param == 28787 then
			  --info('Spell Interupt - Choose Set')
				equip(set_combine(choose_set(),choose_set_custom()))
			elseif data.param == 24931 then
				--info('Casting Spell')
			end
		  end
		end

		-- Spell
		if data.category == 8 then
			local primarytarget = windower.ffxi.get_mob_by_id(targets[1].id)
			if primarytarget ~= nil then 
				-- Spell being cast on  you
				if primarytarget.name == self.name then
					-- Casting Spell
					if data.param == 24931 then
						if targets[1].actions[1].param ~= 0 then
							-- Get the ability
							ability = res.spells[targets[1].actions[1].param] -- .en
							-- Swap in Cursna Gear
							if ability.en == "Cursna" then
								equip(sets.Cursna_Recieved)
							end
						end
					-- Spell inturpted
					elseif data.param == 28787 then 
						if targets[1].actions[1].param ~= 0 then
							ability = res.spells[targets[1].actions[1].param] -- .en
							-- Swap gear back 
							if ability.en == "Cursna" then
								equip(set_combine(choose_set(),choose_set_custom()))
							end
						end
					end
				elseif data.category == 4 then
  					equip(set_combine(choose_set(),choose_set_custom()))
				end
			end
		end
	end
end)

function Unlock ()
	enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
end