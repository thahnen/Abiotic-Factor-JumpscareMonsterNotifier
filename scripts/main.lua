require("UEHelpers")
local UEHelpers = require("UEHelpers")


-- ============================================================================================= --


local UE4SS = {}

--- Log to UE4SS.log
--- @param message string
function UE4SS.log(message)
  print("[JumpscareMonsterNotifier] " .. message .. "\n")
end


-- ============================================================================================= --


local HUD = {}

--- Display message to the users HUD with a given criticalaty level (higher = more critical)
--- @param message string
--- @param level ECriticalityLevels
function HUD.sendWarningMessage(message, level)
  local player = UEHelpers.GetPlayerController()
  player.PlayerHUDRef:DisplayWarningMessage(FText(message), level)
end


-- ============================================================================================= --


local leyakUpdateVisibilityHookRegistered = false
local reaperReceiveBeginPlayHookRegistered = false
local reaperOnDespawnHookRegistered = false
local HOOKS = {}

-- Inform player that the Leyak spawned
function HOOKS.registerLeyakUpdateVisibilityHook()
  if leyakUpdateVisibilityHookRegistered == true then
    return
  end

  UE4SS.log("Registering hook for NPC_Leyak.NPC_Leyak_C:UpdateLeyakVisibility")

  RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Leyak.NPC_Leyak_C:UpdateLeyakVisibility", function(Context)
    UE4SS.log("Leyak spawned nearby!")
    HUD.sendWarningMessage("Something is stalking you ...", 3)
  end)

  leyakUpdateVisibilityHookRegistered = true
end

-- Inform player that the Reaper spawned
function HOOKS.registerReaperReceiveBeginPlayHook()
  if reaperReceiveBeginPlayHookRegistered == true then
    return
  end

  UE4SS.log("Registering hook for NPC_Monster_Reaper.NPC_Monster_Reaper_C:ReceiveBeginPlay")

  RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Monster_Reaper.NPC_Monster_Reaper_C:ReceiveBeginPlay", function(Context)
    UE4SS.log("Reaper spawned nearby!")
    HUD.sendWarningMessage("Death is coming for you ...", 3)
  end)

  reaperReceiveBeginPlayHookRegistered = true
end

-- Inform player that the Reaper despawned
function HOOKS.registerReaperOnDespawnHook()
  if reaperOnDespawnHookRegistered == true then
    return
  end

  UE4SS.log("Registering hook for NPC_Monster_Reaper.NPC_Monster_Reaper_C:OnDespawn")

  RegisterHook("/Game/Blueprints/Characters/NPCs/NPC_Monster_Reaper.NPC_Monster_Reaper_C:OnDespawn", function(Context)
    UE4SS.log("Reaper despawned!")
    HUD.sendWarningMessage("You were spared this time ...", 0)
  end)

  reaperOnDespawnHookRegistered = true
end

-- On client restart, register all the hooks of this mod
function HOOKS.registerMainHook()
  RegisterHook("/Script/Engine.PlayerController:ClientRestart", function ()
    HOOKS.registerLeyakUpdateVisibilityHook()
    HOOKS.registerReaperReceiveBeginPlayHook()
    HOOKS.registerReaperOnDespawnHook()
  end)
end


-- ============================================================================================= --


UE4SS.log("Started loading the Mod.")
HOOKS.registerMainHook()
UE4SS.log("Mod loaded successfully.")
