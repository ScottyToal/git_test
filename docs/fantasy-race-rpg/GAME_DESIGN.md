# ELDERWILD — Concept Bible v0.2

> Working title. Concept stage only: nothing here is being built yet.
>
> **✅ = decided by you** · **💡 = my proposal, needs your OK** · Everything is open to change.

---

## 0. Pillars (the rules every feature must follow)

1. **One progressive system.** Every activity's output is another activity's input. If you could delete a feature and nothing else breaks, it isn't connected yet. ✅
2. **Race is who you are; Shard is what you wield.** Both level up through **mastery** (like Blox Fruits), and mastery unlocks powers. ✅
3. **Old-fashioned fantasy, looks between bright and dark.** Colorful and inviting for kids, with real danger and mood in the later realms. Faces sit between anime and Western fantasy. ✅
4. **Quests are the spine.** NPC quests gated by level are the main way to progress. Everything else is a layer on top. ✅
5. **Co-op makes you stronger.** Element reactions only happen when *two different players* combine. ✅
6. **Build for the animation budget.** Shared rigs, shared combat animations, unique race idles and runs. ✅

---

## 1. World & Story

### The Eldertree ✅
A colossal world tree stands at the **center of the map**. Its roots once bound every realm together, and every race drew strength from its heart.

### The Sundering 💡
Something deep below the roots, **Mal'gorath, the Rot Sovereign**, poisoned the tree's heart. The heart shattered into countless **Shards** that rained across the realms. The corruption that leaked out, **the Wilt**, twists beasts, spirits and even the rulers of each race into monsters.

### You 💡
You are **Seedborn**: born from one of the last seeds of the Eldertree. Only Seedborn can absorb a Shard and wield its power. That's why players have powers and NPCs don't.
- **Race rolls have a story reason:** at the Tree's **Reseeding Altar**, the tree reshapes your body into a new race.
- **Shard swaps have a story reason too:** you release your Shard back to the tree and absorb a new one.

### The Tree changes as YOU progress ✅
Each player sees **their own version** of the Eldertree, based on how many realm bosses they've defeated (it's drawn on your screen only):

| Bosses beaten | Tree stage | Look |
|---|---|---|
| 0 | **Withered** | Grey bark, bare branches, violet Wilt veins |
| 1–2 | **Budding** | Veins fading, first green buds |
| 3–5 | **Leafing** | Canopy returns. Each realm you've cleared grows a branch **in that realm's color** |
| 6–8 | **Blossoming** | Flowers, glowing sap, birds and spirits return |
| 9 (story complete) | **Radiant** | Golden glow, falling petals, a light beam into the sky |

Every player can see their progress just by looking at the middle of the map. Two friends standing side by side literally see different trees.

---

## 2. Map Layout

```
                    ☁  CELESTINE  (Angel realm, sky above the canopy)
                              │
   Silverbough ── Mirefen ── Cogglen Hills
        │                          │
   Ironpeak      🌳 HEARTWOOD 🌳    Glimmerwood
        │       (hub at the Tree)   │
   Stonereach ───────────── Kingsmeadow   ← start
                              │
                    🔥 THE GLOAM  (Demon realm, beneath the roots)
```

- **Heartwood (hub):** a town built around the Tree's base on an island in a great lake. It's a safe zone: spawn, Reseeding Altar (race spins), Shard Merchant, basic Forge, Dock Merchant, bank/storage, trading plaza, and the **entrance to the Spire dungeon** (§8).
- **Seven surface realms** ring the lake, one per race. You go around the ring in level order.
- **Two vertical realms** for the endgame: **up** into the sky (Angel) and **down** under the roots (Demon). This is also why Angel and Demon are the rarest races: their homes are the hardest places in the world.

### Realms 💡 (level cap at launch: 500)

| # | Realm | Home of | Levels | Look & feel |
|---|---|---|---|---|
| 1 | **Kingsmeadow** | Human | 1–50 | Rolling farmland, windmills, a walled market town, bandit camps |
| 2 | **Glimmerwood** | Fairy | 50–100 | Glowing mushroom forest, fairy rings, eternal twilight, fireflies |
| 3 | **Cogglen Hills** | Gnome | 100–150 | Grassy burrow-hills, brass pipes and steam, haywire workshops |
| 4 | **Mirefen** | Saurian | 150–210 | Mangrove swamp, stilt villages, sunken lizard temples, fog |
| 5 | **Silverbough** | Elf | 210–270 | Giant silver-barked trees, moonlit ruins, waterfalls |
| 6 | **Ironpeak** | Dwarf | 270–330 | Snowy peaks, forge halls carved into rock, **the mines**, the **Master Forge** |
| 7 | **Stonereach** | Golem | 330–390 | Sun-baked canyons, giant ruined statues, rune circles, sandstorms |
| 8 | **Celestine** | Angel | 390–450 | Floating marble islands above the canopy, golden light |
| 9 | **The Gloam** | Demon | 450–500 | Under the roots: violet fire rivers, obsidian city, the Tree's poisoned heart |

### Homeland bonus ✅ (your idea)
In your race's home realm you get a **Homeland** buff:
- **+10% damage and +10% XP**
- a small realm perk, e.g. Saurians swim fast in Mirefen and Dwarves mine faster in Ironpeak

Each realm also has a **race questline** about saving that race's corrupted ruler. It's open to everyone, with bonus dialogue and rewards if you're that race.

---

## 3. Races (9 at launch ✅)

### Visual features, idle & run ✅ (your rule: each race has its own idle + run; dash and combat are shared)

| Race | Rarity 💡 | Key visual features | Body | Idle | Run |
|---|---|---|---|---|---|
| **Human** | Common | None: the "blank canvas", most customizable | Normal | Shifts weight, hand rests on hip | Standard athletic |
| **Elf** | Uncommon | Long pointed ears, faint glowing face markings | Tall & slender | Calm, looks around, adjusts hair | Light and graceful, leaning forward |
| **Dwarf** | Uncommon | Braids/beard options, stocky | Short & wide | Stretches back, cracks knuckles | Heavy stomping, arms pumping |
| **Gnome** | Common | Big ears, round nose, tiny | Smallest | Bouncy, fiddles with a little gadget | Quick scurry |
| **Fairy** | Rare | Translucent wings, sparkle trail | Small | Hovers and bobs above the ground | Skip-glide just above the ground |
| **Saurian** (lizardfolk) | Uncommon | Scales, tail, reptile eyes, head crest | Normal, hunched | Tail sway, head tilt | Low, forward-leaning sprint |
| **Golem** | Rare | Stone-texture skin, glowing rune cracks | Big & heavy | Stiff, dust falling off | Heavy lumbering (can't be knocked back) |
| **Angel** | Mythic | Feathered wings + halo | Normal | Wings slowly breathe, floats slightly | Graceful, wings tucked |
| **Demon** | Mythic | Horns, tail, dark eyes, ember glow | Normal, lean | Menacing slouch, embers flicker | **Fastest run in the game**, ninja lean |

> 💡 **Why Saurian instead of Dragonkin at launch:** Dragon becomes the **first Forged Race** (§3.3). Instead of being pure luck, it's the dream goal you grind the whole game for. That fits "one progressive system" perfectly.

### 3.1 Movement paths (your idea, flexible) 💡
Each race's movement upgrades at Race Mastery milestones. Wings either **start** small or **grow** later:

| Race | Start | Mastery 25 | Mastery 75 | Ascension (100) |
|---|---|---|---|---|
| Fairy | Small wings: hover + glide | Short flight | Faster, longer flight | Glowing monarch wings |
| Angel | Folded wings: glide | Real flight | Fast flight | **Six-winged Seraph** |
| Demon | Fastest runner + shadow dash | Wall-run | Double shadow dash | **Grows wings** (big payoff) |
| Saurian | Wall-climb + fast swim | Climb speed up | Tail-whip dash | Frilled Elder form |
| Elf | Double jump | Longer dash | Triple jump | Leaf-step (air dash) |
| Dwarf | Ground pound | Charge through walls/rocks | Bigger ground pound | Runic shockwave |
| Gnome | Grapple hook gadget | Double grapple | Glider gadget | Gnome mech suit |
| Golem | Can't be knocked back | Boulder roll | Faster roll | Titan form (bigger) |
| Human | Sprint + climb | Wall-run | Second Wind (refill stamina) | Champion's banner (team speed) |

**Flight rules** (so fliers don't dominate):
- Flight drains stamina.
- No heavy attacks while flying.
- Areas are gated by **level**, not by cliffs, so flying can't skip progression.

### 3.2 Race Mastery ✅ (1–100) 💡 numbers
- Earned from **all XP while that race is active**, plus big chunks from **race trials** in your homeland.
- **Saved per race.** Rerolling never erases mastery you already earned on a race.

| Mastery | Unlock |
|---|---|
| 1 | Base passive + race features |
| 10 | **Race Skill** (one active ability, see below) |
| 25 | Movement upgrade I |
| 50 | Passive II + cosmetic glow |
| 75 | Movement upgrade II |
| 100 | **Ascension Trial** unlocked |

| Race | Passive | Race Skill (mastery 10) |
|---|---|---|
| Human | Adaptable: +10% XP | **Rally:** short damage buff to you + nearby allies |
| Elf | Keen Senses: +crit chance, reveals hidden chests | **Hawk Eye:** next 3 hits guaranteed crit |
| Dwarf | Forgeborn: better forge results, +ore yield | **Iron Skin:** big damage reduction for 4s |
| Gnome | Lucky: +drop luck | **Gizmo Turret:** drops a small turret |
| Fairy | Fae Grace: dodge invincibility, small hitbox | **Pixie Dust:** heal allies + blind enemies in an area |
| Saurian | Cold Blood: regen out of combat, swim speed | **Shed Skin:** cleanse debuffs + burst heal |
| Golem | Stoneheart: huge HP, damage reduction, slower | **Bulwark:** shield that absorbs damage |
| Angel | Radiance: slow self-heal, one revive per dungeon | **Blessing:** heal + shield one ally |
| Demon | Hellbound: lifesteal, stronger at low HP | **Bloodrage:** +damage, drains your HP |

### 3.3 Expanding races later ✅ (you said games add races over time)
Three ways, which can all be used:

**A. Ascensions** (each race's max form, needs Race Mastery 100 + a trial)
Human → **Champion** · Elf → **High Elf** · Dwarf → **Thane** · Gnome → **Archtinker** · Fairy → **Fae Monarch** · Saurian → **Elder Saurian** · Golem → **Titan** · Angel → **Seraph** · Demon → **Archdemon**

**B. Forged Races** (your Lizard + Fire = Dragon idea)
Combine a maxed race with a maxed Shard and a rare item at the Reseeding Altar:

| Recipe | Forged Race | Launch? |
|---|---|---|
| Saurian M100 + Ember or Magma Shard M400 + **Ignarax's Heart** (world boss) | **Dragonborn**: scales, horns, **wings that grow** | ✅ launch |
| Elf M100 + Umbra Shard M400 + Silverbough relic | **Dark Elf** | ✅ launch |
| Fairy + Umbra | Unseelie Fae | later |
| Golem + Crystal | Crystal Colossus | later |
| Human + Radiance | Sunborn | later |

These are perfect **update headlines**: "NEW FORGED RACE: UNSEELIE FAE".

**C. New realms bring new rollable races**: e.g. **Merfolk/Tidefolk** (fins, gills, scales) with an ocean update, plus Orc, Vampire, Werewolf, Minotaur.

> **Unicorn note:** anything that isn't human-shaped (unicorn, centaur, mermaid tail) breaks the "one body type, shared animations" rule. 💡 **Unicorns become a rare mount** instead. Mounts are a great fantasy cosmetic and they sell well.

---

## 4. Shards (the powers; a better name than "elements") 💡

**Name:** **Shards**: fragments of the Eldertree's shattered heart. "I've got the Thunder Shard" sounds good, and it ties powers to the story.
*Other options if you don't like it: Essences, Sigils, Arcana, Heartstones.*

### Rules ✅
- **One Shard at a time.** To change, you **release** it (reset) and absorb a different one.
- **Shard Mastery** (1–400) unlocks moves, like Blox Fruits.
- 💡 Mastery is **remembered per Shard**. If you go back to a Shard later you keep your progress, but you still need to find or buy a new copy.

### How you get Shards 💡
| Source | What |
|---|---|
| **Starter choice** | Tutorial: pick 1 of the 4 Common Shards |
| **Shard spawns** | Shards randomly appear around the world every so often (like fruits spawning under trees in Blox Fruits): instant server-wide excitement |
| **Shard Merchant** (Heartwood) | Rotating stock, bought with gold. Rare ones appear rarely |
| **Bosses & world boss** | Rare drop chance |
| **Trading** | Player-to-player (level-gated, with a confirmation screen to stop scams) |
| **Storage** | Unabsorbed Shards sit in your inventory to trade or use later |

### Mastery unlocks 💡
| Mastery | Unlock |
|---|---|
| 1 | Z move |
| 50 | X move |
| 100 | C move |
| 200 | V move |
| 300 | **F: Ultimate** |
| 400 | **Awakened:** upgraded VFX on every move + aura (the flex goal; also needed for Forged Races) |

### Status effects ✅ (your rule: not every move applies one)
Only **one signature move per Shard** (marked ★ below) applies a status. Fire isn't automatically "burn everything".

8 statuses: **Burning** (damage over time) · **Soaked** (slow) · **Rooted** (can't move, short) · **Chilled** (slower attacks) · **Shocked** (interrupts) · **Poisoned** (stacking damage over time) · **Dazzled** (attacks miss) · **Cursed** (less healing and defense)

### Resonance: team-only reactions ✅
A reaction happens **only when Player A's status is on an enemy and Player B hits it with a different status move.** You can't trigger it solo. It rewards playing with friends, which is the best retention there is.

| Combo | Resonance | Effect |
|---|---|---|
| Soaked + Shocked | **Conduction** | Lightning chains to every Soaked enemy nearby |
| Soaked + Burning | **Steam Burst** | Blinding cloud + area damage |
| Soaked + Chilled | **Deep Freeze** | Frozen solid for 2s |
| Burning + Chilled | **Thermal Shock** | One big burst hit |
| Burning + Poisoned | **Toxic Blaze** | Poison explodes |
| Rooted + Shocked | **Overload** | Long stun |
| Rooted + Poisoned | **Blight Bloom** | Poison spreads through the ground |
| Dazzled + Cursed | **Twilight Rend** | Armor break |
| Any other pair | **Resonance** | Generic bonus burst (+20%) |

Special roles:
- **Gale** moves *scatter* an existing status to nearby enemies.
- **Crystal** moves *shatter* any status for bonus damage.

**Cost:** each reaction is just a VFX burst + damage number. **Zero new animations.**

### Launch Shards: 12 💡
Moves reuse **10 shared cast animations** (in brackets). Only the visual effects differ per Shard. Each **Ultimate** gets its own short 2–4s camera moment, not a full cutscene.

Cast animations: `Throw` · `Barrage` · `Slam` · `Dash` · `Beam` · `Circle` (target area) · `Rise` (launcher) · `Guard` · `SkyCall` · `Aura`

| Shard | Rarity | Playstyle | Z | X | C | V | F (Ultimate) |
|---|---|---|---|---|---|---|---|
| **Ember** | Common | Aggressive close/mid damage | Fire Bolt `Throw` | Flame Dash `Dash` | ★Kindle (Burning) `Circle` | Blazing Uppercut `Rise` | **Phoenix Descent** |
| **Tide** | Common | Combos + healing | Water Lash `Throw` | Riptide `Dash` | ★Drench (Soaked) `Circle` | Tidal Shield `Guard` | **Leviathan's Wake** |
| **Stone** | Common | Tank / control | Rock Toss `Throw` | Pillar Rise `Rise` | ★Quake (Rooted) `Slam` | Stoneskin `Aura` | **Titan's Fist** |
| **Gale** | Common | Mobility / spreader | Wind Blade `Throw` | Updraft `Rise` | Cyclone (scatter) `Barrage` | Tailwind `Aura` | **Eye of the Gale** |
| **Frost** | Uncommon | Crowd control | Ice Shards `Barrage` | Frost Slide `Dash` | ★Glacial Field (Chilled) `Circle` | Ice Wall `Guard` | **Winter's Maw** |
| **Thunder** | Uncommon | Burst + speed | Spark Bolt `Throw` | Lightning Step `Dash` | ★Thunderclap (Shocked) `Slam` | Chain Lightning `Beam` | **Stormcaller** |
| **Thorn** | Uncommon | Damage over time + support | Thorn Volley `Barrage` | Vine Grapple `Dash` | ★Briar Patch (Poisoned) `Circle` | Bloom Heal `Aura` | **Elder Grove** |
| **Radiance** | Rare | Beams + support | Light Lance `Throw` | Blink `Dash` | ★Solar Flare (Dazzled) `Aura` | Sunbeam `Beam` | **Judgement** |
| **Umbra** | Rare | Assassin / life drain | Shadow Claw `Barrage` | Shade Step `Dash` | ★Hex (Cursed) `Throw` | Night Veil (stealth) `Aura` | **Eclipse** |
| **Magma** | Legendary | Heavy zone control | Lava Glob `Throw` | Magma Surf `Dash` | ★Eruption (Burning) `Slam` | Molten Fist `Rise` | **Cataclysm** |
| **Crystal** | Legendary | Armor / precision (shatter) | Prism Shards `Barrage` | Crystal Spire `Rise` | Refraction `Beam` | Gem Bulwark `Guard` | **Geode Colossus** |
| **Starfall** | Mythic | Huge area damage | Star Needle `Throw` | Comet Dash `Dash` | Gravity Well `Circle` | Meteor `SkyCall` | **Supernova** |

**Future Shards:** Void, Sand, Moon, Spirit, Blood, Sound, Venom, Bone, Ash, Time.

---

## 5. Weapons 💡

### 7 weapon classes at launch
Every weapon in a class **shares that class's animations**. Weapons differ by model, stats, passive and trail VFX, and legendaries get a unique skill effect.

| Class | Feel | Scales with | Race fit |
|---|---|---|---|
| **Fists / Gauntlets** | Fast combos | Strength | Human, Demon |
| **Sword** | Balanced 4-hit | Strength | Human, Angel |
| **Greatsword / Hammer** | Slow, heavy, guard-break | Strength | Dwarf, Golem |
| **Dual Daggers** | Very fast, backstab bonus | Agility | Saurian, Demon |
| **Spear** | Reach, lunge | Agility | Saurian, Elf |
| **Bow** | Ranged, charged shot | Agility | Elf, Fairy |
| **Staff** | Boosts Shard moves, light melee | Shard Power | Fairy, Gnome, Angel |

### Per class, about 6 weapons (~42 total at launch)
- 2 from the **Heartwood shop** (Common/Uncommon)
- 1–2 **boss drops** (each realm boss drops its signature weapon)
- 1 **Spire shop** exclusive (§8)
- 1 **Forge** craft (needs boss materials + ores + fishing items)

### Controls (Blox Fruits style)
Hotbar: **[1] Weapon**, **[2] Shard**. Switching between them mid-combo is a skill move.
- Weapon: M1 combo, Z and X skills (C on legendaries)
- Shard: Z X C V F

**Weapon Mastery** (1–300): skill Z at 1, X at 100, C at 200 (legendary only), 300 = "Honed" glow.

---

## 6. Animation budget 💡 (the real "cost" of this game)

| Group | Count | Notes |
|---|---|---|
| Race idle + run | 9 races × 2 = **18** | Your rule ✅ (+ walk is shared: 1) |
| Flight (hover + fly forward) | ~**8** | Fairy, Angel, Demon (Ascended), Dragonborn |
| Shared movement | ~**12** | Dash ×4 directions, jump, fall, land, hit reactions, knockdown, get-up, death, stun |
| Weapons | 7 classes × ~10 = **70** | Equipped idle, 4-hit M1, heavy, block, 2 skills, equip |
| Shard casts | **10** | The shared cast animations above |
| Shard ultimates | **12** | One each, with a camera moment |
| Mobs | ~**30** | Humanoid mobs **reuse player anims**. Beast, flyer and crawler rigs ~7 each |
| Bosses | ~**60** | ~6 unique each (some reuse) |
| NPC idles / emotes | ~**10** | |
| **Total** | **≈ 230** | |

**Animation rules that keep it possible:**
- When **unarmed**, you use your race's idle/run.
- When holding a weapon, the **weapon class idle** plays on the upper body while your **race run** keeps playing on the legs. That avoids making 9 races × 7 weapons = 63 combos.
- Humanoid mobs (bandits, knights, elves, dwarves, skeletons) use the **player rig**, so they get combat animations for free.

---

## 7. Mobs & Bosses 💡

### Rig families (build once, reuse everywhere)
| Rig | Used by |
|---|---|
| **Humanoid** (same as players) | Brigands, knights, corrupted elves/dwarves, bone knights, valkyries |
| **Beast** (4 legs) | Wolves, boars, crocs, panthers, hellhounds |
| **Flyer** | Moths, bats, owls, wasps, imps, griffins |
| **Crawler** | Beetles, scorpions, burrowers |
| **Floater** (no rig, just tween + VFX) | Wisps, djinn, halo spirits |

### Per realm: 3 mob types + 1 elite + 1 boss
The **first boss kill is a story quest** ✅. After that the boss **respawns** for **exclusive drops** you can't get anywhere else ✅.

| Realm | Mobs | Elite | Boss | Boss drops |
|---|---|---|---|---|
| Kingsmeadow | Wilt Wolves, Brigands, Scarecrow Husks | Brigand Captain | **Baron Mordrake, the Hollow Knight**: armor filled with Wilt. Charges, shield wall, summons husks at 50% HP | *Oathblade* (Sword), Baron's Crest |
| Glimmerwood | Thornlings, Wisp Moths, Moss Boars | Hollow Treant | **Queen Briarhex**: the Fairy Queen twisted into a thorn witch. Flies, fills the arena with vines, safe zones shrink | *Briar Staff*, Fae Silk |
| Cogglen Hills | Clockwork Beetles, Burrow Rats, Rogue Automatons | Steam Golem | **Gearheart**: a giant walking machine piloted by mad inventor Fizzwick. Missile barrage, conveyor floor, glowing weak points | *Gearspring Gauntlets*, Brass Cogs |
| Mirefen | Mire Crocs, Bog Shamblers, Swamp Wasps | Saurian Renegade | **Hydrask the Three-Jawed**: hydra whose 3 heads attack differently. Downed heads regrow unless you finish fast | *Hydrafang* (Spear), Hydra Scale |
| Silverbough | Shadow Panthers, Corrupted Sentinels, Spirit Owls | Elven Revenant | **The Antlered Warden**: giant spirit stag. Moon arrows; arena flips between day and night phases | *Moonstring* (Bow), Silverleaf |
| Ironpeak | Frost Trolls, Rock Burrowers, Ice Bats | Troll Brute | **King Grimvald the Frostbound**: dwarf king frozen by the Wilt. Ice hammer slams, avalanche | *Thane's Maul* (Greatsword), Frostiron |
| Stonereach | Rune Sentries, Sand Scorpions, Dust Djinn | Obelisk Guardian | **The Colossus of Ur-Kaal**: a giant statue awakened. Glowing weak points, sandstorm phase | *Runefang Daggers*, Ancient Core |
| Celestine | Fallen Valkyries, Storm Griffins, Halo Wisps | Sky Templar | **Seraphine the Fallen**: an angel who turned on the Tree. Light beams, wing feather barrage | *Dawnbringer* (Sword), Seraph Feather |
| The Gloam | Imps, Hellhounds, Bone Knights | Pit Lord | **Mal'gorath, the Rot Sovereign**: final story boss at the Tree's poisoned heart. 3 phases | *Doomcleaver* (Greatsword), Rot Heart |

### World Boss 💡
**Ignarax, the Ember Wyrm.** A dragon that circles the map and lands in a random realm every couple of hours. Server-wide fight.
- Drops: **Ignarax's Heart** (needed for the Dragonborn Forged Race), Magma Shard chance, dragon cosmetics.
- Seeing a dragon fly over the map is also a great hype moment.

---

## 8. Dungeon: The Heartwood Spire 💡

A tower dungeon **inside the Eldertree's trunk**: you climb floor by floor up the tree.
- **1–4 players.** Each floor is a wave room or a puzzle room. Floor modifiers (e.g. "enemies explode on death", "double speed") keep runs fresh.
- **Every 5 floors:** milestone chest (random drops) ✅
- **Every 10 floors:** Spire boss (a stronger realm-boss remix) ✅
- **Spire Marks:** points earned per floor, spent at the **Spire shop** in the lobby on dungeon-only items ✅ (your idea, and it's your bad-luck protection)
- **Spire shop sells:** exclusive weapons, Forge catalysts, Ascension trial items, cosmetics, Shard Merchant restock tokens.
- **Floor depth unlocks with level**, so the Spire grows with you all game.

---

## 9. Fishing & Mining ✅ (optional, safe, for later-game players)

- **Fishing:** every realm has fishing spots with **realm-specific fish**.
  - **Fish** sell to the **Dock Merchant** for gold ✅
  - **Items** (driftwood, pearls, sunken ore, ancient scales, treasure chests) are **crafting materials** ✅
  - Very rare: **Shard fragments**
- **Mining:** mainly in **Ironpeak's mines**, plus some ore veins in each realm. Ores go to the Forge or sell for gold.
- **Balance rule:** AFK fishing/mining earns *less per hour* than active questing, but it's safe.
- A short reel-in minigame keeps Roblox's 20-minute idle kick from triggering.

---

## 10. Character Creator ✅ (like Slayers 2: one shared body, not the Roblox avatar)

| Option | Count (target) | Source idea |
|---|---|---|
| Skin tone | ~12 per race (Golem gets stone colors, Demon reds/greys, Saurian scale colors) | Color presets |
| Eyes (+ separate eye color) | 30 | Our own face images (AI-generated in one consistent style) |
| Mouths | 30 | Same |
| Brows | ~15 | Same |
| Scars / face marks | ~20 | Same |
| Hair (+ color) | 30 | 💡 Curated **Roblox catalog hairs** loaded by ID (avatar-editor games do this), mixed with our own Blender hairs where we can't find the right style |
| Facial hair | ~10 | Catalog / Blender |
| Tops, bottoms, shoes, cloak | ~15 each, 2-color dye | Clothing textures made for our body |
| Race-specific | Horn styles (Demon), wing patterns (Fairy/Angel), ear length (Elf), crest (Saurian), rune color (Golem) | Blender |

- **Style warning:** catalog items vary wildly in style. We only use ones that match our look, and keep a "style check" list.
- 💡 **The race roll happens inside the character creator.** Your character transforms on screen at the Reseeding Altar. It's the first moment of the game and the first TikTok clip.

---

## 11. How it all connects ✅

```
QUESTS (main spine) ──► LEVEL ──► unlocks next realm, Spire floors, better fish/ore spots
   │
REALM BOSSES ──► signature weapons + boss materials ──┐
   │  (each first kill grows your Eldertree)          │
SPIRE DUNGEON ──► Spire Marks → shop items + chests ──┼──► FORGE ──► weapons, upgrades, catalysts
   │                                                  │
FISHING / MINING ──► crafting items + gold ───────────┘
   │
GOLD ──► Shard Merchant ──► new Shards ──► SHARD MASTERY
                                                │
RACE MASTERY ◄── all XP ◄───────────────────────┤
     │                                          │
     ▼                                          ▼
ASCENSION TRIAL  = Race M100 + homeland boss material + Spire item
FORGED RACE      = Race M100 + Shard M400 + world boss item  (e.g. Dragonborn)
```
Race evolution is the end goal that needs **everything**. That's what makes it one game, not ten.

---

## 12. Stats (carried over from v0.1, renamed)

3 points per level into: **Vitality** (HP) · **Strength** (weapons) · **Agility** (light weapons, dash, flight speed) · **Shard Power** (Shard damage) · **Spirit** (mana + stamina/flight time). One free reset at level 100.

## 13. Monetization (later, carried over)
Race spins (with pity and visible odds) · gamepasses (2x XP, 2x drop luck, extra storage, fast flight) · **wing/aura/mount cosmetics** · private servers · season pass. Rule: **never sell power free players can't earn.**

---

## 14. Open questions for you

1. **"Shards"**: keep this name for powers, or another one?
2. **Dragon**: forged-only (my pick), or also rollable?
3. **Shard mastery remembered when you switch?** (my pick: yes)
4. **9 realms + level cap 500 at launch**: OK, or start smaller?
5. **Trading** at launch?
6. **Unicorn as a mount**: yes?
7. **PvP**: opt-in arena only, or open-world PvP toggle too?
8. Boss and realm names: keep, change, or brainstorm more?
