-- Generated from template
require('gamemode')

function Precache( context )
			PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts", context )
			PrecacheResource( "particle", "particles/units/heroes/hero_morphling/morphling_waveform.vpcf", context )
			PrecacheResource( "particle", "particles/units/heroes/hero_morphling/morphling_base_attack.vpcf", context )
			PrecacheResource( "particle", "particles/units/heroes/hero_morphling/morphling_base_attack_trail.vpcf", context)
			PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts", context )
			PrecacheResource( "particle", "particles/econ/items/mirana/mirana_crescent_arrow/mirana_spell_crescent_arrow.vpcf", context)
			PrecacheResource( "particle", "particles/econ/items/morphling/morphling_ethereal/morphling_adaptive_strike_ethereal.vpcf", context)
			PrecacheResource( "particle", "particles/morphling_adaptive_strike_ethereal.vpcf", context)
			PrecacheResource( "particle", "particles/morphling_base_attack.vpcf", context)
			PrecacheResource( "particle", "particles/units/heroes/hero_lina/lina_spell_light_strike_array.vpcf", context)	
			PrecacheResource( "particle", "particles/morphling_adaptive_strike_ethereal2.vpcf", context)	
			PrecacheResource( "particle", "particles/waveform.vpcf", context )		
			PrecacheResource( "particle", "particles/units/heroes/hero_chaos_knight/chaos_knight_phantasm.vpcf", context )	
			PrecacheResource( "particle", "particles/units/heroes/hero_puck/puck_phase_shift.vpcf", context )	
			PrecacheResource( "particle", "particles/units/heroes/hero_morphling/morphling_ambient_new.vpcf", context )	
			PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_mirana.vsndevts", context)
			PrecacheResource( "particle", "particles/econ/items/puck/puck_alliance_set/puck_illusory_orb_aproset.vpcf", context )
			PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lina.vsndevts", context)
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
end