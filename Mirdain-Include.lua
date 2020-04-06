-- loads gear from Moogle
include('organizer-lib')
-- Modes is the include for a mode-tracking variable class.  Used for state vars, below.
include('Modes')

AutoBuff = false
Custom = false
DualWield = false
AutoBurst = false

command_JA = "None"
command_SP = "None"
command_BP = "None"

avatar = "None"

is_AvatarBusy = false
is_Busy = false
in_Queue = false
is_Pianissimo = false
is_moving = false

ToggleCleave = 'Off'

--Modes for Melee
state = state or {}
state.OffenseMode = M{['description']='Melee Mode'}
state.OffenseMode:options('Normal','ACC','DT','AFAC - Physical','AFAC - Magical','AFAC - Flaming Crush')
state.OffenseMode:set('Normal')

--Notify current states
add_to_chat(8,'[F12] - Melee Mode is [Normal]')
add_to_chat(8,'[F11] - Treasure Hunter Mode is [OFF]')
add_to_chat(8,'[F10] - Auto Buff is [OFF]')

watch_buffs = S{	"light arts","addendum: white","penury","celerity","accession","perpetuance","rapture",
"dark arts","addendum: black","parsimony","alacrity","manifestation","ebullience","immanence",
"stun","petrified","silence","stun","sleep","slow","paralyze"}

--Song Sets
EnfeebleSong = S{
'Foe Requiem','Foe Requiem II','Foe Requiem III','Foe Requiem IV','Foe Requiem V','Foe Requiem VI','Foe Requiem VII','Battlefield Elegy', 'Carnage Elegy',
'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody', 'Ltng. Threnody', 'Water Threnody', 'Light Threnody','Dark Threnody','Fire Threnody II',
'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II', 'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II','Dark Threnody II','Magic Finale', 'Pining Nocturne'}

RecastTimers = S{'WhiteMagic','BlackMagic','Ninjutsu','BlueMagic','BardSong','SummoningMagic','CorsairRoll','SummonerPact'}

SleepSongs = S{'Foe Lullaby','Foe Lullaby II','Horde Lullaby','Horde Lullaby II',}
EnfeeblingNinjitsu = S{'Jubaku: Ichi','Kurayami: Ni', 'Hojo: Ichi', 'Hojo: Ni', 'Kurayami: Ichi', 'Dokumori: Ichi', 'Aisha: Ichi', 'Yurin: Ichi'}

Mage_Job = S{'BLM','RDM','WHM','BRD','BLU','GEO','SCH','NIN','PLD','RUN'}

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
-- Adoulin areas, where Ionis will grant special stat bonuses.
areas.Adoulin = S{
    "Yahse Hunting Grounds","Ceizak Battlegrounds","Foret de Hennetiel","Morimar Basalt Fields","Yorcia Weald","Yorcia Weald [U]","Cirdas Caverns","Cirdas Caverns [U]",
    "Marjami Ravine","Kamihr Drifts","Sih Gates","Moh Gates","Dho Gates","Woh Gates","Rala Waterways","Rala Waterways [U]","Outer Ra'Kaznar","Outer Ra'Kaznar [U]","Ra'Kaznar Inner Court"
}
-- Assault/Salvage areas, where Aht Urghan Rings will grant special stat bonuses.
areas.Assault = S{"Nyzul Isle","Leujaoam Sanctum","Mamool Ja Training Grounds","Periqia","Lebros Cavern","Ilrusi Atoll","Zhayolm Remnants","Arrapago Remnants","Bhaflau Remnants","Silver Sea Remnants"}
-- Proc weapon areas, where proc weapon sets in the weapon mode will not be skipped
areas.ProcZones = S{

}
-- Laggy zones where latency will be increased.
areas.LaggyZones = S{"Dynamis - San d'Oria [D]","Dynamis - Bastok [D]","Dynamis - Windurst [D]","Dynamis - Jeuno [D]","Reisenjima Henge","Reisenjima","Escha - Zi'Tah","Escha - Ru'Aun","Outer Ra'Kaznar [U]",}

function pretargetcheck(spell,action)
	--Cancel if pet is in middle of move
    if (pet.isvalid and pet_midaction()) then
		cancel_spell()
	end
	-- auto echo
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if buffactive['Paralysis'] and spell.type == 'JobAbility' then
			cancel_spell()
			send_command('input /item "Remedy" <me>')
		end
		if spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Remedy" <me>')
		end
	end
	--Stop Gear swap when can't WS
	if spell.type == 'WeaponSkill' and player.tp < 1000 then
		cancel_spell()
		add_to_chat(8,'TP:['..player.tp..']')
		--Cancel ability due to abilty not active
	elseif spell.type == 'JobAbility' or spell.type == 'BloodPactWard' or spell.type == 'BloodPactRage' or spell.type == 'PetCommand' then
		local abil_recasts_table = windower.ffxi.get_ability_recasts()
		local ability_time = abil_recasts_table[spell.recast_id]/60
		local min = math.floor(ability_time)
		local sec = (ability_time - min)*60
		if ability_time > 0 then
			add_to_chat(8,''..spell.name..' ['..string.format("%02d:%02d",min,sec)..']')
			cancel_spell()
		end
	elseif RecastTimers:contains(spell.type) then
		--Cancel spell due to abilty not active
		local spell_recasts = windower.ffxi.get_spell_recasts()
		local spell_time = spell_recasts[spell.recast_id]/100
		if spell_time > 0 then
			add_to_chat(8,''..spell.name..' ['..spell_time..']')
			cancel_spell()
		end
	end
	if spell.type == 'BardSong' then
		-- casting a buff song while engaged
		if spell.target.type == 'MONSTER' then
			if EnfeebleSong:contains(spell.english) or SleepSongs:contains(spell.english) then
				-- spell for enemey with enemy selected
			else
				if buffactive['pianissimo'] then
					windower.add_to_chat(8,'Piassimo Redirect - Select Character')
					cancel_spell()
					windower.send_command('input /ma \"'..spell.name..'\" <stpc>')
					is_Pianissimo = true
					return
				else
					change_target('<me>')
				end
			end
		else
			if spell.target.type ==  null then
				if EnfeebleSong:contains(spell.english) or SleepSongs:contains(spell.english) then
					--No target selected and should be for enemy
					cancel_spell()
					windower.add_to_chat(8,'No Enemy Selected')
				else
					if buffactive['pianissimo'] then
						if is_Pianissimo == false then
							cancel_spell()
							windower.add_to_chat(8,'Piassimo Redirect - Select Character')
							windower.send_command('input /ma "'..spell.name..'" <stpc>')
							is_Pianissimo = true
						else
							is_Pianissimo = false
						end
					else
						change_target('<me>')
					end
				end
			end
		end
	end
	--Used to fire a script
	if spell.name == "Poison" then
		windower.add_to_chat(8,'Dancing Chains')
		if player.main_job == "RDM" then
			send_command('exec RDM/CP')
		end
		if player.main_job == "GEO" then
			send_command('exec GEO/CP')
		end
		if player.main_job == "SCH" then
			send_command('exec SCH/CP')
		end
		if player.main_job == "BRD" then
			send_command('exec BRD/CP')
		end
		cancel_spell()
		return
	end
	--Used to fire a script
	if spell.name == "Poison II" then
		windower.add_to_chat(8,'Dancing Chains II')
		if player.main_job == "RDM" then
			send_command('exec RDM/CP2')
		end
		if player.main_job == "GEO" then
			send_command('exec GEO/CP2')
		end
		if player.main_job == "SCH" then
			send_command('exec SCH/CP2')
		end
		if player.main_job == "BRD" then
			send_command('exec BRD/CP2')
		end
		cancel_spell()
		return
	end
end

function precastequip(spell)
    if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	equipSet = {}
	if spell.type == 'WeaponSkill' then
		equipSet = sets.WS
		if equipSet[spell.english] then		
			equipSet = set_combine(equipSet, equipSet[spell.english])
			if state.OffenseMode.value == 'ACC' then
				--Augments the set built for ACC
				add_to_chat(8, '['..spell.english..'] Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				add_to_chat(8, '['..spell.english..'] Set')
			end
		else
			if state.OffenseMode.value == 'ACC' then
				--Augments the set built for ACC
				add_to_chat(8,'Using Default WS Set with Accuracy')
				equipSet = set_combine(equipSet, sets.WS.ACC)
			else
				add_to_chat(8,'Using Default WS Set')
			end
		end
    elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'JobAbility' then
		equipSet = sets.JA
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
			add_to_chat(8, '['..spell.english..'] Set')
		else
			add_to_chat(8,'JA not set')
		end
	elseif spell.type == 'CorsairRoll' then
		equipSet = sets.PhantomRoll
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		else
			add_to_chat(8,'Roll not set')
		end
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'SummonerPact' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'BardSong' then
		if not buffactive['Nightingale'] then
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Count)
			elseif spell.name == "Honor March" then
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Honor)
			else
				equipSet = set_combine(sets.Precast.Songs, sets.Song.Strength)
			end
		else 
			-- NiTro Songs
			windower.add_to_chat(8,'Nitro Mode')
			if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
				windower.add_to_chat(8, '['..spell.english..'] Set (Song Count - Daurdabla)')
				equipSet = set_combine(sets.Precast.DummySongs, sets.Song.Count)
			-- AOE sleep so equip Harp for max Range
			elseif spell.name == "Honor March" then
				equipSet = set_combine(sets.Midcast, sets.Song.Honor)
			elseif spell.name:contains('Horde') then
				windower.add_to_chat(8, '['..spell.english..'] Set (AOE Sleep - Daurdabla)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.AOE_Sleep)
			-- Normal Enfeebles
			elseif EnfeebleSong:contains(spell.english) then
				windower.add_to_chat(8, '['..spell.english..'] Set (Enfeebling - Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.Strength)
			else
				-- Augment the buff songs
				windower.add_to_chat(8, '['..spell.english..'] Set (Buff - Gjallarhorn)')
				equipSet = set_combine(sets.Midcast, equip_song_gear(spell), sets.Song.Strength)
			end
		end
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Precast.FastCast
	elseif spell.type == 'Trust' then
		equipSet = sets.Precast.FastCast
	end
	if 	state.TreasureMode.value ~= 'None' and spell.target.type == 'MONSTER' then
		TH_for_first_hit()
	end
	return equipSet
end

function midcastequip(spell)
	equipSet = {}
	if spell.type == 'WeaponSkill' then
		--Do nothing
	elseif spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		elseif spell.target.type == 'SELF' then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
			add_to_chat(8,'Enhancing set')
		elseif EnfeeblingNinjitsu:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
			add_to_chat(8,'Enfeebling set')
		else
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			add_to_chat(8,'Nuke set')
		end
	elseif spell.type == 'WhiteMagic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		elseif spell.name:contains('Cure') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Cure)
			windower.add_to_chat(8,'Cure Set')
		elseif spell.name:contains('Regen') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Regen)
			windower.add_to_chat(8,'Regen Set')
		elseif spell.name:contains('Cura') then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.CuragaSet)
			windower.add_to_chat(8,'Curaga Set')
		elseif spell.name == 'Cursna' then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Cursna)
			windower.add_to_chat(8,'Cursna Set')
		elseif spell.name:contains('Raise') or spell.name == "Arise" then
			equipSet = sets.Precast.FastCast
			windower.add_to_chat(8,'Raise Set')
		elseif spell.skill == 'Enhancing Magic' then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
			--Cancel Stoneskin if it is being cast and is an active buff
			if spell.name == 'Stoneskin' then
				if buffactive['Stoneskin'] then
	  	 			windower.add_to_chat(8,'Cancel Stoneskin')
					cancel('Stoneskin')
				end
			end
			if spell.name:contains('Refresh') then
				windower.add_to_chat(8,'Refresh Set')
				equipSet = set_combine(equipSet, sets.Midcast.Refresh)
			elseif Elemental_Bar:contains(spell.name) then 
				equipSet = set_combine(equipSet, sets.Midcast.Enhancing.Elemental)
				windower.add_to_chat(8,'Elemental Bar Set')
			else
				windower.add_to_chat(8,'Enhancing Magic Set')
			end
		elseif spell.skill == 'Enfeebling Magic' then
			windower.add_to_chat(8,'Enfeebling Magic Set')
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
		else
			add_to_chat(8,'Midcast not set')
		end
	elseif spell.type == 'BlackMagic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		elseif spell.skill == 'Enfeebling Magic' then
			windower.add_to_chat(8,'Enfeebling Magic Set')
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enfeebling)
		elseif spell.skill == 'Enhancing Magic' then
			windower.add_to_chat(8,'Enhancing Magic Set')
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Enhancing)
		else
			if AutoBurst == true then
				windower.add_to_chat(8,'Burst Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Burst)
			else
				windower.add_to_chat(8,'Nuke Set')
				equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			end
		end
	elseif spell.type == 'BardSong' and not buffactive['Nightingale'] then
		if spell.name == "Knight's Minne" or spell.name == "Knight's Minne II" or spell.name == "Army's Paeon" or spell.name == "Army's Paeon II" then
			windower.add_to_chat(8, '['..spell.english..'] Set (Song Count - Daurdabla)')
			equipSet = set_combine(sets.Precast.DummySongs, sets.Song.Count)
		-- AOE sleep so equip Harp for max Range
		elseif spell.name == "Honor March" then
			equipSet = set_combine(sets.Midcast, sets.Song.Honor)
		elseif spell.name:contains('Horde') then
			windower.add_to_chat(8, '['..spell.english..'] Set (AOE Sleep - Daurdabla)')
			equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.AOE_Sleep)
		-- Normal Enfeebles
		elseif EnfeebleSong:contains(spell.english) then
			windower.add_to_chat(8, '['..spell.english..'] Set (Enfeebling - Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, sets.Midcast.Enfeebling, equip_song_gear(spell), sets.Song.Strength)
		else
			-- Augment the buff songs
			windower.add_to_chat(8, '['..spell.english..'] Set (Buff - Gjallarhorn)')
			equipSet = set_combine(sets.Midcast, equip_song_gear(spell), sets.Song.Strength)
		end
	elseif spell.type == 'BlueMagic' then
		equipSet = sets.Midcast
		if ToggleCleave == "On" then
			equipSet = set_combine(equipSet, sets.Custom.Cleave.Weapons)
		end
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		elseif BlueNuke:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			add_to_chat(8,'Nuke set')
		elseif BlueSkill:contains(spell.english) then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, sets.Midcast.Nuke)
			add_to_chat(8,'Blue Skill set')
		else
			add_to_chat(8,'Midcast not set')
		end
	elseif spell.type == 'Geomancy' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = set_combine(equipSet, sets.Midcast.SIRD, equipSet[spell.english])
			add_to_chat(8, '['..spell.english..'] Set')
		elseif indicolure:contains(spell.english) then
			equipSet = sets.Geomancy.Indi
		elseif geomancy:contains(spell.english) then
			equipSet = sets.Geomancy.Geo
		else
			add_to_chat(8,'Midcast not set')
		end
	elseif spell.type == 'Trust' then
		--Not Used
	-- BP Timer gear needs to swap here
	elseif spell.type=="BloodPactWard" or spell.type=="BloodPactRage" then
		if not buffactive["Astral Conduit"] then
			equipSet = sets.Midcast
			equipSet = set_combine(equipSet, sets.Midcast.BP)
		end
	elseif spell.name=="Elemental Siphon" then
		equipSet = set_combine(equipSet, sets.Midcast.SummoningMagic)
	elseif spell.type=="SummonerPact" then
		equipSet = set_combine(equipSet, sets.Midcast.Summon)
	end
	-- Auto-cancel existing buffs
	if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
		windower.send_command('cancel 37;')
	elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
		windower.send_command('cancel 71;')
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
	return equipSet
end

function aftercastequip(spell)
    if pet_midaction() then
        return
    else
		equipSet = {}
		equipSet = choose_set()
		return equipSet
	end
end

function choose_set()
	equipSet = {}
	weaponcheck() --Update Combat stance
	if player.status == "Engaged" then
		equipSet = sets.TP
		if state.OffenseMode.value == 'Normal' then
			if DualWield == true then
				equipSet = set_combine(equipSet, sets.TP.DW)
			end
		elseif state.OffenseMode.value == 'ACC' then
			if DualWield == true then
				equipSet = set_combine(equipSet, sets.TP.DW, sets.TP.ACC)
			else
				equipSet = set_combine(equipSet, sets.TP.ACC)
			end
		elseif state.OffenseMode.value == 'DT' then
			if DualWield == true then
				equipSet = set_combine(equipSet, sets.TP.DW, sets.TP.DT)
			else
				equipSet = set_combine(equipSet, sets.TP.DT)
			end
		end
    else
		equipSet = sets.Idle
		if state.OffenseMode.value == 'DT' then
			equipSet = set_combine(equipSet, sets.DT)
		end
		if ToggleCleave == 'On' then
			equipSet = set_combine(equipSet, sets.Custom.Cleave.Idle)
		end
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

function check_buff()
	if AutoBuff == true and is_Busy == false and in_Queue == false and not areas.Cities:contains(world.area) then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		--Main MNK buffs
		if player.main_job == 'MNK' then
			if player.hpp < 51 and abil_recasts[15] == 0 then
				--send_command('input /ja "Chakra" <me>')
				command_JA = "Chakra"
			elseif not buffactive.Impetus and abil_recasts[31] == 0 then
				command_JA = "Impetus"
			elseif not buffactive.Footwork and abil_recasts[21] == 0 then
				command_JA = "Footwork"
			elseif not buffactive.Mantra and abil_recasts[19] == 0 then
				command_JA = "Mantra"
			elseif not buffactive.Dodge and abil_recasts[14] == 0 then
				command_JA = "Dodge"
			elseif not buffactive.Focus and abil_recasts[13] == 0 then
				command_JA = "Focus"
			end
		end
		--Sub WAR buffs
		if player.sub_job == 'WAR' then
			if player.main_job == "PLD" then
				return
			end
			if not buffactive['Berserk'] and abil_recasts[1] == 0 then
				command_JA = "Berserk"
			elseif not buffactive['Aggressor'] and abil_recasts[4] == 0 then
				command_JA = "Aggressor"
			elseif not buffactive['Warcry'] and abil_recasts[2] == 0 then
				command_JA = "Warcry"
			end
		end
		--sub SAM buffs
		if player.sub_job == 'SAM' or player.main_job == 'SAM' then
			if not buffactive['Hasso'] and not buffactive['Seigan'] and abil_recasts[138] == 0 then
				command_JA = "Hasso"
			end
		end
		--WHM Main buffs
		if player.main_job == 'WHM' then
			if not buffactive['Afflatus Solace'] and abil_recasts[29] == 0 then
				command_JA = "Afflatus Solace"
			end
		end
		--RDM Main buffs
		if player.main_job == 'RDM' then
			if not buffactive['Composure'] and abil_recasts[50] == 0 then
				command_JA = "Composure"
			end
		end
		--SMN Main buffs
		if player.main_job == 'SMN' then
			if pet.isvalid and not buffactive["Avatar\'s Favor"] and abil_recasts[176] == 0 then
				command_JA = "Avatar\'s Favor"
			end
		end
		--PLD Main buffs
		if player.main_job == 'PLD' then
			if not buffactive['Defender'] and abil_recasts[3] == 0 then
				command_JA = "Defender"
			elseif not buffactive['Majesty'] and abil_recasts[150] == 0 then
				command_JA = "Majesty"
			elseif not buffactive['Phalanx'] then
				command_SP = "Phalanx"
			elseif not buffactive['Enmity Boost'] then
				command_SP = "Crusade"
			end
		end
		if command_BP ~= "None" and buffactive["Astral Conduit"] and pet.isvalid and is_AvatarBusy == false then
			in_Queue = true
			windower.add_to_chat(8,"BP Execute")
			coroutine.schedule(command_BP_execute,.2)
		elseif command_JA ~= "None" then
			in_Queue = true
			coroutine.schedule(command_JA_execute,.2)
		elseif command_SP ~= "None" then
			in_Queue = true
			coroutine.schedule(command_SP_execute,.2)
		end
	end
end

function command_JA_execute()
	send_command('input /ja "'..command_JA..'" <me>')
	command_JA = "None"
end

function command_SP_execute()
	send_command('input /ma "'..command_SP..'" <me>')
	command_JA = "None"
end

function command_BP_execute()
	send_command('input /pet "'..command_BP..'" <bt>')
	command_SP = "None"
end

function dummy_songs()
	windower.add_to_chat(8,'Song Buff Begin')
	send_command("input /ma \"Army's Paeon IV\" <me>;wait 5.5;input /ma \"Army's Paeon III\" <me>;wait 5.5;input /ma \"Army's Paeon II\" <me>;wait 5.5;input /ma \"Army's Paeon\" <me>")
end

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
	end
	return equipSet
end

function jobsetup(LockStylePallet,MacroBook,MacroSet)
	--Command to Lock Style and Set the correct macros
	send_command('wait 10;input /lockstyleset '..LockStylePallet..';wait 1;input /macro book '..MacroBook..';wait .1;input /macro set '..MacroSet..';wait .1;gs c update auto;input /echo Change Complete')
end

function sub_job_change(new,old)
	send_command('wait 2;input /lockstyleset '..LockStylePallet..';wait 1;gs c update auto')
end

function weaponcheck()
	if player.sub_job == 'NIN' or player.sub_job == 'THF' or player.sub_job == 'DNC'  or player.main_job == 'THF' or player.main_job == 'NIN' or player.main_job == 'DNC' then -- Dual Wield Jobs
		if player.equipment.sub ~= nil then
			if player.equipment.sub:contains('Grip') or player.equipment.sub:contains('Shield') then
				DualWield = false
			else
				DualWield = true
			end
		end
	else
		DualWield = false
	end
end

function pretarget(spell,action)
	--Calls the function in the include for basic checks
	pretargetcheck(spell,action)
	--Calls the job specific function
	pretarget_custom(spell,action)
end

function precast(spell)
	is_Busy = true -- action is started
	enable()
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(precastequip (spell), precast_custom(spell))
	equip(equipSet)
	if spell.type == 'WeaponSkill' or  spell.type == 'JobAbility' or  spell.type == 'CorsairRoll' then
		disable()
	end
	if spell.type == 'BardSong' and buffactive['Nightingale'] then
		disable()
	end
	if spell.type=="BloodPactWard" or spell.type=="BloodPactRage" and buffactive["Astral Conduit"] then
		disable()
	end
 end

function midcast(spell)
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(midcastequip (spell), midcast_custom(spell))
	equip(equipSet)
	disable()
end

function aftercast(spell)
	is_Busy = false -- action is complete - release player
	enable()
	equipSet = {}
	--Generate the correct set from the include file and custom function
	equipSet = set_combine(aftercastequip (spell), aftercast_custom(spell))
	equip(equipSet)
	in_Queue = false
	coroutine.schedule(check_buff,.2)
end

function buff_change(name,gain)
	equipSet = {}
	--calls the include file and custom on a buff change
	equipSet = set_combine(choose_set(), buff_change_custom(name,gain))
	equip(equipSet)

	if is_Busy == false and in_Queue ==false then
		coroutine.schedule(check_buff,.2)
	end
end

function status_change(new,old)
	enable()
	equipSet = {}
	--calls the include file and custom on a state change
	equipSet = set_combine(choose_set(), status_change_custom(new,old))
	equip(equipSet)
end

function pet_change(pet,gain)
	if player.main_job == 'SMN' or player.main_job == 'GEO' then
		if gain == false then
			if buffactive["Astral Conduit"] then
				windower.add_to_chat(8,"Avatar Summon")
				check_buff() -- if Pet is lost summon
			else
				avatar = "None"
			end
		else
			avatar = pet.name
		end
		equipSet = {}
		equipSet = set_combine(choose_set(), pet_change_custom(pet,gain))
		equip(equipSet)
	end
end

function pet_midcast(spell)
	if player.main_job == "SMN" then
		is_AvatarBusy = true
		if spell.name == "Perfect Defense" then
			equip(sets.Pet_Midcast.SummoningMagic)
		elseif Debuff_BPs:contains(spell.name) then
			equip(sets.Pet_Midcast.SummoningMagic)
		elseif Buff_BPs_Healing:contains(spell.name) then
			equip(sets.Pet_Midcast.SummoningMagic)
		elseif Buff_BPs_Duration:contains(spell.name) then
			equip(sets.Pet_Midcast.SummoningMagic)
		elseif spell.name == "Flaming Crush" then
			equip(sets.Pet_Midcast.FlamingCrush)
		elseif ImpactDebuff and (spell.name=="Impact" or spell.name=="Conflag Strike") then
			equip(sets.Pet_Midcast.SummoningMagic)
		elseif Magic_BPs_TP:contains(spell.name) then
			equip(sets.Pet_Midcast.Magic_BP_TP)
		elseif Magic_BPs_NoTP:contains(spell.name) then
			equip(sets.Pet_Midcast.Magic_BP)
		elseif Merit_BPs:contains(spell.name) then
			equip(sets.Pet_Midcast.Magic_BP_TP)
		elseif Debuff_Rage_BPs:contains(spell.name) then
			equip(sets.Pet_Midcast.SummoningMagic)
		else
			equip(sets.Pet_Midcast.Physical_BP)
		end
		disable()
		command_BP = spell.name
	end
end

function pet_aftercast(spell)
	is_AvatarBusy = false
	enable()
	equipSet = {}
	equipSet = set_combine(choose_set(), pet_aftercast_custom(pet,gain))
	equip(equipSet)
	check_buff()
end

function self_command(command)
	if command == 'update auto' then
			equip(set_combine(choose_set(),choose_set_custom()))
	elseif command == "TH" then
		if 	state.TreasureMode.value == 'Tag' then
		    state.TreasureMode:set('None')
			unlock_TH()
			equip(set_combine(choose_set(),choose_set_custom()))
		else
			state.TreasureMode:set('Tag')
			if player.status == "Engaged" then
				TH_for_first_hit()
			end
		end
		add_to_chat(8,'Treasure Hunter Mode: ['..state.TreasureMode.value..']')
	elseif command == "AutoBuff" then
		if AutoBuff == true then
			AutoBuff = false
			add_to_chat(8,'Auto Buff is [OFF]')
		else
			AutoBuff = true
			add_to_chat(8,'Auto Buff is [ON]')
			check_buff()
		end
	elseif command == "AutoBurst" then
		if AutoBurst == true then
			AutoBurst = false
			add_to_chat(8,'Auto Burst is [OFF]')
		else
			AutoBurst = true
			add_to_chat(8,'Auto Burst is [ON]')
		end
	elseif command == 'SongBuff' then
		dummy_songs()
	elseif command == 'Warp' then
		is_Busy = true
		enable('left_Ring')
		equip({left_ring="Warp Ring"})
		windower.send_command('wait 1;gs disable left_ring;wait 10;input /item \"Warp Ring\" <me>;wait 5;gs enable left_ring')
	elseif command == 'Warp Club' then
		is_Busy = true
		enable('main')
		equip({main="Warp Club"})
		windower.send_command('wait 1;gs disable main;wait 10;input /item \"Warp Club\" <me>;wait 5;gs enable main')
	elseif command == 'Holla' then
		is_Busy = true
		enable('left_Ring')
		equip({left_ring="Dim. Ring (Holla)"})
		windower.send_command('wait 1;gs disable left_ring;wait 10;input /item \"Dim. Ring (Holla)\" <me>;wait 5;gs enable left_ring')
	elseif command == 'Dem' then
		is_Busy = true
		enable('left_Ring')
		equip({left_ring="Dim. Ring (Dem)"})
		windower.send_command('wait 1;gs disable left_ring;wait 10;input /item \"Dim. Ring (Dem)\" <me>;wait 5;gs enable left_ring')
	elseif command == 'Mea' then
		is_Busy = true
		enable('left_Ring')
		equip({left_ring="Dim. Ring (Mea)"})
		windower.send_command('wait 1;gs disable left_ring;wait 10;input /item \"Dim. Ring (Mea)\" <me>;wait 5;gs enable left_ring')
	elseif command == 'CP' then
		enable('left_Ring')
		equip({left_ring="Trizek Ring"})
		windower.send_command('wait 1;gs disable left_ring;wait 10;input /item \"Trizek Ring\" <me>;wait 5;gs enable left_ring')
	elseif command == "Weaponlock" then
		if Custom == true then
			Custom = false
			add_to_chat(8,'Weapon Lock is [OFF]')
			enable('main')
			enable('sub')
		else
			if player.main_job ==  'SMN' then
				equip({main="Nirvana"},{sub="Elan Strap +1"})
			end
			disable('main')
			disable('sub')
			Custom = true
			choose_set()
			add_to_chat(8,'Weapon Lock is [ON]')
		end
	elseif command == 'ModeChange' then
		if state.OffenseMode.value == 'Normal' then
			state.OffenseMode:set('ACC')
		elseif state.OffenseMode.value == 'ACC' then
			state.OffenseMode:set('DT')
		elseif state.OffenseMode.value == 'DT' then
			if player.main_job ==  'SMN' then
				state.OffenseMode:set('AFAC - Physical')
				send_command('gs enable all;wait .1;gs equip Pet_Midcast.Physical_BP;wait .1;gs disable all')
			else
				state.OffenseMode:set('Normal')
			end
		elseif state.OffenseMode.value == 'AFAC - Physical' then
			send_command('gs enable all;wait .1;gs equip Pet_Midcast.Magic_BP;wait .1;gs disable all')
			state.OffenseMode:set('AFAC - Magical')
		elseif state.OffenseMode.value == 'AFAC - Magical' then
			send_command('gs enable all;wait .1;gs equip Pet_Midcast.FlamingCrush;wait .1;gs disable all')
			state.OffenseMode:set('AFAC - Flaming Crush')
		elseif state.OffenseMode.value == 'AFAC - Flaming Crush' then
			send_command('gs enable all')
			state.OffenseMode:set('Normal')
		end
		add_to_chat(8,'Mode: ['..state.OffenseMode.value..']')
		equip(choose_set())
	end
	--use below for custom Job commands
	self_command_custom(command)
end

--Future Hooks
windower.register_event('chat message', function(message,sender,mode,gm)
    --Ignore it if it's not party chat or a tell

	-- Mode 3 is tell
	-- Mode 4 is party

    if mode ~= 3 then return end
     
    local player = windower.ffxi.get_player()
    message = message:lower()
 
    if message:contains('hqzerg') then

    end
end)


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
-- category == 1=melee, 2=ranged, 3=weaponskill, 4=spell, 6=job ability, 14=unblinkable JA
function th_action_check(category, param)
	--add_to_chat(8,'param =['..param..']')
    if category == 2 or -- any ranged attack
	    category == 3 or -- Aeolian Edge
        category == 4 or -- any magic action
        category == 6 or -- Provoke, Animated Flourish
        category == 14  -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
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
send_command('bind f9 gs c Custom')

-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	send_command('wait 8;input /lockstyleset '..LockStylePallet..';')
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
options = options or {}
state = state or {}
info = info or {}
state.TreasureMode = M{['description']='Treasure Mode'}

-- TH mode handling
state.TreasureMode:options('None','Tag')

-- Tracking vars for TH.
info.tagged_mobs = T{}
info.last_player_target_index = 0
state.th_gear_is_locked = false

-- Required gear set.  Expand this in the job file when defining sets.
sets.TreasureHunter = {}

-- Event registration is done at the bottom of this file.

-------------------------------------------------------------------------------------------------------------------
-- User-callable functions for TH handling utility.
-------------------------------------------------------------------------------------------------------------------

-- Can call to force a status refresh.
-- Also displays the current tagged mob table if in debug mode.
function th_update(cmdParams, eventArgs)
    if (cmdParams and cmdParams[1] == 'user') or not cmdParams then
        TH_for_first_hit()
        if _settings.debug_mode then
            print_set(info.tagged_mobs, 'Tagged mobs')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Local functions to support TH handling.
-------------------------------------------------------------------------------------------------------------------

-- Set locked TH flag to true, and disable relevant gear slots.
function lock_TH()
    state.th_gear_is_locked = true
    local slots = T{}
    for slot,item in pairs(sets.TreasureHunter) do
        slots:append(slot)
    end
    disable(slots)
end


-- Set locked TH flag to false, and enable relevant gear slots.
function unlock_TH()
	if state.TreasureMode.value ~= 'None'then
		state.th_gear_is_locked = false
		local slots = T{}
		for slot,item in pairs(sets.TreasureHunter) do
			slots:append(slot)
		end
		enable(slots)
		send_command('gs c update auto')
	end
end

-- For any active TH mode, if we haven't already tagged this target, equip TH gear and lock slots until we manage to hit it.
function TH_for_first_hit()
    if state.TreasureMode.value ~= 'None' then
        if not info.tagged_mobs[player.target.id] then
            if _settings.debug_mode then add_to_chat(123,'Prepping for first hit on '..tostring(player.target.id)..'.') end
            equip(sets.TreasureHunter)
            lock_TH()
        elseif state.th_gear_is_locked then
            if _settings.debug_mode then add_to_chat(123,'Target '..player.target.id..' has been tagged.  Unlocking.') end
            unlock_TH()
        else
            if _settings.debug_mode then add_to_chat(123,'Prepping for first hit on '..player.target.id..'.  Target has already been tagged.') end
        end
    elseif state.TreasureMode.value == 'None' and state.th_gear_is_locked then
        unlock_TH()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Event handlers to allow tracking TH application.
-------------------------------------------------------------------------------------------------------------------

-- On engaging a mob, attempt to add TH gear.  For any other status change, unlock TH gear slots.
function on_status_change_for_th(new_status_id, old_status_id)
    if gearswap.gearswap_disabled or T{2,3,4}:contains(old_status_id) or T{2,3,4}:contains(new_status_id) then return end
    
    local new_status = gearswap.res.statuses[new_status_id].english
    local old_status = gearswap.res.statuses[old_status_id].english

    if new_status == 'Engaged' then
        if _settings.debug_mode then add_to_chat(123,'Engaging '..player.target.id..'.') end
        info.last_player_target_index = player.target.index
        TH_for_first_hit()
    elseif old_status == 'Engaged' then
        if _settings.debug_mode and state.th_gear_is_locked then add_to_chat(123,'Disengaging. Unlocking TH.') end
        info.last_player_target_index = 0
        unlock_TH()
    end
end

-- On changing targets, attempt to add TH gear.
function on_target_change_for_th(new_index, old_index)
    -- Only care about changing targets while we're engaged, either manually or via current target death.
    if player.status == 'Engaged' then
        -- If  the current player.target is the same as the new mob then we're actually
        -- engaged with it.
        -- If it's different than the last known mob, then we've actually changed targets.
        if player.target.index == new_index and new_index ~= info.last_player_target_index then
            if _settings.debug_mode then add_to_chat(123,'Changing target to '..player.target.id..'.') end
            info.last_player_target_index = player.target.index
            TH_for_first_hit()
        end
    end
end

-- On any action event, mark mobs that we tag with TH.  Also, update the last time tagged mobs were acted on.
function on_action_for_th(action)
    --add_to_chat(123,'cat='..action.category..',param='..action.param)
    -- If player takes action, adjust TH tagging information
    if state.TreasureMode.value ~= 'None' and player.status == 'Engaged' or th_action_check(action.category, action.param) and state.TreasureMode.value ~= 'None' then
        if action.actor_id == player.id then
            -- category == 1=melee, 2=ranged, 3=weaponskill, 4=spell, 6=job ability, 14=unblinkable JA
            if state.TreasureMode.value == 'Fulltime' or
               (state.TreasureMode.value == 'SATA' and (action.category == 1 or ((state.Buff['Sneak Attack'] or state.Buff['Trick Attack']) and action.category == 3))) or
               (state.TreasureMode.value == 'Tag' and action.category == 1 and state.th_gear_is_locked) or -- Tagging with a melee hit
               (th_action_check and th_action_check(action.category, action.param)) -- Any user-specified tagging actions
               then
				for index,target in pairs(action.targets) do
                    if not info.tagged_mobs[target.id] and target.id ~= player.id then
						add_to_chat(8,'Treasure Hunter Tagged.')
                    end
                    info.tagged_mobs[target.id] = os.time()
                end
                if state.th_gear_is_locked then
                    unlock_TH()
                end
            end
        elseif info.tagged_mobs[action.actor_id] then
            -- If mob acts, keep an update of last action time for TH bookkeeping
            info.tagged_mobs[action.actor_id] = os.time()
        else
            -- If anyone else acts, check if any of the targets are our tagged mobs
            for index,target in pairs(action.targets) do
                if info.tagged_mobs[target.id] then
                    info.tagged_mobs[target.id] = os.time()
                end
            end
        end
    end
    cleanup_tagged_mobs()
end

-- Need to use this event handler to listen for deaths in case Battlemod is loaded,
-- because Battlemod blocks the 'action message' event.
--
-- This function removes mobs from our tracking table when they die.
function on_incoming_chunk_for_th(id, data, modified, injected, blocked)
    if id == 0x29 then
        local target_id = data:unpack('I',0x09)
        local message_id = data:unpack('H',0x19)%32768

        -- Remove mobs that die from our tagged mobs list.
        if info.tagged_mobs[target_id] then
            -- 6 == actor defeats target
            -- 20 == target falls to the ground
            if message_id == 6 or message_id == 20 then
                if _settings.debug_mode then add_to_chat(123,'Mob '..target_id..' died. Removing from tagged mobs table.') end
                info.tagged_mobs[target_id] = nil
            end
        end
    end
end

-- Clear out the entire tagged mobs table when zoning.
function on_zone_change_for_th(new_zone, old_zone)
    if _settings.debug_mode then add_to_chat(123,'Zoning. Clearing tagged mobs table.') end
    info.tagged_mobs:clear()
end

-- Save the existing function, if it exists, and call it after our own handling.
if job_state_change then
    job_state_change_via_th = job_state_change
end

-- Called if we change any user state fields.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Treasure Mode' then
        if newValue == 'None' and state.th_gear_is_locked then
            if _settings.debug_mode then add_to_chat(123,'TH Mode set to None. Unlocking gear.') end
            unlock_TH()
        elseif oldValue == 'None' then
            TH_for_first_hit()
        end
    end
    
    if job_state_change_via_th then
        job_state_change_via_th(stateField, newValue, oldValue)
    end
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
    for target_id,action_time in pairs(info.tagged_mobs) do
        local time_since_last_action = current_time - action_time
        if time_since_last_action > 180 then
            remove_mobs:add(target_id)
            if _settings.debug_mode then add_to_chat(123,'Over 3 minutes since last action on mob '..target_id..'. Removing from tagged mobs list.') end
        end
    end
    -- Clean out mobs flagged for removal.
    for mob_id,_ in pairs(remove_mobs) do
        info.tagged_mobs[mob_id] = nil
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Event function registration calls.
-- Can call these now that the above functions have been defined.
-------------------------------------------------------------------------------------------------------------------

-- Register events to allow us to manage TH application.
windower.register_event('status change', on_status_change_for_th)
windower.register_event('target change', on_target_change_for_th)
windower.raw_register_event('action', on_action_for_th)
windower.raw_register_event('incoming chunk', on_incoming_chunk_for_th)
windower.raw_register_event('zone change', on_zone_change_for_th)

-------------------------------------------------------------------------------------------------------------------
-- BELOW IS FROM THE Aecho addon
-- ADDING DUE TO FACT SOME PEOPLE MAY NOT HAVE IT INSTALLED
-- ALLOWS CANCELING OF BUFFS EASIER
-------------------------------------------------------------------------------------------------------------------

windower.register_event('gain buff', function(id)
    local name = res.buffs[id].english
    for key,val in pairs(watch_buffs) do
        if key:lower() == name:lower() then
            if name:lower() == 'silence' then
                windower.send_command('input /item "Remedy" '..windower.ffxi.get_player()["name"])
            end
        end
    end
end)

-------------------------------------------------------------------------------------------------------------------
-- BELOW IS FROM THE CANCEL ADDON
-- ADDING DUE TO FACT SOME PEOPLE MAY NOT HAVE IT INSTALLED
-- ALLOWS CANCELING OF BUFFS EASIER
-------------------------------------------------------------------------------------------------------------------

res = require 'resources'
name_index = {}
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

-- Movement Detection
mov = {counter=0}

if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end

windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter > 10 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
            if movement and not is_moving then
				if player.status ~= "Engaged" then
					--send_command('input /echo Moving! Status: '..player.status..'')
					send_command('gs equip Movement')
				end
                is_moving = true
            elseif not movement and is_moving then
				if player.status ~= "Engaged" then
					--send_command('input /echo Stopped Moving! Status: '..player.status..'')
					if pet.isvalid then
						send_command('gs equip Idle.Pet')
					else
						send_command('gs equip Idle')
					end
				end
				is_moving = false
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
if data.actor_id == windower.ffxi.get_player().id then
  if data.category == 4 then
	is_Busy = false
	--windower.add_to_chat(8,'Casting Finished')
  elseif data.category == 8 then
    if data.param == 28787 then
	  is_Busy = false
	  --windower.add_to_chat(8,'Spell Interupt - Choose Set')
	  equip(choose_set())
    elseif data.param == 24931 then
		is_Busy = true
		--windower.add_to_chat(8,'Casting Spell')
    end
  end
end
end)