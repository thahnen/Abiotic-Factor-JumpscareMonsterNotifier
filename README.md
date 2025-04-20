# JumpscareMonsterNotifier - Warn the player when Jumpscare Monster spawn nearby

The only monsters causing Jumpscares in *Abiotic Factor* so far are the **Leyak** and the
**Reaper**. The first one spawns nearly everywhere and haunts the player while the second one only
spawns in the *Security Sector* at given spawn points, patrols its area, and then despawns to
spawn again at the nearest spawn point to the player after around *30 seconds*.
I hate Jumpscares, therefore this mod should be used if you hate them as well! It warns when they
spawn and additionally for the **Reaper** also informs that it despawned.

This is a mod relying on UE4SS for Abiotic Factor and was heavely inspired by the
*[LeyakNoMore](https://www.nexusmods.com/abioticfactor/mods/25)* mod that is way more customizable
but also despawns the **Leyak** and drops its essence. I tried to mimic it at first as well to be
a complementary (like *ReaperNoMore*) and only despawn the **Reaper** and drop its essence but this
was not straightforward and I am not really proficient with *Unreal Engine* and *FModel*.

## Development

This mod relied on the
[UE4SS configuration for Abiotic Factor](https://github.com/igromanru/AF-UE4SS), and
[FModel](https://fmodel.app/) for checking out the
[Mapping Files for Modding Abiotic Factor](https://github.com/SweptWasTaken/AbioticFactorMappings).
I personally like to use *Visual Studio Code* for the actual *Lua* development.
