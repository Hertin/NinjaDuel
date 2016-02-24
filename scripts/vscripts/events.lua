have_set_respawn_vector = false
--respawn_vector={}
KILLS_TO_END_GAME_FOR_TEAM=50
-- The overall game state has changed
function GameMode:OnGameRulesStateChange(keys)
  -- This internal handling is used to set up main barebones functions
  GameMode:_OnGameRulesStateChange(keys)

  local newState = GameRules:State_Get()
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function GameMode:OnPlayerReconnect(keys)
end


-- A player picked a hero
function GameMode:OnPlayerPickHero(keys)
  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

-- A player killed another player in a multi-team context
function GameMode:OnTeamKillCredit(keys)
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
-- function GameMode:OnEntityKilled( keys )
--   DebugPrint( '[BAREBONES] OnEntityKilled Called' )
--   DebugPrintTable( keys )
--   GameMode:_OnEntityKilled( keys )
--   -- The Unit that was Killed
--   local killedUnit = EntIndexToHScript( keys.entindex_killed )
--   -- The Killing entity
--   local killerEntity = nil

--   if keys.entindex_attacker ~= nil then
--     killerEntity = EntIndexToHScript( keys.entindex_attacker )
--   end

--   -- The ability/item used to kill, or nil if not killed by an item/ability
--   local killerAbility = nil

--   if keys.entindex_inflictor ~= nil then
--     killerAbility = EntIndexToHScript( keys.entindex_inflictor )
--   end

--   local damagebits = keys.damagebits -- This might always be 0 and therefore useless

--   -- Put code here to handle when an entity gets killed
-- end
function GameMode:OnEntityKilled( keys )
  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  for i=0,5 do
    local ability=killerEntity:GetAbilityByIndex(i)
    if ability then
      ability:EndCooldown()
    end
  end

  if killedUnit:IsRealHero() then 
    killedUnit:SetTimeUntilRespawn(5)
    if END_GAME_ON_KILLS and GetTeamHeroKills(killerEntity:GetTeam()) >= KILLS_TO_END_GAME_FOR_TEAM then
      print(KILLS_TO_END_GAME_FOR_TEAM)
      GameRules:SetSafeToLeave( true )
      GameRules:SetGameWinner( killerEntity:GetTeam() )
    end

    --PlayerResource:GetTeamKills
    if SHOW_KILLS_ON_TOPBAR then
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_BADGUYS, GetTeamHeroKills(DOTA_TEAM_BADGUYS) )
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_GOODGUYS, GetTeamHeroKills(DOTA_TEAM_GOODGUYS) )
    end
  end
end
function GameMode:OnPlayerPickHero(keys)
  local hero = EntIndexToHScript(keys.heroindex)
  -- This line for example will set the starting gold of every hero to 500 unreliable gold
  hero:SetGold(0, false)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item
  --local item = CreateItem("item_example_item", hero, hero)
  --hero:AddItem(item)
  for i=0,2 do
    local ability=hero:GetAbilityByIndex(i)
    if ability then
      ability:SetLevel(1)
    end
  end


end

function GameMode:OnNPCSpawned(keys)
  -- This internal handling is used to set up main barebones functions
  --GameMode:_OnNPCSpawned(keys)
  local enti=EntIndexToHScript(keys.entindex)
  print(#(respawn_vector))
  if enti:IsRealHero() then
    if have_set_respawn_vector then
      local num=RandomInt( 1 , #(respawn_vector) )--复活的时候随机地点
      FindClearSpaceForUnit(enti,respawn_vector[num],true)
    end

    for i=0,5 do
      local ability=enti:GetAbilityByIndex(i)
      if ability then
        ability:EndCooldown()
      end
    end

  end
  local npc = EntIndexToHScript(keys.entindex)
end






-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function GameMode:PlayerConnect(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:OnConnectFull(keys)
  GameMode:_OnConnectFull(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function GameMode:OnPlayerSelectedCustomTeam(keys)
  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end
