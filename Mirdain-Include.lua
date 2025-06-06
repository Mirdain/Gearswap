-- Globals Variables
Mirdain_GS = '1.5'

-- Modes is the include file for a mode-tracking variable class.  Used for state vars, below.
include('Modes')

-- Weapons
sets.Weapons = {}
sets.Weapons.Sleep = {}
sets.Weapons.Shield = {}
sets.Weapons.Songs = {}
sets.Weapons.Songs.Midcast = {}

sets.Idle = {}
sets.Idle.Pet = {}
sets.Idle.Sublimation = {}
sets.Idle.Resting = {}
sets.Idle.TP = {}
sets.Idle.ACC = {}
sets.Idle.DT = {}

sets.Movement = {}
sets.Cursna_Received = {}

-- State sets
sets.OffenseMode = {}
sets.OffenseMode.Ranged = {}
sets.OffenseMode.AM = {}
sets.OffenseMode.AM1 = {}
sets.OffenseMode.AM2 = {}
sets.OffenseMode.AM3 = {}

sets.DualWield = {}
		
-- Precast
sets.Precast = {}
sets.Precast.FastCast = {}
sets.Precast.Blue_Magic = {}
sets.Precast.Enhancing = {}
sets.Precast.Cure = {}
sets.Precast.Utsusemi = {}
sets.Precast.Songs = {}

sets.Precast.RA = {}
sets.Precast.RA.Flurry = {}
sets.Precast.RA.Flurry_II = {}

-- Midcast
sets.Midcast = {}
sets.Midcast.RA = {}
sets.Midcast.RA['True Shot'] = {}
sets.Midcast.RA.TripleShot = {}
sets.Midcast.RA.DoubleShot = {}
sets.Midcast.RA.Barrage = {}
		
sets.Midcast.Enfeebling = {}
sets.Midcast.Enfeebling.MACC = {}
sets.Midcast.Enfeebling.Potency = {}
sets.Midcast.Enfeebling.Duration = {}

-- Midcast		
sets.Midcast.SIRD = {}
sets.Midcast.Nuke = {}
sets.Midcast.Burst = {}
sets.Midcast.Cure = {}
sets.Midcast.Curaga = {}
sets.Midcast.Cura = {}
sets.Midcast.Regen = {}
sets.Midcast.Refresh = {}
sets.Midcast.Enhancing = {}
sets.Midcast.Enhancing.Others = {}
sets.Midcast.Enhancing.Gain = {}
sets.Midcast.Enhancing.Elemental = {}
sets.Midcast.Enhancing.Status = {}
sets.Midcast.Enhancing.Skill = {}
		
sets.Midcast.Aspir = {}
sets.Midcast.Drain = {}
sets.Midcast.Dark = {}
sets.Midcast.Dark.MACC = {}
sets.Midcast.Dark.Absorb = {}
sets.Midcast.Dark.Enhancing = {}
sets.Midcast.Skill = {}
sets.Midcast.ACC = {}
sets.Midcast.BP = {}
sets.Midcast.SummoningMagic = {}
sets.Midcast.Summon = {}

-- Bard Midcast
sets.Midcast.DummySongs = {}
sets.Midcast.Finale = {}
sets.Midcast.Lullaby = {}
sets.Midcast.Threnody = {}
sets.Midcast.Elegy = {}
sets.Midcast.Requiem = {}
sets.Midcast.March = {}
sets.Midcast.Minuet = {}
sets.Midcast.Madrigal = {}
sets.Midcast.Ballad = {}
sets.Midcast.Scherzo = {}
sets.Midcast.Mazurka = {}
sets.Midcast.Paeon = {}
sets.Midcast.Carol = {}
sets.Midcast.Minne = {}
sets.Midcast.Mambo = {}
sets.Midcast.Etude = {}
sets.Midcast.Prelude = {}
sets.Midcast.Dirge ={}
sets.Midcast.Sirvente = {}
sets.Midcast.Aria = {}

-- Midcast for Ranged Attacks and Aftermath
sets.Midcast.AM = {}
sets.Midcast.AM.RA = {}
sets.Midcast.AM1 = {}
sets.Midcast.AM1.RA = {}
sets.Midcast.AM2 = {}
sets.Midcast.AM2.RA = {}
sets.Midcast.AM3 = {}
sets.Midcast.AM3.RA = {}

--Weaponskills
sets.WS = {}
sets.WS.ACC =  {}
sets.WS.ACC.RA = {}
sets.WS.PDL = {}
sets.WS.PDL.RA = {}
sets.WS.SB = {}
sets.WS.SB.RA = {}
sets.WS.CRIT = {}
sets.WS.CRIT.RA = {}
sets.WS.MEVA = {}
sets.WS.MEVA.RA = {}
sets.WS.AM = {}
sets.WS.AM.RA = {}
sets.WS.AM1 = {}
sets.WS.AM1.RA = {}
sets.WS.AM2 = {}
sets.WS.AM2.RA = {}
sets.WS.AM3 = {}
sets.WS.AM3.RA = {}
		
-- Other Sets
sets.JA = {}
sets.Waltz = {}
sets.Jig = {}
sets.Samba = {}
sets.Step = {}
sets.Flourish = {}
sets.Jugs = {}
sets.PhantomRoll = {}
sets.TreasureHunter = {}
sets.QuickDraw = {}

sets.Storms = {}
sets.Enmity = {}
sets.Diffusion = {}
sets.Geomancy = {}
sets.Geomancy.Geo = {}
sets.Geomancy.Indi = {}
sets.Geomancy.Indi.Entrust = {}
sets.Pet_Midcast = {}

sets.PhalanxReceived = {}
sets.CureReceived = {}
sets.RefreshReceived = {}

sets.Ready = {}
sets.Ready.Magic = {}
sets.Ready.TP = {}
sets.Ready.Debuff = {}
sets.Ready.Standard = {}	

Instrument = {}
Instrument.Count = {}
Instrument.Potency = {}
Instrument.Pianissimo = {}
Instrument.Honor = {}
Instrument.Aria = {}
Instrument.AOE_Sleep = {}
Instrument.Idle = {}
Instrument.TP = {}
Instrument.Mordant = {}
Instrument.QuickMagic = {}
Instrument.FastCast = {}
Instrument.MAB = {}

state = state or {}

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
	state.TreasureMode:options('None','Tag','Full Time','SATA')
	state.TreasureMode:set('Full Time')
else
	state.TreasureMode:options('None','Tag','Full Time')
	state.TreasureMode:set('None')
end

--Weapon specific modes
state.WeaponMode = {}
state.WeaponMode = M{['description']='Weapon Specific Mode'}
state.WeaponMode:options('OFF','ON')
state.WeaponMode:set('OFF')

--Job specific modes
state.JobMode = {}
state.JobMode = M{['description']='Job Specific Mode'}
state.JobMode:options('OFF','ON')
state.JobMode:set('OFF')

--Job specific modes
state.JobMode2 = {}
state.JobMode2 = M{['description']='Job Specific Mode'}
state.JobMode2:options('OFF','ON')
state.JobMode2:set('OFF')

--Ranged Attack mode
state.RAMode = {}
state.RAMode = M{['description']='Ranged Attack Mode'}
state.RAMode:options('Bullet','Arrow','Bolt')
state.RAMode:set('Bullet')

--State for Ammunition check
state.warned = M(false)

--Ammunition
Ammo = {}
Ammo.Bullet = {}
Ammo.Arrow = {}
Ammo.Bolt = {}

Ammo_Warning_Limit = 99

-- User Definde

command_JA = "None"
command_SP = "None"
command_BP = "None"

is_Busy = false
AutoItem = false
Random_Lockstyle = false
Lockstyle_List = {}

Elemental_WS = S{
	'Earth Shot','Ice Shot','Water Shot','Fire Shot','Wind Shot','Thunder Shot',
	'Gust Slash','Cyclone','Energy Steal','Energy Drain','Aeolian Edge',
	'Burning Blade','Red Lotus Blade','Shining Blade','Seraph Blade','Sanguine Blade',
	'Frostbite','Freezebite','Herculean Slash',
	'Cloudsplitter','Primal Rend',
	'Dark Harvest','Shadow of Death','Infernal Scythe',
	'Thunder Thrust','Raiden Thrust',
	'Blade: Teki','Blade: To','Blade: Chi','Blade: Ei','Blade: Yu',
	'Tachi: Goten','Tachi: Kagero','Tachi: Jinpu','Tachi: Koki',
	'Shining Strike','Seraph Strike','Flash Nova',
	'Rock Crusher','Earth Crusher', 'Starburst', 'Sunburst','Cataclysm','Vidohunir','Garland of Bliss','Omniscience',
	'Flaming Arrow',
	'Hot Shot','Wildfire','Trueflight','Leaden Salute',
	}

Geomancy_List = M('Geo-Acumen', 'Geo-Attunement', 'Geo-Barrier', 'Geo-STR', 'Geo-DEX', 'Geo-VIT', 'Geo-AGI', 'Geo-INT', 'Geo-MND', 'Geo-CHR', 'Geo-Fade',
             'Geo-Fend', 'Geo-Focus', 'Geo-Frailty', 'Geo-Fury', 'Geo-Gravity', 'Geo-Haste', 'Geo-Languor', 'Geo-Malaise', 'Geo-Paralysis', 
             'Geo-Poison', 'Geo-Precision', 'Geo-Refresh', 'Geo-Regen', 'Geo-Slip', 'Geo-Slow', 'Geo-Torpor', 'Geo-Vex', 'Geo-Voidance', 'Geo-Wilt')

Indicolure_List = M('Indi-Acumen', 'Indi-Attunement', 'Indi-Barrier', 'Indi-STR', 'Indi-DEX', 'Indi-VIT', 'Indi-AGI', 'Indi-INT', 'Indi-MND', 'Indi-CHR', 'Indi-Fade',
             'Indi-Fend', 'Indi-Focus', 'Indi-Frailty', 'Indi-Fury', 'Indi-Gravity', 'Indi-Haste', 'Indi-Languor', 'Indi-Malaise', 'Indi-Paralysis', 
             'Indi-Poison', 'Indi-Precision', 'Indi-Refresh', 'Indi-Regen', 'Indi-Slip', 'Indi-Slow', 'Indi-Torpor', 'Indi-Vex', 'Indi-Voidance', 'Indi-Wilt')

Enfeebling_Song = S{ 'Foe Requiem','Foe Requiem II','Foe Requiem III','Foe Requiem IV','Foe Requiem V','Foe Requiem VI','Foe Requiem VII','Battlefield Elegy', 'Carnage Elegy',
	'Fire Threnody', 'Ice Threnody', 'Wind Threnody', 'Earth Threnody', 'Ltng. Threnody', 'Water Threnody', 'Light Threnody','Dark Threnody','Fire Threnody II',
	'Ice Threnody II', 'Wind Threnody II', 'Earth Threnody II', 'Ltng. Threnody II', 'Water Threnody II', 'Light Threnody II','Dark Threnody II','Magic Finale', 'Pining Nocturne'}

Enfeeble_Acc = S{'Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga'}
Enfeeble_Potency = S{'Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II'}
Enfeeble_Duration = S{'Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga','Bind','Bind II'}

Dark_Acc = S{'Death','Kaustra','Stun'}
Dark_Absorb = S{'Absorb-ACC','Absorb-AGI','Absorb-Attri','Absorb-CHR','Absorb-DEX','Absorb-INT','Absorb-MND','Absorb-STR','Absorb-TP','Absorb-VIT','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III'}
Dark_Enhancing = S{'Dread Spikes','Endark','Endark II','Klimaform','Tractor'}

Enhancing_Skill = S{'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Enblizzard','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'}
Divine_Skill = S{'Enlight', 'Enlight II', 'Flash', 'Repose', 'Holy', 'Holy II', 'Banish', 'Banish II', 'Banish III', 'Banishga', 'Banishga II',}

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueACC = S{'Cruel Joke','Dream Flower','Reaving Wind'}
BlueHealing = S{'Magic Fruit','Healing Breeze','Wild Carrot','Plenilune Embrace','Restoral'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{'Jettatura','Geist Wall','Blank Gaze','Sheep Song','Sandspin','Healing Breeze'}

Elemental_Enfeeble = S{'Burn','Frost','Choke','Rasp','Shock','Drown'}

Buff_BPs_Duration = S{'Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Glittering Ruby','Earthen Ward','Hastega',
	'Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing'}
Buff_BPs_Healing = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
Debuff_BPs = S{'Mewing Lullaby','Eerie Eye','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Slowga','Tidal Roar','Diamond Storm','Sleepga','Shock Squall'}
Debuff_Rage_BPs = S{'Moonlit Charge','Tail Whip'}
Magic_BPs_NoTP = S{'Holy Mist','Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Night Terror','Thunderspark'}
Magic_BPs_TP = S{'Impact','Conflag Strike','Level ? Holy','Lunar Bay'}
Merit_BPs = S{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm'}
Physical_BPs_TP = S{'Rock Buster','Mountain Buster','Crescent Fang','Spinning Dive'}
AvatarList = S{'Shiva','Ramuh','Garuda','Leviathan','Diabolos','Titan','Fenrir','Ifrit','Carbuncle','Fire Spirit','Air Spirit','Ice Spirit','Thunder Spirit',
	'Light Spirit','Dark Spirit','Earth Spirit','Water Spirit','Cait Sith','Alexander','Odin','Atomos'}

SongCount = S{"Knight's Minne", "Knight's Minne II", "Army's Paeon", "Army's Paeon II", "Army's Paeon III", "Army's Paeon IV", "Fowl Aubade", "Herb Pastoral", 
	"Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte"}

Enfeebling_Ninjitsu = S{'Jubaku: Ichi','Kurayami: Ni', 'Hojo: Ichi', 'Hojo: Ni', 'Kurayami: Ichi', 'Dokumori: Ichi', 'Aisha: Ichi', 'Yurin: Ichi'}

Elemental_Bar = S{'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzara','Baraera','Barstonra','Barthundra','Barwatera'}
Status_Bar = S{'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra','Barsilencera','Barsleep','Barpoison','Barparalyze','Barblind','Barvirus','Barpetrify','Baramnesia','Barsilence'}

-- Standard Ready Moves
Ready_Standard = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
    'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
    'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
    'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
    'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
    'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
    'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
    'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
    'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
    'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
    'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
    'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
    'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
    'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
    'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Crossthrash','Predatory Glare',
	'Hoof Volley','Nihility Song','Frenzied Rage','Venom Shower','Mega Scissors','Fluid Toss','Fluid Spread',
	'Digest','Rhinowrecker'}

-- List of Magic-based Ready moves
Ready_Magic = S{'Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
	'Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field',
	'Sandpit','Sandblast','Venom Spray','Bubble Shower','Filamented Hold','Queasyshroom','Silence Gas',
	'Numbshroom','Spore','Dark Spore','Shakeshroom','Fireball','Plague Breath','Infrasonics','Chaotic Eye',
	'Blaster','Intimidate','Snow Cloud','Noisome Powder','TP Drainkiss','Jettatura','Charged Whisker',
	'Purulent Ooze','Corrosive Ooze','Aqua Breath','Molting Plumage','Stink Bomb','Nectarous Deluge',
	'Nepenthic Plunge','Pestilent Plume','Foul Waters','Spider Web'}

-- List of TP based Ready moves
Ready_TP = S{'Sic','Somersault','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
	'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Geist Wall','Numbing Noise','Frogkick',
	'Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
	'Mandibular Bite','Metallic Body','Bubble Shower','Bubble Curtain','Scissor Guard','Grapple','Spinning Top',
	'Double Claw','Filamented Hold','Spore','Blockhead','Secretion','Fireball','Tail Blow','Plague Breath',
	'Brain Crush','Infrasonics','Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive',
	'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Noisome Powder','Beak Lunge','Suction',
	'Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker',
	'Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath','Sensilla Blades',
	'Tegmina Buffet','Zealous Snort','Pestilent Plume','Foul Waters','Spider Web'}

-- Magic ACC Based Ready moves
Ready_Debuff = S{'Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
    'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast','Filamented Hold',
	'Spore','Fireball','Infrasonics','Chaotic Eye','Blaster','Intimidate','Noisome Powder','TP Drainkiss',
	'Jettatura','Purulent Ooze','Corrosive Ooze','Pestilent Plume','Spider Web','Nihility Song'}

-- Physical Ready moves that have Multi-Hit
Ready_Multi = S{'Sweeping Gouge','Tickling Tendrils','Chomp Rush','Pentapeck','Wing Slap','Pecking Flurry'}

UI_Name = ''
UI_Name2 = ''

-- Keep local variables to the include
do
	-- Used to save the user specific settings
	local config = require('config')
	local res = require 'resources'

	local default = { visible = true, debug = false, info = true, warn = true,
		Display_Box = {text={size=10,font='Consolas',red=255,green=255,blue=255,alpha=255},pos={x=1636,y=803},bg={visible=true,red=0,green=0,blue=0,alpha=102},},
		Debug_Box = {text={size=10,font='Consolas',red=255,green=255,blue=255,alpha=255},pos={x=1470,y=764},bg={visible=true,red=0,green=0,blue=0,alpha=102},},}

	local buttons = {'State','TH Mode','Auto Buff','Weapon','Job Mode'}

	local Storms = S{"Aurorastorm", "Voidstorm", "Firestorm", "Sandstorm", "Rainstorm", "Windstorm", "Hailstorm", "Thunderstorm", 
	"Aurorastorm II", "Voidstorm II", "Firestorm II", "Sandstorm II", "Rainstorm II", "Windstorm II", "Hailstorm II", "Thunderstorm II"}

	local UtsusemiSpell = S{'Utsusemi: Ichi','Utsusemi: Ni', 'Utsusemi: San'}
	local RecastTimers = S{'WhiteMagic','BlackMagic','Ninjutsu','BlueMagic','BardSong','SummoningMagic','SummonerPact'}
	local SleepSongs = S{'Foe Lullaby','Foe Lullaby II','Horde Lullaby','Horde Lullaby II',}
	local Phalanxes = S{'Phalanx', 'Phalanx II' }
	local CureSpells = S{'Cure','Cure II','Cure III','Cure IV','Cure V','Cure VI','Magic Fruit','Wild Carrot','Plenilune Embrace',}
	local CuragaSpells = S{'Curaga','Curaga II','Curaga III','Curaga IV','Curaga V','Cura','Cura II','Cura III','White Wind',}
	local RefreshSpells =  S{"Refresh","Refresh II", "Refresh III",}
	
	local Divergence_Zones = S { "Dynamis - San d'Oria [D]", "Dynamis - Bastok [D]", "Dynamis - Windurst [D]", "Dynamis - Jeuno [D]" }

	local settings = config.load(default)

	local gs_status = texts.new("",settings.Display_Box)
	if settings.visible then gs_status:show() end

	local gs_debug = texts.new("",settings.Debug_Box)
	if settings.debug then gs_debug:show() end

	local DualWield = false
	local TwoHand = false

	local SpellCastTime = 0
	local Spellstart = os.clock()

	local is_Pianissimo = false
	local is_moving = false
	local is_first_time_load = true

	local last_skillchain_id = 0
	local last_skillchain_time = 0
	local last_skillchain_elements = {}

	local UpdateTime1 = os.clock()
	local UpdateTime2 = os.clock()
	local Location = {x=0, y=0, z=0}
	local main_engine_time = os.clock()

	local Require_Update = false
	local Use_Item_Command = ''

	-- Tracking vars for TH
	local th_info = {}
	th_info.tagged_mobs = T{}
	th_info.last_player_target_index = 0

	-- For TH handling, which event IDs to register for tagging
	local TaggingCategories = S{1,2,3,4,6,11,14} 

	local Mage_Job = S{'BLM','RDM','WHM','BRD','BLU','GEO','SCH','NIN','PLD','RUN','DRK','SMN'}

	-- City areas for town gear and behavior.
	local Cities = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower","Port San d'Oria","Northern San d'Oria",
		"Southern San d'Oria","Chateau d'Oraguille","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate","The Colosseum","Tavnazian Safehold","Nashmau","Selbina",
		"Mhaura","Rabao","Norg","Kazham","Eastern Adoulin","Western Adoulin","Celennia Memorial Library","Mog Garden","Leafallia"}

	local Language = windower.ffxi.get_info().language:lower()

	local skillchains = {
		[288] = {id=288,english='Light',elements={'Light','Lightning','Wind','Fire'}},
		[289] = {id=289,english='Darkness',elements={'Dark','Ice','Water','Earth'}},
		[290] = {id=290,english='Gravitation',elements={'Dark','Earth'}},
		[291] = {id=291,english='Fragmentation',elements={'Lightning','Wind'}},
		[292] = {id=292,english='Distortion',elements={'Ice','Water'}},
		[293] = {id=293,english='Fusion',elements={'Light','Fire'}},
		[294] = {id=294,english='Compression',elements={'Dark'}},
		[295] = {id=295,english='Liquefaction',elements={'Fire'}},
		[296] = {id=296,english='Induration',elements={'Ice'}},
		[297] = {id=297,english='Reverberation',elements={'Water'}},
		[298] = {id=298,english='Transfixion', elements={'Light'}},
		[299] = {id=299,english='Scission',elements={'Earth'}},
		[300] = {id=300,english='Detonation',elements={'Wind'}},
		[301] = {id=301,english='Impaction',elements={'Lightning'}},
		[385] = {id=385,english='Light',elements={'Light','Lightning','Wind','Fire'}},
		[386] = {id=386,english='Darkness',elements={'Dark','Ice','Water','Earth'}},
		[387] = {id=387,english='Gravitation',elements={'Dark','Earth'}},
		[388] = {id=388,english='Fragmentation',elements={'Lightning','Wind'}},
		[389] = {id=389,english='Distortion',elements={'Ice','Water'}},
		[390] = {id=390,english='Fusion',elements={'Light','Fire'}},
		[391] = {id=391,english='Compression',elements={'Dark'}},
		[392] = {id=392,english='Liquefaction',elements={'Fire'}},
		[393] = {id=393,english='Induration',elements={'Ice'}},
		[394] = {id=394,english='Reverberation',elements={'Water'}},
		[395] = {id=395,english='Transfixion', elements={'Light'}},
		[396] = {id=396,english='Scission',elements={'Earth'}},
		[397] = {id=397,english='Detonation',elements={'Wind'}},
		[398] = {id=398,english='Impaction',elements={'Lightning'}},
		[767] = {id=767,english='Radiance',elements={'Light','Lightning','Wind','Fire'}},
		[768] = {id=768,english='Umbra',elements={'Dark','Ice','Water','Earth'}},
		[769] = {id=769,english='Radiance',elements={'Light','Lightning','Wind','Fire'}},
		[770] = {id=770,english='Umbra',elements={'Dark','Ice','Water','Earth'}},}

	--Unlock any previously locked gear
	enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')

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
		if buffactive['Sleep'] then
			cancel_spell()
			if sets.Idle then
				equip(sets.Idle)
			else warn('sets.Idle not found!') end
			if sets.Weapons then
				if sets.Weapons.Sleep then
					equip(sets.Weapons.Sleep)
				else warn('sets.Weapons.Sleep not found!') end
			else warn('sets.Weapons not found!') end
		end
		if buffactive['Stun'] then
			cancel_spell()	
			if sets.Idle then
				equip(sets.Idle)
			else warn('sets.Idle not found!') end
			return
		end
		if buffactive['KO'] then
			cancel_spell()
			return
		end
		if buffactive['Petrification'] then
			cancel_spell()	
			if sets.Idle then
				equip(sets.Idle)
			else warn('sets.Idle not found!') end
			return
		end
		if buffactive['Charm'] then
			cancel_spell()
			return
		end
		if buffactive['Terror'] then
			cancel_spell()
			if sets.Idle then
				equip(sets.Idle)
			else warn('sets.Idle not found!') end
			return
		end
		if AutoItem and not buffactive['Muddle'] then
			-- Auto Remedy --
			if buffactive['Paralysis'] and spell.type == 'JobAbility' then
				if player.inventory['Remedy'] ~= nil then
					cancel_spell()
					windower.chat.input('/item "Remedy" <me>')
					log('Cancel Spell - Using Items')
				end
			end
			-- Auto Echo Drops
			if spell.action_type == 'Magic' and buffactive['Silence'] then
				if player.inventory['Remedy'] ~= nil then
					cancel_spell()			
					windower.chat.input('/item "Remedy" <me>')
					log('Cancel Spell - Using Items')
				end
			end											
		end
		--Weapon Skill checks
		if spell.type == 'WeaponSkill' then
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
			local ability_time = abil_recasts_table[spell.recast_id] / 60
			local min = math.floor(ability_time)
			local sec = (ability_time - min) * 60
			if ability_time > 0 then
				info(''..spell.name..' ['..string.format("%d.%02d",min,sec)..']')
				cancel_spell()
				return
			end
		--Cancel certain actions (Defined by RecastTimers) if not ready
		elseif RecastTimers:contains(spell.type) then
			local spell_recasts = windower.ffxi.get_spell_recasts()
			local spell_time = spell_recasts[spell.recast_id] / 60
			local min = math.floor(spell_time)
			local sec = (spell_time - min) * 60
			if spell_time > 0 then
				info(''..spell.name..' ['..string.format("%d.%02d",min,sec)..']')
				cancel_spell()
				return
			end
			--Cancel if null target and redirect to self if bard song
			if not spell.target.type and spell.type == 'BardSong' then
				if buffactive['Pianissimo'] then
					if not is_Pianissimo then
						cancel_spell()
						windower.chat.input('/ma "'..spell.name..'" <stpc>')
						is_Pianissimo = true
					else
						is_Pianissimo = false
					end
				else
					change_target('<me>')
				end
			elseif spell.target.type then
				local cast_spell = res.spells[spell.id]
				if not cast_spell.targets then
					info('Unable to find spell ['..spell.name..']')
				-- Self Target spells
				elseif tostring(cast_spell.targets) == '{Self}' then
					if spell.target.type ~= 'SELF' then
						-- Change Target Spell
						log('Redirect Spell:[SELF TARGET]')
						change_target('<me>')
					end
				-- Enemy Spells
				elseif tostring(cast_spell.targets) == '{Enemy}' then
					if spell.target.type ~= 'MONSTER' and not spell.name:contains('Lullaby') and not spell.name:contains('Sleep') then
						--Cancel Spell
						log('Cancel Spell:['..tostring(spell.target.type)..']')
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
									windower.chat.input('/ma \"'..spell.name..'\" <stpc>')
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
							windower.chat.input('/ma \"'..spell.name..'\" <stpc>')
							return
						end
					end
				end
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called from the default GearSwap Function "precast" to build an built_set
	-------------------------------------------------------------------------------------------------------------------

	function precastequip(spell)
		log('precastequip Called')
		--Cancel for SMN if Avatar is mid action
		if pet.isvalid and pet_midaction() then return end
		--Default gearset
		local built_set = {}
		-- Merge the Idle incase a midcast is not set
		if sets.Idle then built_set = set_combine(built_set, sets.Idle) end
		-- WeaponSkill
		if spell.type == 'WeaponSkill' then
			if sets.WS then
				built_set = set_combine(built_set, sets.WS)
				local message = ''
				if spell.skill == "Marksmanship" or spell.skill == "Archery" then
					-- Try to equip a generic ranged WS set
					if sets.WS.RA then 
						built_set = set_combine(built_set, sets.WS.RA) 
					else warn('sets.WS.RA not found!') end
					if sets.WS[spell.english] then
						-- Set is defined
						built_set = set_combine(built_set, sets.WS[spell.english])
						-- Example would be WS.ACC.RA
						if state.OffenseMode.value ~= 'TP' and sets.WS[state.OffenseMode.value] and sets.WS[state.OffenseMode.value].RA then
							built_set = set_combine(built_set, sets.WS[state.OffenseMode.value].RA)
							-- Augment the specified WS
							if state.OffenseMode.value == 'ACC' then
								message = '['..spell.english..'] Set with Accuracy (Ranged)'
							elseif state.OffenseMode.value == 'PDL' then
								message = '['..spell.english..'] Set with Physical Damage Limit (Ranged)'
							elseif state.OffenseMode.value == 'SB' then
								message = '['..spell.english..'] Set with Subtle Blow (Ranged)'
							elseif state.OffenseMode.value == 'MEVA' then
								message = '['..spell.english..'] Set with Magic Evasion (Ranged)'
							elseif state.OffenseMode.value == 'CRIT' then
								message = '['..spell.english..'] Set with Critical Hit (Ranged)'
							end
						else message = '['..spell.english..'] Set' end
					else
						-- Generic
						if state.OffenseMode.value ~= 'TP' and sets.WS[state.OffenseMode.value] and sets.WS[state.OffenseMode.value].RA then
							built_set = set_combine(built_set, sets.WS[state.OffenseMode.value].RA)
							if state.OffenseMode.value == 'ACC' then
								message = 'Using Default WS Set with Accuracy (Ranged)'
							elseif state.OffenseMode.value == 'PDL' then
								message = 'Using Default WS Set with Physical Damage Limit (Ranged)'
							elseif state.OffenseMode.value == 'SB' then
								message = 'Using Default WS Set with Subtle Blow (Ranged)'
							elseif state.OffenseMode.value == 'MEVA' then
								message = 'Using Default WS Set with Magic Evasion (Ranged)'
							elseif state.OffenseMode.value == 'CRIT' then
								message = 'Using Default WS Set with Critical Hit (Ranged)'
							end
						else message = 'Using Default WS Set (Ranged)' end
					end
					-- Check if Aftermath is active
					if buffactive['Aftermath: Lv.3'] and sets.WS.AM3 and sets.WS.AM3.RA and sets.WS.AM3.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM3.RA[state.WeaponMode.value])
						message = message..' and Level 3 Aftermath (Ranged)'
					elseif buffactive['Aftermath: Lv.2'] and sets.WS.AM2 and sets.WS.AM2.RA and sets.WS.AM2.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM2.RA[state.WeaponMode.value])
						message = message..' and Level 2 Aftermath (Ranged)'
					elseif buffactive['Aftermath: Lv.1'] and sets.WS.AM1 and sets.WS.AM1.RA and sets.WS.AM1.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM1.RA[state.WeaponMode.value])
						message = message..' and Level 1 Aftermath (Ranged)'
					elseif buffactive['Aftermath'] and sets.WS.AM and sets.WS.AM.RA and sets.WS.AM.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM.RA[state.WeaponMode.value])
						message = message..' and Aftermath (Ranged)'
					end
				else
					if sets.WS[spell.english] then
						-- Set is defined
						built_set = set_combine(built_set, sets.WS[spell.english])
						if state.OffenseMode.value ~= 'TP' and sets.WS[state.OffenseMode.value] then
							built_set = set_combine(built_set, sets.WS[state.OffenseMode.value])
							-- Augment the specified WS
							if state.OffenseMode.value == 'ACC' then
								message = '['..spell.english..'] Set with Accuracy'
							elseif state.OffenseMode.value == 'PDL' then
								message = '['..spell.english..'] Set with Physical Damage Limit'
							elseif state.OffenseMode.value == 'SB' then
								message = '['..spell.english..'] Set with Subtle Blow'
							elseif state.OffenseMode.value == 'MEVA' then
								message = '['..spell.english..'] Set with Magic Evasion'
							elseif state.OffenseMode.value == 'CRIT' then
								message = '['..spell.english..'] Set with Critical Hit'
							end
						else message = '['..spell.english..'] Set' end
					else
						-- Generic
						if state.OffenseMode.value ~= 'TP' and sets.WS[state.OffenseMode.value] then
							built_set = set_combine(built_set, sets.WS[state.OffenseMode.value])
							-- Augment the specified WS
							if state.OffenseMode.value == 'ACC' then
								message = 'Using Default WS Set with Accuracy'
							elseif state.OffenseMode.value == 'PDL' then
								message = 'Using Default WS Set with Physical Damage Limit'
							elseif state.OffenseMode.value == 'SB' then
								message = 'Using Default WS Set with Subtle Blow'
							elseif state.OffenseMode.value == 'MEVA' then
								message = 'Using Default WS Set with Magic Evasion'
							elseif state.OffenseMode.value == 'CRIT' then
								message = 'Using Default WS Set with Critical Hit'
							end
						else message = 'Using Default WS Set' end
					end
					-- Check if Aftermath is active
					if buffactive['Aftermath: Lv.3'] and sets.WS.AM3 and sets.WS.AM3[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM3[state.WeaponMode.value])
						message = message..' and Level 3 Aftermath'
					elseif buffactive['Aftermath: Lv.2'] and sets.WS.AM2 and sets.WS.AM2[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM2[state.WeaponMode.value])
						message = message..' and Level 2 Aftermath'
					elseif buffactive['Aftermath: Lv.1'] and sets.WS.AM1 and sets.WS.AM1[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM1[state.WeaponMode.value])
						message = message..' and Level 1 Aftermath'
					elseif buffactive['Aftermath'] and sets.WS.AM and sets.WS.AM[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.WS.AM[state.WeaponMode.value])
						message = message..' and Aftermath'
					end
				end
				-- Check if an Obi or Orpheus is to be Equiped
				if Elemental_WS:contains(spell.name) then built_set =  elemental_check(spell, built_set) end
				info(message)
			else warn('sets.WS not found!') end
		-- Ranged attack
		elseif spell.action_type == 'Ranged Attack' then
			if sets.Precast then
				built_set = set_combine(built_set, sets.Precast)
				if sets.Precast.RA then
					built_set = set_combine(built_set, sets.Precast.RA)
					if buffactive[265] then -- Flurry
						if sets.Precast.RA.Flurry then
							built_set = set_combine(built_set, sets.Precast.RA.Flurry)
						else warn('sets.Precast.RA.Flurry not found!') end
					elseif buffactive[581] then -- Flurry II
						if sets.Precast.RA.Flurry_II then
							built_set = set_combine(built_set, sets.Precast.RA.Flurry_II)
						else warn('sets.Precast.RA.Flurry_II not found!') end
					elseif buffactive[228] then -- Embrava
						if sets.Precast.RA.Flurry_II then
							built_set = set_combine(built_set, sets.Precast.RA.Flurry_II)
						else warn('sets.Precast.RA.Flurry_II not found!') end
					end
				else warn('sets.Precast.RA not found!') end
			else warn('sets.Precast not found!') end
		-- JobAbility
		elseif spell.type == 'JobAbility' then
			if sets.JA then
				built_set = set_combine(built_set, sets.JA)
				if spell.name == 'Double-Up' then -- Double Up for distance
					if sets.PhantomRoll then
						built_set = set_combine(built_set, sets.PhantomRoll)
						info('['..spell.english..'] Set')
					else warn('sets.PhantomRoll not found!') end
				elseif sets.JA[spell.english] then
					built_set = set_combine(built_set, sets.JA[spell.english])
					--Summon the correct jug pet
					if spell.name == 'Bestial Loyalty' or spell.name == 'Call Beast' then
						if sets.Jugs[state.JobMode.value] then
							built_set = set_combine(built_set, sets.Jugs[state.JobMode.value])
						else warn('sets.Jugs.'..state.JobMode.value..' not found!') end
					end
					info('['..spell.english..'] Set')
				else info('JA not set for ['..spell.english..']') end
			else warn('sets.JA not found!') end
		-- Items
		elseif spell.type == 'Item' then 
			log('Item Use - Precast')
			if sets.Idle then
				built_set = sets.Idle
			else warn('sets.Idle not found!') end
		-- Scholar
		elseif spell.type == 'Scholar' then
			if sets.JA then
				built_set = set_combine(built_set, sets.JA)
				if sets.JA[spell.english] then
					built_set = set_combine(built_set, sets.JA[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Scholar Set') end
			else warn('sets.JA not found!') end
		-- Ward
		elseif spell.type == 'Ward' then
			if sets.JA then
				built_set = set_combine(built_set, sets.JA)
				if sets.JA[spell.english] then
					built_set = set_combine(built_set, sets.JA[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Ward Set') end
			else warn('sets.JA not found!') end
		-- Rune
		elseif spell.type == 'Rune' then
			if sets.JA then
				built_set = set_combine(built_set, sets.JA)
				if sets.JA[spell.english] then
					built_set = set_combine(built_set, sets.JA[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Rune Set') end
			else warn('sets.JA not found!') end
		-- Effusion
		elseif spell.type == 'Effusion' then
			if sets.JA then
				built_set = set_combine(built_set, sets.JA)
				if sets.JA[spell.english] then
					built_set = set_combine(built_set, sets.JA[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Effusion Set') end
			else warn('sets.JA not found!') end
		-- CorsairRoll
		elseif spell.type == 'CorsairRoll' then
			log('CorsairRoll')
			if sets.PhantomRoll then
				built_set = set_combine(built_set, sets.PhantomRoll)
				if sets.PhantomRoll[spell.english] then
					built_set = set_combine(built_set, sets.PhantomRoll[spell.english])
					info( '['..spell.english..'] Set ')
				else info('Roll not set') end
			else warn('sets.PhantomRoll not found!') end
		-- CorsairShot
		elseif spell.type == 'CorsairShot' then
			if sets.QuickDraw then
				built_set = set_combine(built_set, sets.QuickDraw)
				if sets.QuickDraw[spell.english] then
					built_set = set_combine(built_set, sets.QuickDraw[spell.english])
					info( '['..spell.english..'] Set')
				else info('Using Default Quick Draw Set') end
			else warn('sets.QuickDraw not found!') end
		-- Waltz
		elseif spell.type == 'Waltz' then
			if sets.Waltz then
				built_set = set_combine(built_set, sets.Waltz)
				if sets.Waltz[spell.english] then
					built_set = set_combine(built_set, sets.Waltz[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Waltz Set') end
			else warn('sets.Waltz not found!') end
		-- Jig
		elseif spell.type == 'Jig' then
			if sets.Jig then
				built_set = set_combine(built_set, sets.Jig)
				if sets.Jig[spell.english] then
					built_set = set_combine(built_set, sets.Jig[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Jig Set') end
			else warn('sets.Jig not found!') end
		-- Samba
		elseif spell.type == 'Samba' then
			if sets.Samba then
				built_set = set_combine(built_set, sets.Samba)
				if sets.Samba[spell.english] then
					built_set = set_combine(built_set, sets.Samba[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Samba Set') end
			else warn('sets.Samba not found!') end
		-- Step
		elseif spell.type == 'Step' then
			if sets.Step then
				built_set = set_combine(built_set, sets.Step)
				if sets.Step[spell.english] then
					built_set = set_combine(built_set, sets.Step[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Step Set') end
			else warn('sets.Step not found!') end
		-- Flourishes
		elseif spell.type == 'Flourish1' or spell.type == 'Flourish2' or spell.type == 'Flourish3' then
			if sets.Flourish then
				built_set = set_combine(built_set, sets.Flourish)
				if sets.Flourish[spell.english] then
					built_set = set_combine(built_set, sets.Flourish[spell.english])
					info('['..spell.english..'] Set')
				else info('Using Default Flourish Set') end
			else warn('sets.Flourish not found!') end
		-- Magic based actions
		else
			-- Precast
			if sets.Precast then
				built_set = set_combine(built_set, sets.Precast)
				-- FastCast
				if sets.Precast.FastCast then
					built_set = set_combine(built_set, sets.Precast.FastCast)
					-- Augment with Enhancing set
					if spell.skill == 'Enhancing Magic' then
						if sets.Precast.Enhancing then
							built_set = set_combine(built_set, sets.Precast.Enhancing)
						else warn('sets.Precast.Enhancing not found!') end
					end
					-- Specified Sets
					if sets.Precast[spell.english] then
						built_set = set_combine(built_set, sets.Precast[spell.english])
					-- Augment with Cure Casting set
					elseif spell.name:contains('Cure') or spell.name:contains('Cura') then
						if sets.Precast.Cure then
							built_set = set_combine(built_set, sets.Precast.Cure)
						else warn('sets.Precast.Cure not found!') end		
					-- Ninjutsu
					elseif spell.type == 'Ninjutsu' and UtsusemiSpell:contains(spell.name) then
						do_Utsu_checks(spell)
						if sets.Precast.Utsusemi then
							built_set = set_combine(built_set, sets.Precast.Utsusemi)
						else warn('sets.Precast.Utsusemi not found!') end	
					-- Blue Magic
					elseif spell.type == 'BlueMagic' then
						if sets.Precast.Blue_Magic then
							built_set = set_combine(built_set, sets.Precast.Blue_Magic)
						else warn('sets.Precast.Blue_Magic not found!') end		
					-- BardSong
					elseif spell.type == 'BardSong' then
						if sets.Precast.Songs then
							built_set = set_combine(built_set, sets.Precast.Songs)
							-- Equip Marsyas
							if spell.name == "Honor March" then
								built_set = set_combine(built_set, {range=Instrument.Honor})
							-- Equip Loughnashade
							elseif spell.name == "Aria of Passion" then
								built_set = set_combine(built_set, {range=Instrument.Aria})
							end
						else warn('sets.Precast.Songs not found!') end
					end
				else warn('sets.Precast.FastCast not found!') end
			else warn('sets.Precast not found!') end
		end
		-- Check that proper ammo is available if the action requires it
		if spell.skill == "Marksmanship" or spell.skill == "Archery" then
			if	player.equipment.ammo ~= "" and player.equipment.ranged ~= "" then
				do_bullet_checks(spell, built_set)
			end
		end
		-- Weapon Checks for precast
		-- If it set to unlocked it will not swap the weapons even if defined in the built_set job lua
		if state.WeaponMode.value ~= "Unlocked" and not spell.type == 'CorsairRoll' and not spell.name == 'Double-Up' then
			log('Update Weapons')
			if state.WeaponMode.value == "Locked" then
				built_set = set_combine(built_set, { main = player.equipment.main, sub = player.equipment.sub, range = player.equipment.range})
			else
				if sets.Weapons then
					if sets.Weapons[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Weapons[state.WeaponMode.value])
						if not TwoHand and not DualWield then
							if sets.Weapons.Shield then
								built_set = set_combine(built_set, sets.Weapons.Shield)
							else warn('sets.Weapons.Shield not found!') end
						end
					else warn('sets.Weapons.'..state.WeaponMode.value..' not found!') end
				else warn('sets.Weapons not found!') end
			end
		end
		--Swap in bard song weapons no matter the mode
		if spell.type == 'BardSong' and spell.target.type ~= 'MONSTER' then
			if sets.Weapons then
				if sets.Weapons.Songs then
					built_set = set_combine(built_set, sets.Weapons.Songs)
					if sets.Weapons.Songs.Midcast then
						if not DualWield and not TwoHand then
							if sets.Weapons.Shield then
								built_set = set_combine(built_set, sets.Weapons.Shield)
							else warn('sets.Weapons.Shield not found!') end
						end
						built_set = set_combine(built_set, sets.Weapons.Songs.Midcast)
					else warn('sets.Weapons.Songs.Midcast not found!') end
				else warn('sets.Weapons.Songs not found!') end
			else warn('sets.Weapons not found!') end
		end
		-- If TH mode is on - check if new mob and then equip TH gear
		if state.TreasureMode.value ~= 'None' and spell.target.type == 'MONSTER' and not th_info.tagged_mobs[spell.target.id] then
			if sets.TreasureHunter then
				built_set = set_combine(built_set, sets.TreasureHunter)
				info('['..spell.english..'] Set with Treasure Hunter')
			else warn('sets.TreasureHunter not found!') end
		end
		-- Final built_set built to return.  This is not the final set as custom Job can Augment
		return built_set
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called from the default GearSwap Function "midcast" to build an built_set
	-------------------------------------------------------------------------------------------------------------------

	function midcastequip(spell)
		-- WeaponSkill
		if spell.type == 'WeaponSkill' then return end
		if spell.type == 'Item' then return end
		if spell.type == 'JobAbility' then return end
		if spell.type == 'CorsairRoll' then log('abort midcast') return end
		if pet.isvalid and pet_midaction() then return end
		--Default gearset
		local built_set = {}
		-- Merge the Idle incase a midcast is not set
		if sets.Idle then built_set = set_combine(built_set, sets.Idle) end
		-- Merget the Midcast Set
		if sets.Midcast then 
			built_set = set_combine(built_set, sets.Midcast)
			-- Spell interruption Down for the rest of the actions
			if sets.Midcast.SIRD and spell.action_type ~= 'Ranged Attack' then built_set = set_combine(built_set, sets.Midcast.SIRD) end
			-- Ranged Attack
			if spell.action_type == 'Ranged Attack' then
				if sets.Midcast.RA then 
					built_set = set_combine(built_set, sets.Midcast.RA)
					-- Generic
					local message = ''
					if state.OffenseMode.value ~= 'TP' and sets.Midcast[state.OffenseMode.value] and sets.sets.Midcast[state.OffenseMode.value].RA then
						built_set = set_combine(built_set, sets.sets.Midcast[state.OffenseMode.value].RA)
						if state.OffenseMode.value == 'ACC' then
							message = 'Ranged Attack with Accuracy '
						elseif state.OffenseMode.value == 'PDL' then
							message = 'Ranged Attack with Physical Damage Limit'
						elseif state.OffenseMode.value == 'SB' then
							message = 'Ranged Attack with Subtle Blow'
						elseif state.OffenseMode.value == 'MEVA' then
							message = 'Ranged Attack with Magic Evasion'
						elseif state.OffenseMode.value == 'DT' then
							message = 'Ranged Attack with Damage Taken'
						elseif state.OffenseMode.value == 'PDT' then
							message = 'Ranged Attack with Physical Damage Taken'
						elseif state.OffenseMode.value == 'CRIT' then
							message = 'Ranged Attack with Critical Hit'
						elseif state.OffenseMode.value == 'True Shot' then
							message = 'Ranged Attack with True Shot'
						end
					else message = 'Ranged Attack Set' end
					-- Buffs
					if buffactive['Triple Shot'] and sets.Midcast.RA.TripleShot then 
						built_set = set_combine(built_set, sets.Midcast.RA.TripleShot)
						message = 'Using Triple Shot Set'
					elseif buffactive['Double Shot'] and sets.Midcast.RA.DoubleShot then 
						built_set = set_combine(built_set, sets.Midcast.RA.DoubleShot)
						message = 'Using Double Shot Set'
					elseif buffactive['Barrage'] and sets.Midcast.RA.Barrage then 
						built_set = set_combine(built_set, sets.Midcast.RA.Barrage)
						message = 'Using Barrage Set'
					end
					-- Check if Aftermath is active
					if buffactive['Aftermath: Lv.3'] and sets.Midcast.AM3 and sets.Midcast.AM3.RA and sets.Midcast.AM3.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Midcast.AM3.RA[state.WeaponMode.value])
						message = '['..spell.english..'] Set with Aftermath 3 (Ranged)'
					elseif buffactive['Aftermath: Lv.2'] and sets.Midcast.AM2 and sets.Midcast.AM2.RA and sets.Midcast.AM2.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Midcast.AM2.RA[state.WeaponMode.value])
						message = '['..spell.english..'] Set with Aftermath 2 (Ranged)'
					elseif buffactive['Aftermath: Lv.1'] and sets.Midcast.AM1 and sets.Midcast.AM1.RA and sets.Midcast.AM1.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Midcast.AM1.RA[state.WeaponMode.value])
						message = '['..spell.english..'] Set with Aftermath 1 (Ranged)'
					elseif buffactive['Aftermath'] and sets.Midcast.AM and sets.Midcast.AM.RA and sets.Midcast.AM.RA[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Midcast.AM.RA[state.WeaponMode.value])
						message = '['..spell.english..'] Set with Aftermath (Ranged)'
					end
					info(message)
				else warn('sets.Midcast.RA not found!') end
			-- Ninjutsu
			elseif spell.type == 'Ninjutsu' then
				-- Defined Gear Set
				if sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					info('['..spell.english..'] Set')
				-- Utsusemi Spells
				elseif UtsusemiSpell:contains(spell.name) then
					if sets.Midcast.Utsusemi then
						built_set = set_combine(built_set, sets.Midcast.Utsusemi)
						info('['..spell.english..'] Utsusemi Set')
					else warn('sets.Midcast.Utsusemi not found!') end
				-- Enhancing Magic
				elseif spell.target.type == 'SELF' then
					if sets.Midcast.Enhancing then
						built_set = set_combine(built_set, sets.Midcast.Enhancing)
						info('Enhancing set')
					else warn('sets.Midcast.Enhancing not found!') end
				-- Enfeebling
				elseif Enfeebling_Ninjitsu:contains(spell.english) then
					if sets.Midcast.Enfeebling then
						built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						info('Enfeebling set')
					else warn('sets.Midcast.Enfeebling not found!') end
				-- Defaults to Nukes if not the above
				else
					if sets.Midcast.Nuke then
						built_set = set_combine(built_set, sets.Midcast.Nuke)
						info('Nuke set')
					else warn('sets.Midcast.Nuke not found!') end
					-- Check for an elemental set
					built_set = elemental_check(spell, built_set)
				end
			-- WhiteMagic
			elseif spell.type == 'WhiteMagic' then
				-- Cure
				if spell.name:contains('Cure') then
					if sets.Midcast.Cure then
						built_set = set_combine(built_set, sets.Midcast.Cure)
						info('Cure Set')
					else warn('sets.Midcast.Cure not found!') end
					-- Check if an Obi or Orpheus is to be Equiped
					built_set =  elemental_check(spell, built_set)
				-- Curaga 
				elseif spell.name:contains('Curaga') then
					if sets.Midcast.Curaga then
						built_set = set_combine(built_set, sets.Midcast.Curaga)
						info('Curaga Set')
					else warn('sets.Midcast.Curaga not found!') end
					-- Check if an Obi or Orpheus is to be Equiped
					built_set =  elemental_check(spell, built_set)
				-- Cura
				elseif spell.name:contains('Cura') then
					if sets.Midcast.Cura then
						built_set = set_combine(built_set, sets.Midcast.Cura)
						info('Cura Set')
					else warn('sets.Midcast.Cura not found!') end
					-- Check if an Obi or Orpheus is to be Equiped
					built_set =  elemental_check(spell, built_set)
				-- Defined Gear Set
				elseif sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					info('['..spell.english..'] Set')
				elseif spell.name:contains('Raise') or spell.name == "Arise" or spell.name:contains('Reraise') then
					log('No Swap Defined (Raise)')
				-- Enhancing
				elseif spell.skill == 'Enhancing Magic' then
					if sets.Midcast.Enhancing then
						built_set = set_combine(built_set, sets.Midcast.Enhancing)
						-- Augment the set for Others if defined
						if spell.target.type ~= 'SELF' or (spell.target.type == 'SELF' and buffactive['Accession']) then
							if sets.Midcast.Enhancing.Others then
								built_set = set_combine(built_set, sets.Midcast.Enhancing.Others)
							else warn('sets.Midcast.Enhancing.Others not found!') end
						end
						-- Refresh
						if spell.name:contains('Refresh') then
							if sets.Midcast.Refresh then
								built_set = set_combine(built_set, sets.Midcast.Refresh)
								info('Refresh Set')
							else warn('sets.Midcast.Refresh not found!') end
						-- Regen
						elseif spell.name:contains('Regen') then
							if sets.Midcast.Regen then
								built_set = set_combine(built_set, sets.Midcast.Regen)
								info('Regen Set')
							else warn('sets.Midcast.Regen not found!') end
						elseif Storms:contains(spell.name) then
							if sets.Storms then
								built_set = set_combine(built_set, sets.Storms)
								info('Storms Set')
							else warn('sets.Storms not found!') end
						-- Gain Spells
						elseif spell.name:contains('Gain') then
							if sets.Midcast.Enhancing.Gain then
								built_set = set_combine(built_set, sets.Midcast.Enhancing.Gain)
								info('Gain Set')
							else warn('sets.Midcast.Enhancing.Gain not found!') end
						-- Phalanx
						elseif spell.name:contains('Phalanx') then
							if sets.Midcast.Phalanx then
								built_set = set_combine(built_set, sets.Midcast.Phalanx)
								info('Phalanx Set')
							else warn('sets.Midcast.Phalanx not found!') end
						-- Bar Spells
						elseif Elemental_Bar:contains(spell.name) then
							if sets.Midcast.Enhancing.Elemental then
								built_set = set_combine(built_set, sets.Midcast.Enhancing.Elemental)
								info('Elemental Bar Element Set')
							else warn('sets.Midcast.Enhancing.Elemental not found!') end
						-- Bar Status
						elseif Status_Bar:contains(spell.name) then
							if sets.Midcast.Enhancing.Status then
								built_set = set_combine(built_set, sets.Midcast.Enhancing.Status)
								info('Status Bar Status Set')
							else warn('sets.Midcast.Enhancing.Status not found!') end
						-- Enhancing SKill
						elseif Enhancing_Skill:contains(spell.name) then
							if sets.Midcast.Enhancing.Skill then
								built_set = set_combine(built_set, sets.Midcast.Enhancing.Skill)
								info('Enhancing Skill Set')
							else warn('sets.Midcast.Enhancing.Skill not found!') end
						-- Enhancing
						else info('Enhancing Magic Set') end
					else warn('sets.Midcast.Enhancing not found!') end
				-- Divine Spells
				elseif Divine_Skill:contains(spell.name) then
					if sets.Midcast.Divine then
						built_set = set_combine(built_set, sets.Midcast.Divine)
						info('Divine Skill Set')
					else warn('sets.Midcast.Divine not found!') end
				-- Enfeebling Magic
				elseif spell.skill == 'Enfeebling Magic' then
					if sets.Midcast.Enfeebling then
						built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						-- Accuracy
						if Enfeeble_Acc:contains(spell.name) then
							if sets.Midcast.Enfeebling.MACC then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.MACC)
								info('Enfeebling Magic Set - Magic Accuracy')
							else warn('sets.Midcast.Enfeebling.MACC not found!') end
						-- Potency
						elseif Enfeeble_Potency:contains(spell.name) then
							if sets.Midcast.Enfeebling.Potency then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Potency)
								info('Enfeebling Magic Set - Potency')
							else warn('sets.Midcast.Enfeebling.Potency not found!') end
						-- Duration
						elseif Enfeeble_Duration:contains(spell.name) then
							if sets.Midcast.Enfeebling.Duration then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Duration)
								info('Enfeebling Magic Set - Duration')
							else warn('sets.Midcast.Enfeebling.Duration not found!') end
						-- Default
						else info('Enfeebling Magic Set') end
					else info('No sets.Midcast.Enfeebling defined!') end
				end
			-- Black Magic
			elseif spell.type == 'BlackMagic' then
				-- Defined Gear Set
				if sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					-- Check for an elemental set
					if spell.skill == 'Elemental Magic' and not spell.name:contains('helix') then built_set = elemental_check(spell, built_set) end
					info( '['..spell.english..'] Set')
				-- Aspir Gear
				elseif spell.name:contains('Aspir') then
					if sets.Midcast.Aspir then
						built_set = set_combine(built_set, sets.Midcast.Aspir)
						info('Aspir Set')
					else warn('sets.Midcast.Aspir not found!') end
				-- Drain Gear
				elseif spell.name:contains('Drain') then
					if sets.Midcast.Drain then
						built_set = set_combine(built_set, sets.Midcast.Drain)
						info('Drain Set')
					else warn('sets.Midcast.Drain not found!') end
				-- Enfeebling Magic
				elseif spell.skill == 'Enfeebling Magic' then
					if sets.Midcast.Enfeebling then
						built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						-- Accuracy
						if Enfeeble_Acc:contains(spell.name) then
							if sets.Midcast.Enfeebling.MACC then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.MACC)
								info('Enfeebling Magic Set - Magic Accuracy')
							else warn('sets.Midcast.Enfeebling.MACC not found!') end
						-- Potency
						elseif Enfeeble_Potency:contains(spell.name) then
							if sets.Midcast.Enfeebling.Potency then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Potency)
								info('Enfeebling Magic Set - Potency')
							else warn('sets.Midcast.Enfeebling.Potency not found!') end
						-- Duration
						elseif Enfeeble_Duration:contains(spell.name) then
							if sets.Midcast.Enfeebling.Duration then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Duration)
								info('Enfeebling Magic Set - Duration')
							else warn('sets.Midcast.Enfeebling.Duration not found!') end
						-- Default
						else info('Enfeebling Magic Set') end
					else info('No sets.Midcast.Enfeebling not found!') end
				-- Dark Magic
				elseif spell.skill == 'Dark Magic' then
					if sets.Midcast.Dark then
						built_set = set_combine(built_set, sets.Midcast.Dark)
						-- Accuracy
						if Dark_Acc:contains(spell.name) then
							if sets.Midcast.Dark.MACC then
								built_set = set_combine(built_set, sets.Midcast.Dark.MACC)
								info('Dark Magic Set - Magic Accuracy')
							else warn('sets.Midcast.Dark.MACC not found!') end
						-- Absorb
						elseif Dark_Absorb:contains(spell.name) then
							if sets.Midcast.Dark.Absorb then
								built_set = set_combine(built_set, sets.Midcast.Dark.Absorb)
								info('Absorb Magic Set - Potency')
							else warn('sets.Midcast.Dark.Absorb not found!') end
						-- Enhancing
						elseif Dark_Enhancing:contains(spell.name) then
							if sets.Midcast.Dark.Enhancing then
								built_set = set_combine(built_set, sets.Midcast.Dark.Enhancing)
								info('Dark Enhancing Magic Set - Duration')
							else warn('sets.Midcast.Dark.Enhancing not found!') end
						-- Potency
						elseif Enfeeble_Potency:contains(spell.name) then
							if sets.Midcast.Enfeebling.Potency then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Potency)
								info('Enfeebling Magic Set - Potency')
							else warn('sets.Midcast.Enfeebling.Potency not found!') end
						-- Duration
						elseif Enfeeble_Duration:contains(spell.name) then
							if sets.Midcast.Enfeebling.Duration then
								built_set = set_combine(built_set, sets.Midcast.Enfeebling.Duration)
								info('Enfeebling Magic Set - Duration')
							else warn('sets.Midcast.Enfeebling.Duration not found!') end
						-- Default
						else info('Dark Magic Set') end
					else info('No sets.Midcast.Dark not found!') end
				-- Enhancing Magic
				elseif spell.skill == 'Enhancing Magic' then
					if sets.Midcast.Enhancing then
						built_set = set_combine(built_set, sets.Midcast.Enhancing)
						info('Enhancing Magic Set')
					else warn('sets.Midcast.Enhancing not found!') end
				-- Enfeebling Elemental Magic
				elseif Elemental_Enfeeble:contains(spell.name) then
					if sets.Midcast.Enfeebling then
						built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						if sets.Midcast.Enfeebling.MACC then
							built_set = set_combine(built_set, sets.Midcast.Enfeebling.MACC)
							info('Enfeebling Magic Set - Magic Accuracy')
						else warn('sets.Midcast.Enfeebling.MACC not found!') end
					else warn('sets.Midcast.Enfeebling not found!') end
				-- Standard Offensive Spells
				elseif spell.skill == 'Elemental Magic' then
					local element = res.spells[spell.id].element
					local element_name = res.elements[element].en
					if spell.target.id == last_skillchain_id and os.clock() - last_skillchain_time < 8 and last_skillchain_elements[element_name] then
						info("Burst Detected!")
						if sets.Midcast.Burst then
							built_set = set_combine(built_set, sets.Midcast.Burst)
						else warn('sets.Midcast.Burst not found!') end
					else
						if sets.Midcast.Nuke then
							built_set = set_combine(built_set, sets.Midcast.Nuke)
							info('Nuke Set')
						else warnd('sets.Midcast.Nuke not found!') end
					end
					-- Check for Helix
					if spell.name:contains('helix') then
						if sets.Helix then
							built_set = set_combine(built_set, sets.Helix)
							if spell.element == 'Dark' then
								if sets.Helix.Dark then
									built_set = set_combine(built_set, sets.Helix.Dark)
								else warn('sets.Helix.Dark not found!') end
							elseif spell.element == 'Light' then
								if sets.Helix.Light then
									built_set = set_combine(built_set, sets.Helix.Light)
								else warn('sets.Helix.Light not found!') end
							end
						else warn('sets.Helix not found!') end
					else
						if spell.element == "Earth" then
							built_set = set_combine(built_set, sets.Midcast.Nuke.Earth)
							windower.add_to_chat(8,'Earth Element Detected!')
						end
						-- Check for an elemental set
						built_set = elemental_check(spell, built_set)
					end
				end
			-- Bard Song
			elseif spell.type == 'BardSong' then
				-- Song Count for Dummy Songs
				if SongCount:contains(spell.name) then
					if sets.Midcast.DummySongs then
						built_set = set_combine(built_set, sets.Midcast.DummySongs)
						info( '['..spell.english..'] Set (Song Count)')
					else warn('sets.Midcast.DummySongs not found!') end
					built_set = set_combine(built_set, {range=Instrument.Count})
				-- Potency / Instruments
				else
					-- Defined Gear Set
					if sets.Midcast[spell.english] then
						built_set = set_combine(built_set, sets.Midcast[spell.english])
						info( '['..spell.english..'] Set')
					-- Equip Marsyas
					elseif spell.name == "Honor March" then
						built_set = set_combine(built_set, {range=Instrument.Honor})
						info( '['..spell.english..'] Set')
					-- Equip Loughnashade
					elseif spell.name == "Aria of Passion" then
						built_set = set_combine(built_set, {range=Instrument.Aria})
						info( '['..spell.english..'] Set')
					-- Equip Harp
					elseif spell.name:contains('Horde') then
						if sets.Midcast.Enfeebling then
							built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						else warn('sets.Midcast.Enfeebling not found!') end
						built_set = set_combine(built_set, {range=Instrument.AOE_Sleep})
						info( '['..spell.english..'] Set (AOE Sleep)')
					-- Normal Enfeebles
					elseif Enfeebling_Song:contains(spell.english) then
						if sets.Midcast.Enfeebling then
							built_set = set_combine(built_set, sets.Midcast.Enfeebling)
						else warn('sets.Midcast.Enfeebling not found!') end
						built_set = set_combine(built_set, {range=Instrument.Potency})
						info( '['..spell.english..'] Set (Enfeebling)')
					-- Augment the buff songs
					else
						info( '['..spell.english..'] Set (Potency)')
						built_set = set_combine(built_set, {range=Instrument.Potency})
					end
					-- Augment the specific Song if set
					built_set = set_combine(built_set, equip_song_gear(spell))
				end
			-- BlueMagic
			elseif spell.type == 'BlueMagic' then
				-- Defined Set
				if sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					-- Check for an elemental set
					if BlueNuke:contains(spell.english) then built_set = elemental_check(spell, built_set) end
					info( '['..spell.english..'] Set')
				-- Defined Blue Nukes
				elseif BlueNuke:contains(spell.english) then
					if sets.Midcast.Nuke then
						built_set = set_combine(built_set, sets.Midcast.Nuke)
						info('Blue Nuke set')
					else warn('sets.Midcast.Nuke not found!') end
					built_set = elemental_check(spell, built_set)
				-- Spells that benifit from Blue Magic Skill
				elseif BlueSkill:contains(spell.english) then
					if sets.Midcast.Skill then
						built_set = set_combine(built_set, sets.Midcast.Skill)
						info('Blue Skill set')
					else warn('sets.Midcast.Skill not found!') end
				elseif BlueTank:contains(spell.english) then
					if sets.Enmity then
						built_set = set_combine(built_set, sets.Enmity)
						info('Blue Enmity set')
					else warn('sets.Enmity not found!') end
				elseif BlueHealing:contains(spell.english) then
					if sets.Midcast.Cure then
						built_set = set_combine(built_set, sets.Midcast.Cure)
						info('Blue Cure set')
					else warn('sets.Midcast.Cure not found!') end
				elseif BlueACC:contains(spell.english) then
					if sets.Midcast.ACC then
						built_set = set_combine(built_set, sets.Midcast.ACC)
						info('Blue Magic Accuracy set')
					else warn('sets.Midcast.ACC not found!') end
				-- Default Spell set
				else info('Midcast not set') end
				if buffactive["Diffusion"] then
					if sets.Diffusion then
						built_set = set_combine(built_set, sets.Diffusion)
						info('Diffusion Augment')
					else warn('sets.Diffusion not found!') end
				end
			-- Geomancy
			elseif spell.type == 'Geomancy' then
				if sets.Geomancy then
					-- Defined Set
					if sets.Geomancy[spell.english] then
						built_set = set_combine(built_set, sets.Geomancy[spell.english])
						info( '['..spell.english..'] Set')
					-- Indi Equipment
					elseif Indicolure_List:contains(spell.english) then
						if sets.Geomancy.Indi then
							built_set = set_combine(built_set, sets.Geomancy.Indi)
							if spell.target.type ~= "SELF" then
								if sets.Geomancy.Indi.Entrust then
									built_set = set_combine(built_set, sets.Geomancy.Indi.Entrust)
									info('Indicolure set - Entrust')
								else warn('sets.Geomancy.Indi.Entrust not found!') end
							else info('Indicolure set') end
						else warn('sets.Geomancy.Indi not found!') end
					-- Bubble Equipment
					elseif Geomancy_List:contains(spell.english) then
						if sets.Geomancy.Geo then
							built_set = set_combine(built_set, sets.Geomancy.Geo)
							info('Geomancy set')
						else warn('sets.Geomancy.Geo not found!') end
					-- Default set
					else info('Midcast not set') end
				else warn('sets.Geomancy not found!') end
			-- Trust
			elseif spell.type == 'Trust' then
				log('Nothing Defined')
			-- BloodPactRage and BloodPactWard
			elseif spell.type == "BloodPactWard" or spell.type == "BloodPactRage" then
				-- BP Timer gear needs to swap here if not under Astral Conduit
				if not buffactive["Astral Conduit"] then
					if sets.Midcast[spell.english] then
						built_set = set_combine(built_set, sets.Midcast[spell.english])
						info('['..spell.english..'] Set')
					elseif sets.Midcast.BP then
						built_set = set_combine(built_set, sets.Midcast.BP)
						info('Blood Pact Set')
					else warn('sets.Midcast.BP not found!') end
				else
					-- Astral Conduit active so don't swap gear
					built_set = {}
				end
			-- Monster
			elseif spell.type == 'Monster' then
				if sets.Ready then
					built_set = set_combine(built_set, sets.Ready)
					info('[Ready] Set')
				else warn('sets.Ready not found!') end
			-- Elemental Siphon
			elseif spell.name == "Elemental Siphon" then
				if sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					info('['..spell.english..'] Set')
				else
					if sets.Midcast.SummoningMagic then
						built_set = set_combine(built_set, sets.Midcast.SummoningMagic)
						info('Summoning Magic Set')
					else warn('sets.Midcast.SummoningMagic not found!') end
				end
			-- Summon Avatar
			elseif spell.type == "SummonerPact" then
				if sets.Midcast[spell.english] then
					built_set = set_combine(built_set, sets.Midcast[spell.english])
					info('['..spell.english..'] Set')
				else
					if sets.Midcast.Summon then
						built_set = set_combine(built_set, sets.Midcast.Summon)
						info('Summon Magic Set')
					else warn('sets.Midcast.Summon not found!') end
				end
			end
		else warn('sets.Midcast not found!') end
		-- Auto-cancel existing buffs
		if spell.name == "Stoneskin" and buffactive["Stoneskin"] then
			send_command('cancel 37;')
		elseif spell.name == "Sneak" and buffactive["Sneak"] and spell.target.type == "SELF" then
			send_command('cancel 71;')
		elseif spell.name == "Spectral Jig" and buffactive["Sneak"] then
			send_command('cancel 71;')
		elseif spell.name == "Utsusemi: Ichi" and buffactive["Copy Image"] then
			send_command('wait .5;cancel 66;')
		end
		-- Weapon Checks for midcast
		-- If it set to unlocked it will not swap the weapons even if defined in the built_set job lua
		if state.WeaponMode.value ~= "Unlocked" then
			if spell.type == 'Geomancy' then
				log('Swap Weapon due to Geomancy')
			elseif state.WeaponMode.value == "Locked" then
				built_set = set_combine(built_set, { main=player.equipment.main, sub = player.equipment.sub, range = player.equipment.range})
				log(built_set)
			else
				if sets.Weapons then
					if sets.Weapons[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Weapons[state.WeaponMode.value])
					else warn('sets.Weapons.'..state.WeaponMode.value..' not found!') end
					if not TwoHand and not DualWield then
						if sets.Weapons.Shield then
							built_set = set_combine(built_set, sets.Weapons.Shield)
						else warn('sets.Weapons.Shield not found!') end
					end
				else warn('sets.Weapons not found!') end
			end
		end
		--Swap in bard song weapons no matter the mode
		if spell.type == 'BardSong' and spell.target.type ~= 'MONSTER' then
			if sets.Weapons.Songs then
				built_set = set_combine(built_set, sets.Weapons.Songs)
				if sets.Weapons.Songs.Midcast then
					built_set = set_combine(built_set, sets.Weapons.Songs.Midcast)
					if not DualWield and not TwoHand then
						if sets.Weapons.Shield then
							built_set = set_combine(built_set, sets.Weapons.Shield)
						else warn('sets.Weapons.Shield not found!') end
					end
				else warn('sets.Weapons.Songs.Midcast not found!') end
			else warn('sets.Weapons.Songs not found!') end
			
			if spell.target.type ~= 'SELF' and spell.name ~= "Honor March" and spell.name ~= "Aria of Passion" and not SongCount:contains(spell.name) then
				if Instrument then
					--Check for pianissimo Weapons
					if Instrument.Pianissimo then
						built_set = set_combine(built_set, {range=Instrument.Pianissimo})
					else warn('Instrument.Pianissimo not found!') end
					--Check for Ballad Weapon
					if spell.name:contains('Ballad') then
						if Instrument then
							if Instrument.Ballad then
								built_set = set_combine(built_set, {range=Instrument.Ballad})
							else warn('Instrument.Ballad not found!') end
						else warn('Instrument not found!') end
					end
				else warn('Instrument not found!') end
			end
		end
		-- If TH mode is on - check if new mob and then equip TH gear
		if 	state.TreasureMode.value ~= 'None' and spell.target.type == 'MONSTER' and not th_info.tagged_mobs[spell.target.id] and sets.TreasureHunter then
			built_set = set_combine(built_set, sets.TreasureHunter)
			info('['..spell.english..'] Set with Treasure Hunter')
		end
		-- Built built_set to return
		return built_set
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called from the default GearSwap Function "aftercast" to build an built_set
	-------------------------------------------------------------------------------------------------------------------

	function aftercastequip(spell)
		-- Dont change gear as the pet is still performing an action
		if pet_midaction() then
			return
		else
			local built_set = choose_set()
			if choose_set_custom then
				built_set = set_combine(built_set, choose_set_custom())
			else info('choose_set_custom() not found!') end
			return built_set
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for pretarget checks
	-------------------------------------------------------------------------------------------------------------------

	function pretarget(spell,action)
		--Calls the function in the include file for basic checks
		pretargetcheck(spell,action)
		--Calls the job specific function
		if pretarget_custom(spell,action) then
			pretarget_custom(spell,action)
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for precast checks
	-------------------------------------------------------------------------------------------------------------------

	function precast(spell)
		-- Spell timed out
		if is_Busy and os.clock() - Spellstart > SpellCastTime then is_Busy = false SpellCastTime = 0 end
		if not is_Busy then
			if RecastTimers:contains(spell.type) then
				local cast_spell = res.spells[spell.id]
				-- assume 80% FC
				SpellCastTime = cast_spell.cast_time *.2 + 2.5
				-- Spell not delay set to default 2 sec
				if buffactive["Chainspell"] or buffactive["Nightingale"] then
					 SpellCastTime = 1
				end
			elseif spell.action_type == 'Ranged Attack' then
				SpellCastTime = 1.1
			else
				-- Set duration of JA/WS
				SpellCastTime = 1
			end
			-- Spell timer counter
			Spellstart = os.clock()
			is_Busy = true
		else
			log('Player is Busy ['..spell.english..']')
			cancel_spell()
			return
		end
		--Generate the correct set from the include file and custom function
		local built_set = precastequip(spell)
		-- Process a custom set if enabled
		if precast_custom then
			built_set = set_combine(built_set, precast_custom(spell))
		else warn('precast_custom() not found!') end
		-- Check the gear
		built_set = set_combine(built_set, check_equipment_spells(spell))
		-- Here is where gear is actually equipped
		equip(built_set)
	end

	 -------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for midcast checks
	-------------------------------------------------------------------------------------------------------------------

	function midcast(spell)
		--Generate the correct set from the include file and custom function
		local built_set = midcastequip(spell)
		-- Process a custom set if enabled
		if midcast_custom then
			built_set = set_combine(built_set, midcast_custom(spell))
		else warn('midcast_custom() not found!') end
		-- Check the gear
		built_set = set_combine(built_set, check_equipment_spells(spell))
		-- Here is where gear is actually equipped
		equip(built_set)
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for aftercast checks
	-------------------------------------------------------------------------------------------------------------------

	function aftercast(spell)
		--Generate the correct set from the include file and custom function
		local built_set = aftercastequip (spell)
		if aftercast_custom then
			built_set = set_combine(built_set, aftercast_custom(spell))
		else warn('aftercast_custom() not found!') end
		-- here is where gear is actually equipped
		equip(built_set)
		-- Begin Reset Process - Spells have a hard delay where the JA's have a small delay
		if RecastTimers:contains(spell.type) then
			SpellCastTime = 2.5
		elseif spell.action_type == 'Ranged Attack' then
			SpellCastTime = 1.1
		else
			SpellCastTime = 0
		end
		Spellstart = os.clock()
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for any buff changes
	-------------------------------------------------------------------------------------------------------------------
	
	function buff_change(name,gain)
		if not is_Busy then
			--calls the include file and custom on a buff change
			local built_set = choose_set()
			if choose_set_custom then
				built_set = set_combine(built_set, choose_set_custom())
			else warn('choose_set_custom() not found!') end
			if buff_change_custom then
				built_set = set_combine(built_set, buff_change_custom(name,gain))
			else warn('buff_change_custom(name,gain) not found!') end
			-- Here is where gear is actually equipped
			equip(built_set)
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for any player status changes
	-------------------------------------------------------------------------------------------------------------------

	function status_change(new,old)
		--calls the include file and custom on a state change
		local built_set = choose_set()
		if choose_set_custom then
			built_set = set_combine(built_set, choose_set_custom())
		else warn('choose_set_custom() not found!') end
		if status_change_custom then
			built_set = set_combine(built_set, status_change_custom(new,old))
		else warn('status_change_custom(name,gain) not found!') end
		-- Here is where gear is actually equipped
		equip(built_set)
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for any pet changes
	-------------------------------------------------------------------------------------------------------------------

	function pet_change(pet,gain)
		-- A new pet is found
		local built_set = choose_set()
		if choose_set_custom then
			built_set = set_combine(built_set, choose_set_custom())
		else warn('choose_set_custom() not found!') end
		if pet_change_custom then
			built_set = set_combine(built_set, pet_change_custom(pet,gain))
		else warn('pet_change_custom() not found!') end
		-- Here is where gear is actually equipped
		equip(built_set)
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for pet mid actions
	-------------------------------------------------------------------------------------------------------------------

	function pet_midcast(spell)
		if sets.Pet_Midcast then
			local built_set = sets.Pet_Midcast
			-- Specific sets are defined
			if built_set[spell.english] then
				built_set = set_combine(built_set, built_set[spell.english])
				info('['..spell.english..'] Set')
			else
				if pet_midcast_custom(spell) then
					built_set = set_combine(built_set, pet_midcast_custom(spell))
				end
			end
			-- Weapon Checks for precast
			-- If it set to unlocked it will not swap the weapons even if defined in the built_set job lua
			if state.WeaponMode.value ~= "Unlocked" then
				if state.WeaponMode.value == "Locked" then
					built_set = set_combine(built_set, { main=player.equipment.main, sub = player.equipment.sub, range = player.equipment.range})
				else
					if sets.Weapons[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.Weapons[state.WeaponMode.value])
						if not TwoHand and not DualWield then
							if sets.Weapons.Shield then
								built_set = set_combine(built_set, sets.Weapons.Shield)
							end
						end
					end
				end
				log('Midcast set equiping Offense Mode Gear')
			end
			equip(built_set)
		else warn('sets.Pet_Midcast not found!') end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by gearswap for pet after actions
	-------------------------------------------------------------------------------------------------------------------

	function pet_aftercast(spell)
		local built_set = choose_set()
		if pet_aftercast_custom(spell) then
			built_set = set_combine(built_set, pet_aftercast_custom(spell))
		end
		equip(built_set)
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called to determine if there are current buffs to be used
	-------------------------------------------------------------------------------------------------------------------

	function check_buff()
		-- Auto Buff is on and not in a town
		if not is_Busy and state.AutoBuff.value ~= 'OFF' and not Cities:contains(world.area) and not buffactive['Stun'] and not buffactive['Terror'] then
			-- Set defaults
			command_JA = 'None'	
			command_SP = 'None'
			if not is_moving then
				command_SP = check_buff_SP()
			end
			command_JA = check_buff_JA()
			if command_JA ~= 'None' and not buffactive['Amnesia'] then
				command_JA_execute()
			elseif command_SP ~= 'None' then
				command_SP_execute()
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- Determine whether we have sufficient ammo for the action being attempted.
	-------------------------------------------------------------------------------------------------------------------

	function do_bullet_checks(spell, built_set)
		if spell and built_set then
			local bullet_name = built_set.ammo
			if bullet_name == 'empty' then
				log('Ammo name is: '..bullet_name)
				return
			end
			local bullet_min_count = 1
			if spell.action_type == 'Ranged Attack' then
				if buffactive['Triple Shot'] then
					bullet_min_count = 3
				elseif buffactive['Double Shot'] then
					bullet_min_count = 2
				elseif buffactive['Barrage'] then
					bullet_min_count = 8
				end
			end
			local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name] or player.wardrobe2[bullet_name]
			 or player.wardrobe3[bullet_name] or player.wardrobe4[bullet_name] or player.wardrobe5[bullet_name] 
			 or player.wardrobe6[bullet_name] or player.wardrobe7[bullet_name] or player.wardrobe8[bullet_name]
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
			if spell.type ~= 'CorsairShot' and state.warned.value == false and available_bullets.count > 1 and available_bullets.count <= Ammo_Warning_Limit then
				local msg = '*****  LOW AMMO WARNING: '..tostring(available_bullets.count)..'x '..bullet_name..' *****'
				local border = ""
				for i = 2, #msg do border = border .. "*" end
				windower.send_command('send @others input /echo '..msg..'')
				add_to_chat(167, border)
				add_to_chat(167, msg)
				add_to_chat(167, border)
				state.warned:set()
			elseif available_bullets.count > Ammo_Warning_Limit and state.warned then
				state.warned:reset()
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- Determine whether we have sufficient Shihei for the action being attempted.
	-------------------------------------------------------------------------------------------------------------------

	function do_Utsu_checks(spell)
		if spell.name == 'Utsusemi: Ichi' or spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: San' then

			local display_message = false
			local warning_level = 50
			local count = 0
			local available_shihei = player.inventory['Shihei']
			local available_shiki = player.inventory['Shikanofuda']
			-- Check for levels
			if available_shihei then
				if available_shihei.count < warning_level then
					display_message = true
					count = available_shihei.count
				end
			elseif available_shiki then
				if available_shiki.count < warning_level then
					display_message = true
					count = available_shiki.count
				end
			else
				display_message = true
			end
			-- Notify player is low
			if display_message then
				local msg = '*****  LOW TOOL WARNING: '..tostring(count)..'x *****'
				local border = "" for i = 1, #msg do border = border .. "*" end
				windower.send_command('send @others input /echo '..msg..'')
				add_to_chat(167, border)
				add_to_chat(167, msg)
				add_to_chat(167, border)
			end
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function returns the correct equipement to perform an action
	-------------------------------------------------------------------------------------------------------------------

	function check_equipment_spells(spell)
		local built_set = {}
		--Equip weapon for Dispelga
		if spell.name == "Dispelga" then
			built_set = {main="Daybreak"}
		end
		--Equip body for Impact
		if spell.name == "Impact" then
			local Crepuscular = player.inventory["Crepuscular Cloak"] or player.wardrobe["Crepuscular Cloak"] or player.wardrobe2["Crepuscular Cloak"]
			or player.wardrobe3["Crepuscular Cloak"] or player.wardrobe4["Crepuscular Cloak"] or player.wardrobe5["Crepuscular Cloak"] 
			or player.wardrobe6["Crepuscular Cloak"] or player.wardrobe7["Crepuscular Cloak"] or player.wardrobe8["Crepuscular Cloak"]
			local Twilight = player.inventory["Twilight Cloak"] or player.wardrobe["Twilight Cloak"] or player.wardrobe2["Twilight Cloak"]
			or player.wardrobe3["Twilight Cloak"] or player.wardrobe4["Twilight Cloak"] or player.wardrobe5["Twilight Cloak"] 
			or player.wardrobe6["Twilight Cloak"] or player.wardrobe7["Twilight Cloak"] or player.wardrobe8["Twilight Cloak"]
			-- Crepuscular Cloak Found
			if Crepuscular then log("Crepuscular Found") built_set = {head=empty, body="Crepuscular Cloak",}
			-- Twilight Cloak Found
			elseif Twilight then log("Twilight Found") built_set = {head=empty, body="Twilight Cloak",} end
		end
		return built_set
	end

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called by the user via the self command - "gs c XXXX"
	-------------------------------------------------------------------------------------------------------------------

	function self_command(cmd)
		-- Updates the TH status
		local command = cmd:lower()
		if command == 'update auto' then
			local built_set = choose_set()
			if choose_set_custom then
				built_set = set_combine(built_set, choose_set_custom())
				equip(built_set)
				return
			else warn('choose_set_custom() not found!') end
		-- Put the UI at 0,0
		elseif command == 'zero' then
			display_zero_command()
		-- Toggles the TH state
		elseif command:contains('treasurehunter') then
			if command == "treasurehunter" then
				state.TreasureMode:cycle()
				info('Treasure Hunter Mode: ['..state.TreasureMode.value..']')
				display_box_update()
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.TreasureMode:set(mode[2])
				info('Treasure Hunter Mode: ['..state.TreasureMode.value..']')
				display_box_update()
			end
			coroutine.schedule(equip_set, .25)
			return
		-- Toggles the Auto Buff function off/on
		elseif command:contains('autobuff') then
			if command == 'autobuff' then
				state.AutoBuff:cycle()
				info('Auto Buff is ['..state.AutoBuff.value..']')
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.AutoBuff:set(mode[2])
				info('Auto Buff is ['..state.AutoBuff.value..']')
			end
			display_box_update()
			coroutine.schedule(equip_set, .25)
			return
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
				add_to_chat(80,'The UI is now hidden')
			else
				gs_status:show()
				settings.visible = true
				display_box_update()
				add_to_chat(80,'The UI is now shown')
			end
		elseif command == 'debug' then
			if settings.debug == true then
				settings.debug = false
				gs_debug:hide()
				windower.add_to_chat(80,'The debugging is now [OFF]')
			else
				settings.debug = true
				gs_debug:show()
				log('The debugging is now [ON]')
			end
		elseif command == 'warn' then
			if settings.warn == true then
				settings.warn = false
				windower.add_to_chat(8,'The set warning is now [OFF]')
			else
				settings.warn = true
				warn('The set warning is now [ON]')
			end
		elseif command == 'info' then
			if settings.info == true then
				settings.info = false
				windower.add_to_chat(8,'Information is now [OFF]')
			else
				settings.info = true
				info('Information is now [ON]')
			end
		elseif command == 'two_hand_check' then
			two_hand_check()
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
		-- Toggles the current player stances
		elseif command:contains('offensemode') then
			if command == 'offensemode' then
				for i,v in ipairs(state.OffenseMode) do
					if state.OffenseMode.value == v then
						if state.OffenseMode.value ~= state.OffenseMode[#state.OffenseMode] then
							state.OffenseMode:set(state.OffenseMode[i+1])
						else
							state.OffenseMode:set(state.OffenseMode[1])
						end
						info('Offense Mode: ['..state.OffenseMode.value..']')
						display_box_update()
						coroutine.schedule(equip_set, .25)
						return
					end
				end
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.OffenseMode:set(mode[2])
				info('Offense Mode: ['..state.OffenseMode.value..']')
				display_box_update()
				coroutine.schedule(equip_set, .25)
				return
			end
		elseif command:contains('weaponmode') then
			if command == 'weaponmode' then
				for i,v in ipairs(state.WeaponMode) do
					if state.WeaponMode.value == v then
						if state.WeaponMode.value ~= state.WeaponMode[#state.WeaponMode] then
							state.WeaponMode:set(state.WeaponMode[i+1])
						else
							state.WeaponMode:set(state.WeaponMode[1])
						end
						info('Weapon Mode: ['..state.WeaponMode.value..']')
						display_box_update()
						if self_command_custom then self_command_custom(command) end
						coroutine.schedule(equip_set, .25)
						coroutine.schedule(two_hand_check, .25)
						return
					end
				end
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.WeaponMode:set(mode[2])
				info('Weapon Mode: ['..state.WeaponMode.value..']')
				display_box_update()
				if self_command_custom then self_command_custom(command) end
				coroutine.schedule(equip_set, .25)
				coroutine.schedule(two_hand_check, .25)
				return
			end
		elseif command:contains('jobmode2') then
			if command == 'jobmode2' then
				for i,v in ipairs(state.JobMode2) do
					if state.JobMode2.value == v then
						if state.JobMode2.value ~= state.JobMode2[#state.JobMode2] then
							state.JobMode2:set(state.JobMode2[i+1])
						else
							state.JobMode2:set(state.JobMode2[1])
						end
						info(UI_Name2..': ['..state.JobMode2.value..']')
						display_box_update()
						if self_command_custom then self_command_custom(command) end
						coroutine.schedule(equip_set, .25)
						return
					end
				end
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.JobMode2:set(mode[2])
				info(UI_Name2..': ['..state.JobMode2.value..']')
				display_box_update()
				if self_command_custom then self_command_custom(command) end
				coroutine.schedule(equip_set, .25)
				return
			end
		elseif command:contains('jobmode') then
			if command == 'jobmode' then
				for i,v in ipairs(state.JobMode) do
					if state.JobMode.value == v then
						if state.JobMode.value ~= state.JobMode[#state.JobMode] then
							state.JobMode:set(state.JobMode[i+1])
						else
							state.JobMode:set(state.JobMode[1])
						end
						info(UI_Name..': ['..state.JobMode.value..']')
						display_box_update()
						-- Issue a command to the lua for the job specific command
						if self_command_custom then self_command_custom(command) end
						coroutine.schedule(equip_set, .25)
						return
					end
				end
			else
				local mode = {}
				mode = string.split(cmd," ",2)
				state.JobMode:set(mode[2])
				info(UI_Name..': ['..state.JobMode.value..']')
				display_box_update()
				-- Issue a command to the lua for the job specific command
				if self_command_custom then self_command_custom(command) end
				coroutine.schedule(equip_set, .25)
				return
			end
		-- This profile mode is used to load a Silmaril profile and execute a script
		elseif command:contains('profile') then
			local modes = {}
			for mode in string.gmatch(cmd, "(%w+)") do
				table.insert(modes, mode)
			end
			local smModePath = table.concat(modes, '_', 2, #modes)
			info('Profile: ['..modes[#modes] ..']')
			windower.send_command('exec '..smModePath..'/'..player.main_job..'_'..player.sub_job..'_'..player.name)
		elseif command == 'food' then
			windower.chat.input('/item "'..Food..'" <me>')
		-- Command to use any enchanted item, can use either en or enl names from resources, autodetects slot, equip timeout and cast time
		elseif command:startswith('use') then
			use_enchantment(command:slice(5))
		elseif command == 'version' then
			info('Include Version is ['..Mirdain_GS..']')
		end
		--use below for custom Job commands
		if self_command_custom then self_command_custom(command) end
	end

	-- Functin used to exectue Job Abilities
	function command_JA_execute()
		local cast_ability = res.job_abilities:with('en', command_JA)
		local target = ''
		if tostring(cast_ability.targets) == "{Self}" then
			target = '<me>'
		elseif tostring(cast_ability.targets) == "{Enemy}" then
			target = '<bt>'
		else
			target = '<me>'
		end
		--log('input /ja "'..command_JA..'" '..target..'')
		windower.chat.input('/ja "'..command_JA..'" '..target..'')
	end

	-- Functin used to exectue Spells
	function command_SP_execute()
		local cast_spell = res.spells:with('en', command_SP)
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
		windower.chat.input('/ma "'..command_SP..'" '..target..'')
	end

	-- Used for Escha Temp and Zerg
	function escha_temps()
		info('Escha Temps')
		windower.send_command("input /item \"Monarch's Drink\" <me>;wait 2.5;input /item \"Braver's Drink\" <me>;wait 2.5;input /item \"Fighter's Drink\" <me>;wait 2.5;input /item \"Champion's Drink\" <me>;wait 2.5;input /item \"Soldier's Drink\" <me>;wait 2.5;input /item \"Barbarian's Drink\" <me>")
	end

	-- Determines correct gear for the songs
	function equip_song_gear(spell)
		local song_set = {}
			if string.find(spell.english,'Finale') and sets.Midcast.Finale then song_set = sets.Midcast.Finale
		elseif string.find(spell.english,'Lullaby') and sets.Midcast.Lullaby then song_set = sets.Midcast.Lullaby
		elseif string.find(spell.english,'Threnody') and sets.Midcast.Threnody then song_set = sets.Midcast.Threnody
		elseif string.find(spell.english,'Elegy') and sets.Midcast.Elegy then song_set = sets.Midcast.Elegy
		elseif string.find(spell.english,'Requiem') and sets.Midcast.Requiem then song_set = sets.Midcast.Requiem
		elseif string.find(spell.english,'March') and sets.Midcast.March then song_set = sets.Midcast.March
		elseif string.find(spell.english,'Minuet') and sets.Midcast.Minuet then song_set = sets.Midcast.Minuet
		elseif string.find(spell.english,'Madrigal') and sets.Midcast.Madrigal then song_set = sets.Midcast.Madrigal
		elseif string.find(spell.english,'Ballad') and sets.Midcast.Ballad then song_set = sets.Midcast.Ballad
		elseif string.find(spell.english,'Scherzo') and sets.Midcast.Scherzo then song_set = sets.Midcast.Scherzo
		elseif string.find(spell.english,'Mazurka') and sets.Midcast.Mazurka then song_set = sets.Midcast.Mazurka
		elseif string.find(spell.english,'Paeon') and sets.Midcast.Paeon then song_set = sets.Midcast.Paeon
		elseif string.find(spell.english,'Carol') and sets.Midcast.Carol then song_set = sets.Midcast.Carol
		elseif string.find(spell.english,'Minne') and sets.Midcast.Minne then song_set = sets.Midcast.Minne
		elseif string.find(spell.english,'Mambo') and sets.Midcast.Mambo then song_set = sets.Midcast.Mambo
		elseif string.find(spell.english,'Etude') and sets.Midcast.Etude then song_set = sets.Midcast.Etude
		elseif string.find(spell.english,'Prelude') and sets.Midcast.Prelude then song_set = sets.Midcast.Prelude
		elseif string.find(spell.english,'Dirge') and sets.Midcast.Dirge then song_set = sets.Midcast.Dirge
		elseif string.find(spell.english,'Sirvente') and sets.Midcast.Sirvente then song_set = sets.Midcast.Sirvente
		elseif string.find(spell.english,'Aria') and sets.Midcast.Aria then song_set = sets.Midcast.Aria
		else
			info('['..spell.english..'] set not found!')
		end
		return song_set
	end

	function use_enchantment(item)
		local SlotList = {"main","sub","range","ammo","head","body","hands","legs","feet","neck","waist","lear","rear","left_ring","right_ring","back"}
		local item_table = res.items:with('enl',item) or res.items:with('en',item)
		if item_table == nil or not item_table.targets:contains('Self') then
			info("Invalid item.")
			return
		end
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
		local delay_use = item_table.cast_delay + 2
		local delay_unlock = delay_use + item_table.cast_time + 2
		Use_Item_Command = item_table.en
		coroutine.schedule(Use_Item, delay_use)
		coroutine.schedule(Unlock, delay_unlock)
		coroutine.schedule(equip_set, delay_unlock)
	end

	function Use_Item()
		log('/item "'..Use_Item_Command..'" '..player.id)
		windower.chat.input('/item "'..Use_Item_Command..'" <me>')
	end

	-- Unbind Keys when the file is unloaded
	function file_unload(file_name)
		send_command('unbind ^f11')
		send_command('unbind ^f12')
		send_command('unbind f9')
		send_command('unbind f10')
		send_command('unbind f11')
		send_command('unbind f12')
		if user_file_unload then
			user_file_unload()
		else
			info('user_file_unload() not found!')
		end
	end

	-- Command to Lock Style and Set the correct macros
	function jobsetup(LockStylePallet,MacroBook,MacroSet)
		if Random_Lockstyle then
			LockStylePallet = Lockstyle_List[ math.random( #Lockstyle_List ) ]
		end

		windower.send_command('wait 2;input /lockstyleset '..LockStylePallet..';wait 1;input /macro book '..MacroBook..
		';wait 1;input /macro set '..MacroSet..';gs validate;wait 2;input /echo Change Complete')

		send_command('bind f12 gs c OffenseMode')
		send_command('bind f11 gs c TreasureHunter')
		send_command('bind f10 gs c AutoBuff')
		send_command('bind f9 gs c WeaponMode')
		send_command('bind ^f12 gs c JobMode')
		send_command('bind ^f11 gs c JobMode2')

		local maxWidth = 40
		windower.add_to_chat(8,'Stance - '..string.format('[%s]','F12'))
		windower.add_to_chat(8,'TH Mode - '..string.format('[%s]','F11'))
		windower.add_to_chat(8,'Auto Buff - '..string.format('[%s]','F10'))
		windower.add_to_chat(8,'Weapon Mode - '..string.format('[%s]','F9')) 
		if UI_Name ~= '' then
			windower.add_to_chat(8,UI_Name..' - '..string.format('[%s]','Ctrl + F12'))
		end
		if UI_Name2 ~= '' then
			windower.add_to_chat(8,UI_Name2..' - '..string.format('[%s]','Ctrl + F11'))
		end
	end

	-- Called when the player's subjob changes.
	function sub_job_change(new, old)
		coroutine.schedule(dual_wield_check, 2)
		coroutine.schedule(two_hand_check, 2)
		coroutine.schedule(equip_set, 2.25)
		windower.send_command('wait 3;input /lockstyleset '..LockStylePallet..';')
		if sub_job_change_custom then
			sub_job_change_custom()
		end
	end

	-- Check if you have the dual wield trait
	function dual_wield_check()
		local current_abilities = windower.ffxi.get_abilities()
		if table.contains(current_abilities.job_traits,18) then -- Dual Wield trait
			DualWield = true
		else
			DualWield = false
		end
	end

	function two_hand_check()
		if sets.Weapons[state.WeaponMode.value] and sets.Weapons[state.WeaponMode.value]['main'] then
			local weapon_name = sets.Weapons[state.WeaponMode.value]['main']
			if type(weapon_name) == "table" then weapon_name = sets.Weapons[state.WeaponMode.value]['main'].name end
			local Main_Weapon = res.items:with('en',weapon_name)
			if Main_Weapon then
				log('Weapon:['..Main_Weapon.en..']')
				local Skill_type = Main_Weapon.skill 
				if Skill_type == 4 or Skill_type == 6 or Skill_type == 7 or Skill_type == 8 or Skill_type == 10 or Skill_type == 12 then
					TwoHand = true
				else
					TwoHand = false
				end
			else
				TwoHand = false
			end
		end
	end

	-- On changing targets, attempt to add TH gear.
	function on_target_change_for_th(new_index, old_index)
		-- Only care about changing targets while we're engaged, either manually or via current target death.
		if player.status == 'Engaged' and state.TreasureMode.value ~= 'None' then
			-- If  the current player.target is the same as the new mob then we're actually engaged with it.
			-- If it's different than the last known mob, then we've actually changed targets.
			if player.target.index == new_index and new_index ~= th_info.last_player_target_index then
				th_info.last_player_target_index = player.target.index
				local built_set = choose_set()
				if choose_set_custom then
					built_set = set_combine(built_set, choose_set_custom())
				else warn('choose_set_custom() not found!') end
				equip(built_set)
			end
		end
	end

	-- This function removes mobs from our tracking table when they die.
	function on_incoming_chunk_for_th(id, data, modified, injected, blocked)
		-- Action Packet
		if id == 0x29 and state.TreasureMode.value ~= 'None' then
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
		Unlock()
		if settings.debug then windower.add_to_chat(123,'Zoning. Clearing tagged mobs table.') end
		th_info.tagged_mobs:clear()
		-- Turn off for zones
		state.AutoBuff:set('OFF')
	end

	-- Remove mobs that we've marked as tagged with TH if we haven't seen any activity from or on them
	-- for over 3 minutes.  This is to handle deagros, player deaths, or other random stuff where the
	-- mob is lost, but doesn't die.
	function cleanup_tagged_mobs()
		-- If it's been more than 3 minutes since an action on or by a tagged mob,
		-- remove them from the tagged mobs list.
		local current_time = os.clock()
		local remove_mobs = S{}

		--log('The TH table contains ['..tostring(#th_info.tagged_mobs)..'] entries.')

		-- Search list and flag old entries.
		for target_id, action_time in pairs(th_info.tagged_mobs) do
			local time_since_last_action = current_time - action_time
			if time_since_last_action > 180 then
				remove_mobs:add(target_id)
				if settings.debug then windower.add_to_chat(123,'Over 3 minutes since last action on mob '..target_id..'. Removing from tagged mobs list.') end
			end
		end

		-- Clean out mobs flagged for removal.
		for mob_id,_ in pairs(remove_mobs) do
			th_info.tagged_mobs[mob_id] = nil
		end
	end

	-------------------------------------------------------------------------------------------------------------------
	-- BELOW IS FROM THE CANCEL ADDON
	-- ADDING DUE TO FACT SOME PEOPLE MAY NOT HAVE IT INSTALLED
	-- ALLOWS CANCELING OF BUFFS EASIER
	-------------------------------------------------------------------------------------------------------------------

	function cancel(...)
		local command = table.concat({...},' ')
		if not command then return end
		local status_id_tab = command:split(',')
		status_id_tab.n = nil
		local ids = {}
		local buffs = {}
		for _,v in pairs(windower.ffxi.get_player().buffs) do
			for _,r in pairs(status_id_tab) do
				if windower.wc_match(res.buffs[v][Language],r) or windower.wc_match(tostring(v),r) then
					cancel_buff(v)
					break
				end
			end
		end
	end

	function cancel_buff(id)
		windower.packets.inject_outgoing(0xF1,string.char(0xF1,0x04,0,0,id%256,math.floor(id/256),0,0)) -- Inject the cancel packet
	end

	function Unlock()
		log('Unlock Called')
		enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
	end

	function Lock()
		log('Lock Called')
		disable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','waist','legs','feet')
	end

	-- UI for displaying the current states
	function display_box_update()
		local width = 20
		local dialog = {}
		dialog[1] = {description = 'Stance', value = state.OffenseMode.value}
		dialog[2] = {description = 'TH Mode', value = state.TreasureMode.value}
		dialog[3] = {description = 'Auto Buff', value = state.AutoBuff.value}
		dialog[4] = {description = 'DPS', value = state.WeaponMode.value}
		if UI_Name ~= "" then
			dialog[5] = {description = UI_Name, value = state.JobMode.value}
		end
		if UI_Name2 ~= "" then
			dialog[6] = {description = UI_Name2, value = state.JobMode2.value}
		end
		local lines = T{}
		for k, v in next, dialog do
			lines:insert(v.description ..string.format('[%s]',tostring(v.value)):lpad(' ',width-string.len(tostring(v.description))))
		end
		local maxWidth = math.max(1, table.reduce(lines, function(a, b) return math.max(a, #b) end, '1'))
		-- Pad each entry
		for i,line in ipairs(lines) do lines[i] = lines[i]:rpad(' ', maxWidth) end
		gs_status:text(lines:concat('\n'))
	end

	-- Zero the display window
	function display_zero_command()
		gs_status:pos_x(0)
		gs_status:pos_y(0)
		config.save(settings, windower.ffxi.get_player().name:lower())
	end

	-- Used to help debug issues
	function debug_box_update()
		local lines = T{}
		lines:insert('is_Busy' ..string.format('[%s]',tostring(is_Busy)):lpad(' ',12))
		lines:insert('is_Moving' ..string.format('[%s]',tostring(is_moving)):lpad(' ',10))
		lines:insert('DualWield' ..string.format('[%s]',tostring(DualWield)):lpad(' ',10))
		lines:insert('TwoHand' ..string.format('[%s]',tostring(TwoHand)):lpad(' ',12))
		local maxWidth = math.max(1, table.reduce(lines, function(a, b) return math.max(a, #b) end, '1'))
		for i,line in ipairs(lines) do lines[i] = lines[i]:rpad(' ', maxWidth) end
		gs_debug:text(lines:concat('\n'))
	end

	function log(msg)
		if settings.debug then
			if msg == nil then
				windower.add_to_chat(80,'----Value is Nil----')
			elseif type(msg) == "table" then
				for index, value in pairs(msg) do
					windower.add_to_chat(80,'----'..tostring(value)..'----')
				end
			elseif type(msg) == "number" then
				windower.add_to_chat(80,'----'..tostring(msg)..'----')
			elseif type(msg) == "string" then
				windower.add_to_chat(80,'----'..msg..'----')
			elseif type(msg) == "boolean" then
				windower.add_to_chat(80,'----'..tostring(msg)..'----')
			else
				windower.add_to_chat(80,'----Unknown Debug Message----')
			end
		end
	end

	function info(msg)
		if settings.info then
			if msg == nil then
				windower.add_to_chat(8,'Value is Nil')
			elseif type(msg) == "table" then
				for index, value in pairs(msg) do
					windower.add_to_chat(8,tostring(value))
				end
			elseif type(msg) == "number" then
				windower.add_to_chat(8,tostring(msg))
			elseif type(msg) == "string" then
				windower.add_to_chat(8,msg)
			elseif type(msg) == "boolean" then
				windower.add_to_chat(8,tostring(msg))
			else
				windower.add_to_chat(8,'Unknown Debug Message')
			end
		end
	end

	function warn(msg)
		if settings.warn then
			if msg == nil then
				windower.add_to_chat(12,'----Value is Nil----')
			elseif type(msg) == "table" then
				for index, value in pairs(msg) do
					windower.add_to_chat(12,'----'..tostring(value)..'----')
				end
			elseif type(msg) == "number" then
				windower.add_to_chat(12,'----'..tostring(msg)..'----')
			elseif type(msg) == "string" then
				windower.add_to_chat(12,'----'..msg..'----')
			elseif type(msg) == "boolean" then
				windower.add_to_chat(12,'----'..tostring(msg)..'----')
			else
				windower.add_to_chat(12,'----Unknown Debug Message----')
			end
		end
	end

	function elemental_check(spell, built_set)
		-- Rule for Cures
		if spell.name:contains('Cure') or spell.name:contains('Cura') then
			if world.weather_element == spell.element or spell.element == world.day_element then

				-- Verify player has the gear
				local Obi = player.inventory["Hachirin-no-Obi"] or player.wardrobe["Hachirin-no-Obi"] or player.wardrobe2["Hachirin-no-Obi"]
				or player.wardrobe3["Hachirin-no-Obi"] or player.wardrobe4["Hachirin-no-Obi"] or player.wardrobe5["Hachirin-no-Obi"] 
				or player.wardrobe6["Hachirin-no-Obi"] or player.wardrobe7["Hachirin-no-Obi"] or player.wardrobe8["Hachirin-no-Obi"]
				local Staff = player.inventory["Chatoyant Staff"] or player.wardrobe["Chatoyant Staff"] or player.wardrobe2["Chatoyant Staff"]
				or player.wardrobe3["Chatoyant Staff"] or player.wardrobe4["Chatoyant Staff"] or player.wardrobe5["Chatoyant Staff"] 
				or player.wardrobe6["Chatoyant Staff"] or player.wardrobe7["Chatoyant Staff"] or player.wardrobe8["Chatoyant Staff"]

				-- Check for bonus
				if spell.element == world.day_element then
					if Obi then built_set = set_combine(built_set, {waist="Hachirin-no-Obi"}) end
					if Staff then built_set = set_combine(built_set, {main="Chatoyant Staff"}) end
					windower.add_to_chat(8,'[' ..world.day_element.. '] day - using Bonus Gear')
				elseif world.weather_element == spell.element then
					if Obi then built_set = set_combine(built_set, {waist="Hachirin-no-Obi"}) end
					if Staff then built_set = set_combine(built_set, {main="Chatoyant Staff"}) end
					windower.add_to_chat(8,'Weather is ['.. world.weather_element .. '] - using Bonus Gear')
				end
			end
		-- This function swaps in the Orpheus or Hachirin as needed
		else

			-- Check for player gear
			local Osash = player.inventory["Orpheus's Sash"] or player.wardrobe["Orpheus's Sash"] or player.wardrobe2["Orpheus's Sash"]
			or player.wardrobe3["Orpheus's Sash"] or player.wardrobe4["Orpheus's Sash"] or player.wardrobe5["Orpheus's Sash"] 
			or player.wardrobe6["Orpheus's Sash"] or player.wardrobe7["Orpheus's Sash"] or player.wardrobe8["Orpheus's Sash"]
			local Obi = player.inventory["Hachirin-no-Obi"] or player.wardrobe["Hachirin-no-Obi"] or player.wardrobe2["Hachirin-no-Obi"]
			or player.wardrobe3["Hachirin-no-Obi"] or player.wardrobe4["Hachirin-no-Obi"] or player.wardrobe5["Hachirin-no-Obi"] 
			or player.wardrobe6["Hachirin-no-Obi"] or player.wardrobe7["Hachirin-no-Obi"] or player.wardrobe8["Hachirin-no-Obi"]

			-- Matching double weather (w/o day conflict).
			if spell.element == world.weather_element and world.weather_intensity == 2 and Obi then
				built_set = set_combine(built_set, {waist="Hachirin-no-Obi"})
				windower.add_to_chat(8,'Weather is Double ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			-- Matching day and weather.
			elseif spell.element == world.day_element and spell.element == world.weather_element and Obi then
				built_set = set_combine(built_set, {waist="Hachirin-no-Obi"})
				windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			-- Target distance less than 6 yalms
			elseif spell.target.distance < (6 + spell.target.model_size) and Osash then
				built_set = set_combine(built_set, {waist="Orpheus's Sash"})
				windower.add_to_chat(8,'Distance is ['.. round(spell.target.distance,2) .. '] using Orpheus Sash')
			-- Match day or weather.
			elseif spell.element == world.day_element or spell.element == world.weather_element and Obi then
				built_set = set_combine(built_set, {waist="Hachirin-no-Obi"})
				windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			end

		end
		return built_set
	end

	function round(num, numDecimalPlaces)
		if num ~= nil then
		  local mult = 10^(numDecimalPlaces or 0)
		  return math.floor(num * mult + 0.5) / mult
		end
	end

	function run_burst(data)
		local action = data.targets[1].actions[1]
		if (action.add_effect_message > 287 and action.add_effect_message < 302) -- Normal SC DMG
		or (action.add_effect_message > 384 and action.add_effect_message < 399) -- SC Heals
		or (action.add_effect_message > 766 and action.add_effect_message < 771) -- Umbra/Radiance
		then
			log('There was a skillchain')
			local t = windower.ffxi.get_mob_by_id(data.targets[1].id)
			-- valid party target and within range
			if t and t.spawn_type == 16 and t.distance:sqrt() < 21 then
				-- Update the enemy to track
				last_skillchain_id = t.id
				last_skillchain_time = os.clock()
				last_skillchain_elements = {}
				log('Skillchain detected')
				-- get the type of skillchain
				local skillchain = skillchains[action.add_effect_message]
				-- Find the elements
				for index, element in pairs(skillchain.elements) do
					last_skillchain_elements[element] = element
				end
				log(last_skillchain_elements)
			end
		-- This is used to stop bursting if a ws happened to close the window
		elseif data.category == 3 and data.param ~= 0 then
			local t = windower.ffxi.get_mob_by_id(data.targets[1].id)
			if t and t.id == last_skillchain_id then
				log('Skillchain is closed for ['..last_skillchain_id..']')
				last_skillchain_elements = {}
				last_skillchain_id = 0
				last_skillchain_time = 0
			end
		end
	end

	function main_engine()
		local now = os.clock()
		-- Spell timed out
		if is_Busy and now - Spellstart > SpellCastTime then is_Busy = false SpellCastTime = 0 end
		-- Make sure not update faster than .1 seconds
		if now - main_engine_time < .1 then return end
		-- Update the debug UI if visible
		if settings.debug then debug_box_update() end
		-- Go no farther as you are dead
		if not player or player.status == "Dead" or player.status == "Engaged dead" or buffactive['Charm'] or buffactive['Sleep'] then return end
		-- Status Ailment Check
		if not buffactive['Paralysis'] and not buffactive['Silence'] and not buffactive['Muddle'] then
			check_buff()
		end		
		local position = windower.ffxi.get_mob_by_id(player.id)
		if position and not buffactive['Mounted'] and not is_Busy then
			local movement = math.sqrt( (position.x-Location.x)^2 + (position.y-Location.y)^2 + (position.z-Location.z)^2 ) > 0.5
			if movement and not is_moving then
				if player.status ~= "Engaged" then
					is_moving = true
					Require_Update = true
					--windower.chat.input('/echo Moving! Status: '..player.status..'')
				end
			elseif not movement and is_moving then
				is_moving = false
				Require_Update = true
				--windower.chat.input('/echo Stopped Moving! Status: '..player.status..'')
			end
			Location.x = position.x
			Location.y = position.y
			Location.z = position.z
		end

		if Require_Update and not is_busy then equip_set() Require_Update = false end

		-- 30 second cycle timer
		if now - UpdateTime1 > 30 then
			log('Update Timer 1')
			dual_wield_check()
			cleanup_tagged_mobs()
			UpdateTime1 = now
		end

		-- function used for periodic updates - feature
		if Cycle_Timer and now - UpdateTime2 > 2 and not is_busy then
			log('Update Timer 2')
			Cycle_Timer()
			UpdateTime2 = now
		end

		main_engine_time = os.clock()
	end

	-- Register event section
	windower.register_event('target change', on_target_change_for_th)
	windower.raw_register_event('incoming chunk', on_incoming_chunk_for_th)
	windower.raw_register_event('outgoing chunk', main_engine)
	windower.raw_register_event('zone change', on_zone_change_for_th)

	windower.register_event('gain buff', function(id)
		local name = res.buffs[id].en
		if id == 6 and (Mage_Job:contains(player.main_job) or Mage_Job:contains(player.sub_job)) then
			if player.inventory['Remedy'] ~= nil then
				if AutoItem == true then
					windower.chat.input('/item "Remedy" <me>')
				end
			else info('No Remedies in inventory.') end
		elseif id == 4 then
			if player.inventory['Remedy'] ~= nil then
				if AutoItem == true then
					windower.chat.input('/item "Remedy" <me>')
				end
			else info('No Remedies in inventory.') end
		elseif id == 2 then
			local built_set = {}
			if sets.Idle then
				built_set = sets.Idle
			else warn('sets.Idle not found!') end
			if sets.Weapons then
				if sets.Weapons.Sleep then
					info('Locking Sleep Gear')
					built_set = set_combine(built_set, sets.Weapons.Sleep)
				else warn('sets.Weapons.Sleep not found!') end
			else warn('sets.Weapons not found!') end
			equip(built_set)
			disable('main','range')
			-- Used to wake up during sleep
			-- Cancel stoneskin
			if buffactive['Stoneskin'] then
	  	 		info('Cancel Stoneskin')
				cancel('Stoneskin')
			end
		elseif id == 7 then
			log("Petrification - Checking Gear")
			if choose_set_custom then
				equip(set_combine(choose_set(), choose_set_custom()))
			else
				equip(set_combine(choose_set()))
			end
		elseif id == 10 then
			log("Stunned - Checking Gear")
			if choose_set_custom then
				equip(set_combine(choose_set(), choose_set_custom()))
			else
				equip(set_combine(choose_set()))
			end
		elseif id == 15 then
			info('DOOOOOOM!!!')
			if sets.Cursna_Received then
				equip(sets.Cursna_Received)
				disable('neck','lring','rring','waist')
				info('Locking Cursna Received Gear')
			else warn('sets.Cursna_Received not found!') end
			if AutoItem then
				if player.inventory['Holy Water'] ~= nil then -- Only here to notify player about Doom status and potential lack of Holy Waters
					windower.chat.input('/item "Holy Water" <me>')
				else 
					info('No Holy Waters in inventory. Unable to cure DOOM status!')
				end
			end
		end 
	end)

	windower.register_event('lose buff', function(id)
		local name = res.buffs[id].en
		local gain = false
		if id == 15 then -- Doom
			if Divergence_Zones:contains(world.area) then
				-- Skip unlocking neck if need to RP
				enable('main','sub','range','ammo','head','lear','rear','body','hands','lring','rring','waist','legs','feet')
			else
				Unlock()
			end
			if choose_set_custom then
				if buff_change_custom then
					equip(set_combine(choose_set(), choose_set_custom(), buff_change_custom(name,gain)))
				else
					equip(set_combine(choose_set(), choose_set_custom()))
				end
			else
				equip(set_combine(choose_set()))
			end
			info('Unlocking Cursna Received Gear')
		elseif id == 2 then -- sleep
			if Divergence_Zones:contains(world.area) then
				-- Skip unlocking neck if need to RP
				enable('main','sub','range','ammo','head','lear','rear','body','hands','lring','rring','waist','legs','feet')
			else
				Unlock()
			end
			if choose_set_custom then
				if buff_change_custom then
					equip(set_combine(choose_set(), choose_set_custom(), buff_change_custom(name,gain)))
				else
					equip(set_combine(choose_set(), choose_set_custom()))
				end
			else
				equip(set_combine(choose_set()))
			end
			info('Unlocking Sleep Gear')
		end 
	end)

	windower.register_event('chat message', function(message,sender,mode,gm)
		--Future Hooks for PT chat or tells
		-- Mode 3 is tell
		-- Mode 4 is party
		--Ignore it if it's not party chat or a tell
		if mode ~= 3 or mode ~= 4 then 
			return
		end
		message = message:lower()
		-- Example Use
		if message:contains('hqzerg') then
			windower.send_command('sm on')
		end 
	end)

	-- Section used to determine if player is performing an action
	windower.register_event('action', function (data)
		if data ~= nil then
			--log('cat='..data.category..',param='..data.param)
			if data.actor_id == player.id then
				-- Ranged attack finish
				if data.category == 2 then
					if data.param == 26739 then 
						log('Player finished Shooting') 
					end
				--Casting finish
				elseif data.category == 4 then
					log('Casting Finished')
				-- Item Use
				elseif data.category == 9 then
					if data.param == 24931 then
						log('Item use')
					elseif data.param == 28787 then
						log('Item Use Interupted')
						if Divergence_Zones:contains(world.area) then
							enable('range','ammo','head','lear','rear','body','hands','lring','rring','waist','legs','feet')
						else
							Unlock()
						end
						if choose_set_custom then
							equip(set_combine(choose_set(), choose_set_custom()))
						else
							equip(set_combine(choose_set()))
						end
					end
				-- Item use Finished
				elseif data.category == 5 then
					if data.param == 4154 then
						log('Item Use Finished')
						if Divergence_Zones:contains(world.area) then
							enable('range','ammo','head','lear','rear','body','hands','lring','rring','waist','legs','feet')
						else
							Unlock()
						end
						if choose_set_custom then
							equip(set_combine(choose_set(), choose_set_custom()))
						else
							equip(set_combine(choose_set()))
						end
					end
				-- Casting Start
				elseif data.category == 8 then
					if data.param == 28787 then
						log('Spell Interupt')
						if choose_set_custom then
							equip(set_combine(choose_set(), choose_set_custom()))
						else
							equip(set_combine(choose_set()))
						end
					elseif data.param == 24931 then
						log('Casting Spell')
					end
				-- Ranged attack start
				elseif data.category == 12 then
					if data.param == 24931 then
						log(''..player.name ..' is Shooting')
					elseif data.param == 28787 then
						log('Shooting is interrupted')
					end
				end
				-- If player takes action, adjust TH tagging information
				if state.TreasureMode.value ~= 'None' and TaggingCategories:contains(data.category) then
					if windower.ffxi.get_mob_by_id(data.targets[1].id).is_npc then
						th_info.tagged_mobs[data.targets[1].id] = os.clock()
						if state.TreasureMode.value ~= 'Full Time' then 
							if choose_set_custom then
								equip(set_combine(choose_set(), choose_set_custom()))
							else
								equip(set_combine(choose_set()))
							end
						end
					elseif th_info.tagged_mobs[data.actor_id] then
						th_info.tagged_mobs[data.actor_id] = os.clock()
					else
						if th_info.tagged_mobs[data.targets[1].id] then
							th_info.tagged_mobs[data.targets[1].id] = os.clock()
						end
					end
				end
				
			elseif data.targets[1].id == player.id then -- others casting on me
				if S{4, 8}:contains(data.category) then
					local action = nil
					if data.category == 4 then
						action = res.spells[data.param]
					elseif data.category == 8 then
						action = res.spells[data.targets[1].actions[1].param]
					end
					if action then
						local setToEquip = nil
						if Phalanxes:contains(action.name) then
							setToEquip = sets.PhalanxReceived
						elseif CureSpells:contains(action.name) or CuragaSpells:contains(action.name) then
							setToEquip = sets.CureReceived
						elseif RefreshSpells:contains(action.name) then
							setToEquip = sets.RefreshReceived
						end
						if setToEquip then
							if data.category == 8 then
								-- Casting spell on me
								equip(set_combine(choose_set(), setToEquip))
							elseif data.category == 4 then
								-- Finished casting spell on me
								equip(choose_set())
							end
						end
					end
				end
				
			end
			-- Casting Spell
			if data.category == 8 then
				if data.param == 24931 then
					if data.targets[1].actions[1].param ~= 0 then
						-- Get the ability
						-- local ability = res.spells[targets[1].actions[1].param]
					end
				-- Spell inturpted
				elseif data.param == 28787 then end
			-- Weaponskill Finished
			elseif data.category == 3 and data.param ~= 0 then
				run_burst(data)
			-- Casting finish
			elseif data.category == 4 then
				run_burst(data)
			end
		end
	end)

	-------------------------------------------------------------------------------------------------------------------
	-- This function is called to determine correct sets and not a built in gearswap call
	-------------------------------------------------------------------------------------------------------------------

	function choose_set()
		if buffactive['Sleep'] then return end
		local built_set = {}
		-- Combat Checks
		if player.status == "Engaged" then
			if sets.OffenseMode then
				built_set = sets.OffenseMode
				if sets.OffenseMode[state.OffenseMode.value] then
					built_set = set_combine(built_set, sets.OffenseMode[state.OffenseMode.value])
					if state.WeaponMode.value ~= "Locked" then
						-- Check the weapons
						if sets.Weapons then
							if sets.Weapons[state.WeaponMode.value] then
								built_set = set_combine(built_set, sets.Weapons[state.WeaponMode.value])
							else warn('sets.Weapons.'..state.WeaponMode.value..' not found!') end
						else warn('sets.Weapons not found!') end
						-- Equip sub weapon based off mode
						if not DualWield and not TwoHand then
							if sets.Weapons.Shield then
								built_set = set_combine(built_set, sets.Weapons.Shield)
							else warn('sets.Weapons.Shield not found!') end
						elseif DualWield then
							if sets.DualWield then
								built_set = set_combine(built_set, sets.DualWield)
							else warn('sets.DualWield not found!') end
						end
					end
					-- Ranged Mode
					if state.JobMode.value == "Ranged" then
						log('Ranged Mode')
						if sets.OffenseMode.Ranged then
							built_set = set_combine(built_set, sets.OffenseMode.Ranged)
						else warn('sets.OffenseMode.Ranged not found!') end
					end
					-- Check if AM3 is active
					if buffactive['Aftermath: Lv.3'] and sets.OffenseMode.AM3 and sets.OffenseMode.AM3[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.OffenseMode.AM3[state.WeaponMode.value])

					elseif buffactive['Aftermath: Lv.2'] and sets.OffenseMode.AM2 and sets.OffenseMode.AM2[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.OffenseMode.AM2[state.WeaponMode.value])

					elseif buffactive['Aftermath: Lv.1'] and sets.OffenseMode.AM1 and sets.OffenseMode.AM1[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.OffenseMode.AM1[state.WeaponMode.value])

					elseif buffactive['Aftermath'] and sets.OffenseMode.AM and sets.OffenseMode.AM[state.WeaponMode.value] then
						built_set = set_combine(built_set, sets.OffenseMode.AM[state.WeaponMode.value])
					end
					-- Check if TreasureMode is activew
					if state.TreasureMode.value ~= 'None' then
						if sets.TreasureHunter then
							-- Equip TH gear if mob is not marked as tagged
							if not th_info.tagged_mobs[player.target.id] then
								built_set = set_combine(built_set, sets.TreasureHunter)

							-- Equip TH gear if TreasureMode is Full Time
							elseif state.TreasureMode.value == 'Full Time' then
								built_set = set_combine(built_set, sets.TreasureHunter)

							-- Equip TH gear if TreasureMode is SATA and either SA, TA or Feint is active
							elseif state.TreasureMode.value == 'SATA' and (buffactive['Sneak Attack'] or buffactive['Trick Attack'] or buffactive['Feint']) then
								built_set = set_combine(built_set, sets.TreasureHunter)
							end
						else warn('sets.TreasureHunter not found!') end
					end
				else warn('sets.OffenseMode.'..state.OffenseMode.value..' not found!') end
			else warn('sets.OffenseMode not found!') end
		-- Idle sets
		else
			if sets.Idle then
				built_set = sets.Idle
				-- Idle state
				if sets.Idle[state.OffenseMode.value] then
					built_set = set_combine(built_set, sets.Idle[state.OffenseMode.value])
				else warn('sets.Idle.'..state.OffenseMode.value..' not found!') end		
				-- Resting condition
				if player.status == "Resting" then
					if sets.Idle.Resting then
						built_set = set_combine(built_set, sets.Idle.Resting)
					else warn('sets.Idle.Resting not found!') end
				end
				-- Weapons
				if state.WeaponMode.value ~= "Unlocked" then
					if state.WeaponMode.value == "Locked" then
						built_set = set_combine(built_set, { main=player.equipment.main, sub = player.equipment.sub, range = player.equipment.range})
						log(built_set)
					else
						if sets.Weapons then
							if sets.Weapons[state.WeaponMode.value] then
								built_set = set_combine(built_set, sets.Weapons[state.WeaponMode.value])
							else warn('sets.Weapons.'..state.WeaponMode.value..' not found!') end
							-- Check for sub weapon
							if not TwoHand and not DualWield then
								if sets.Weapons.Shield then
									built_set = set_combine(built_set, sets.Weapons.Shield)
								else warn('sets.Weapons.Shield not found!') end
							end
						else warn('sets.Weapons not found!') end
					end
				end
				--Pet specific checks
				if pet.isvalid then
					if sets.Idle.Pet then
						built_set = set_combine(built_set, sets.Idle.Pet)
					else warn('sets.Idle.Pet not found!') end
				end
				-- Equip Sublimation gear
				if buffactive[187] then
					if sets.Idle.Sublimation then
						built_set = set_combine(built_set, sets.Idle.Sublimation)
					else warn('sets.Idle.Sublimation not found!') end
				end
				-- Equip movement gear
				if is_moving then
					if sets.Movement then
						built_set = set_combine(built_set, sets.Movement)
					else warn('sets.Movement not found!') end
				end
			else warn('sets.Idle not found!') end
		end
		return built_set
	end

	function equip_set()
		windower.send_command("gs c update auto")
	end

	-- Start the engine with a 5 sec delay
	coroutine.schedule(display_box_update, 2)
	coroutine.schedule(dual_wield_check, 2)
	coroutine.schedule(two_hand_check, 2)
	coroutine.schedule(equip_set, 2)
	coroutine.schedule(main_engine, 2)
end