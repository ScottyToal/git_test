# ELDERWILD — Game Design Document (v0.1)

> *Working title. Alternatives: "Realms of the Elder Kin", "Fae & Fang", "Wyrdlands", "Kinfall".*

**One-line pitch:** A bright, open-world fantasy action RPG. You roll your **Race** (Fairy, Elf, Dragonkin, Dwarf...), master an **Element** (from Earth and Water up to Starlight and Void), find or forge **weapons**, and grind through islands, bosses and dungeons, all with **flight, wings and big flashy magic**.

**Genre references:** Blox Fruits (progression, races V1–V4), Shindo Life (spins + pity), Slayers 2 (layered identity, gear series), Arcane Odyssey (element synergies).

**Our differentiator:** every big grinder is anime-themed. We are the **fantasy** one: accessible (not Deepwoken-hardcore), colorful, with **flight as a core movement mechanic** and **wings/auras as the cosmetic economy.**

---

## 1. Build = Race × Lineage × Element × Weapon

Every player's build has four layers. Combining them creates thousands of builds without us hand-making thousands of things.

```
RACE        what you are     (rolled with Kin Spins)        → passives, stat bias, movement trait
LINEAGE     your bloodline   (rolled, race-specific)        → small buffs + a cosmetic look
ELEMENT     your magic       (earned via Shrine Trials)     → your ability moveset (Z/X/C/V/F)
WEAPON      your steel       (drops / shop / crafting)      → your M1 combo + weapon skills
```

Design rule: **Race decides HOW you play best, but never locks WHAT you can play.** A Dwarf mage is weaker than an Elf mage, but still viable. (This is the Rengoku/Flame effect from Slayers: a suggested playstyle, not a cage.)

---

## 2. Races

Rolled on first join, rerollable with **Kin Spins**. Odds are always shown in the UI. Exact numbers live in `src/shared/RaceData.luau`.

| Race | Rarity | Movement trait | Passive | Built for |
|---|---|---|---|---|
| **Human** | Common | Sprint + wall-climb | **Adaptable:** +10% XP, +1 extra stat point every 10 levels | Anything (jack of all trades) |
| **Gnome** | Common | Small hitbox, burrow-dash | **Lucky Tinkerer:** +15% drop luck, gadgets cost less | Farming, luck builds |
| **Dwarf** | Uncommon | Ground-pound | **Forgeborn:** better crafting rolls, +20% ore yield, armor bonus | Tank / heavy weapons / crafting |
| **Elf** | Uncommon | Double jump + long dash | **Keen Senses:** +crit chance, bow/spear damage, see hidden chests | Ranged / precision |
| **Fairy** | Rare | **True flight** (stamina-limited) | **Fae Grace:** dodge i-frames, +Nature/Light power, tiny hitbox | Mobile mage / support |
| **Golem** | Rare | Cannot be knocked back | **Stoneheart:** huge HP + damage reduction, slower | Tank / Earth |
| **Dragonkin** | Legendary | Wing glide → flight at Awakening II | **Dragon Heart:** breath attack (scales with element), fire resistance | Bruiser / Fire |
| **Angel** | Mythic | Flight + air-hover | **Radiance:** self-heal over time, +Light, revive once per dungeon | Holy support / Light |
| **Demon** | Mythic | Shadow-step teleport | **Hellbound:** lifesteal, +Dark, stronger at low HP | Aggressive / Dark |

**Race Awakening (V1 → V4), like Blox Fruits.** Each race has an Awakening path. Each step is a **Trial** (a short race-themed challenge):
- **Awakening I** (lvl 50): stat bonus + a cosmetic glow
- **Awakening II** (lvl 200): upgraded movement (e.g. Dragonkin gets real flight, Elf gets a triple dash)
- **Awakening III** (lvl 500): **unlocks a second Element slot** (Arcane Odyssey style)
- **Awakening IV** (lvl 1000, raid trial): **Race Ultimate**, a transformation (Fairy Queen form, Ancient Dragon form, Titan Golem...)

Awakening progress is kept **per race**, so a reroll doesn't erase it. This removes the "fear of rerolling" that stops people buying spins.

### Lineages (race sub-rolls, like Clans)
Each race has 4–6 Lineages. Example for Fairy:

| Lineage | Rarity | Buff |
|---|---|---|
| Meadow | Common | +5% stamina regen |
| Dewdrop | Common | +Water power |
| Thorn | Rare | Melee hits apply small poison |
| Moonwing | Epic | Stronger at night, glowing night wings |
| Seelie Royal | Legendary | +10% all element power, crown cosmetic |

Lineage spins are a **separate, cheaper spin currency**: a second money sink that's lower-stakes.

---

## 3. Elements (your move set)

**Earned, not just rolled.** You get your first element by completing a **Shrine Trial** on Island 1, and you choose which shrine to take. Rarer elements drop from bosses, hidden trials or events. Elements can also be bought as **Element Crystals** from a rotating stock (Blox Fruits dealer style), which drives daily logins.

Each element has **5 moves** (Z, X, C, V, F) unlocked through **Element Mastery** (use it to level it). F is the ultimate, available at mastery 400.

### Tiers
| Tier | Elements | How to get |
|---|---|---|
| **Primal** | Earth, Water, Fire, Air | Starting shrines |
| **Greater** | Lightning, Nature, Ice, Sand | Island 2–3 trials, crystal stock |
| **Ascended** | Light, Dark, Crystal, Magma, Storm, Bloom | Boss drops, rare stock |
| **Mythic** | Starlight, Void, Moonfire, Time, Spirit | World bosses, raids, events |

### Element Synergies (2 slots after Awakening III)
Pairs of elements make **Fusion moves** and status effects:

| Combo | Fusion | Effect |
|---|---|---|
| Water + Lightning | **Storm Surge** | Shock: chains to nearby enemies |
| Fire + Earth | **Magma Burst** | Burn + slow |
| Water + Air | **Blizzard** | Freeze buildup |
| Earth + Air | **Sandstorm** | Blind (enemy aim off) |
| Nature + Light | **Sunbloom** | Heal allies in area |
| Dark + Light | **Eclipse** | Big burst, self-damage |
| Fire + Air | **Wildfire** | Spreading burn |
| Nature + Dark | **Blight** | Poison stacks |

### Race ↔ Element affinity
Each race gets **+15%** power with 2 "affinity" elements. This is the "built for a playstyle" hook:
Fairy → Nature, Light · Dragonkin → Fire, Storm · Golem → Earth, Crystal · Demon → Dark, Fire · Angel → Light, Air · Elf → Nature, Air · Dwarf → Earth, Magma · Gnome → Earth, Nature · Human → none (gets the XP bonus instead)

---

## 4. Weapons

| Class | Feel | Scales with |
|---|---|---|
| Sword | balanced 4-hit combo | Strength |
| Greatsword / Hammer | slow, heavy, guard-break | Strength |
| Dagger(s) | fast, bleeds, backstab bonus | Agility |
| Spear | reach, lunge | Agility / Strength |
| Bow | ranged, charge shot | Agility |
| Staff / Wand | boosts element moves, light M1 | Arcana |
| Scythe | sweeping AoE | Strength / Arcana |
| Gauntlets | combo-heavy fists | Strength / Agility |

**Sources:** NPC shops (Common–Rare), **boss drops** (Epic–Legendary, low % chance = grind), **crafting** at the forge (any rarity, needs boss materials), and **Dungeon chests**.

**Weapon Series** (Slayers 2 style): named gear lines that upgrade from +0 to +10 with materials, e.g. *Thornwood Series* (nature), *Emberforged Series* (fire), *Starsteel Series* (endgame). Each weapon has **Mastery** that unlocks 2 weapon skills.

**Enchanting:** reroll a random **affix** (e.g. "+8% crit", "lifesteal 3%") with Enchant Scrolls. Endless gear chase, and a reason to keep farming bosses.

---

## 5. Stats

On level up you get **3 points** to put into:

| Stat | Does |
|---|---|
| **Vitality** | Max HP |
| **Strength** | Melee / heavy weapon damage |
| **Agility** | Light weapons, bows, dash cooldown, flight speed |
| **Arcana** | Element move damage |
| **Spirit** | Mana pool + stamina (flight time!) |

Stat reset: a free one at level 100, then a Gem item or a Robux reset (common in the genre).

**Level cap at launch:** 300 (Island 1–3). Raised every big update. Aim for 2,000+ long term, like Blox Fruits.

---

## 6. World & Progression

```
Island 1  Mosswhisper Glade   (lvl 1–75)     Fairy forest. Starter shrines, tutorial boss: Thornback Boar King
Island 2  Ironroot Hollow     (lvl 75–175)   Dwarf mountain. Mines, forge unlocked, boss: The Rust Golem
Island 3  Sunspire Isles      (lvl 175–300)  Elf sky-islands (flight shines). Boss: Sky Serpent Vaelith
--- launch line ---
Island 4  Emberfang Caldera   Dragon volcano
Island 5  The Gloaming        Demon shadow realm
Island 6  Celestia            Angel city in the clouds
```

Each island has a **quest giver hub**, **3–5 mob areas**, **1–2 field bosses** (respawn timer, shared loot), a **hidden Shrine Trial**, and **1 dungeon entrance**.

### Activity loops
| Loop | Length | Reward |
|---|---|---|
| **Quests** ("kill X / collect Y") | 1–3 min | XP, gold, spin shards |
| **Field bosses** | 5 min respawn | weapon drops, materials |
| **Dungeons** (1–4 players, waves + boss, random modifiers) | 10–15 min | gear chests, Enchant Scrolls |
| **Raids** (party, high-level) | 20+ min | Mythic materials, Awakening IV items |
| **World bosses** (server-wide, timed) | hourly | Mythic element chance, event currency |
| **Fishing** | AFK-friendly | fish to sell, rare "Fae Pearls" (spin currency), fish cosmetics |
| **Mining** (Dwarf bonus) | chill | crafting ore |
| **Daily / weekly quests** | — | Kin Spins, gems |
| **Bestiary** (kill X of every mob) | long-term | permanent small stat buffs |

### Endless progression levers (so it never "ends")
Level cap raises · Race Awakening I–IV · Element Mastery (per element) · Weapon Mastery (per weapon) · Weapon Series +0→+10 · Enchant affix rerolls · Lineage rolls · Bestiary · Prestige/"Rebirth" at max level (keep cosmetics + get a permanent buff and a Rebirth aura).

---

## 7. Combat feel (THE most important part)

- **M1 combo** (4–5 hits) + **block** + **dash** + **5 element moves** + **2 weapon skills**.
- **Hit stop** (freeze 0.05s on hit), **camera shake**, **damage numbers**, **big readable VFX**, and a **sound on every hit**.
- **Server-authoritative hits.** Client plays the animation, server validates range and cooldown. This stops exploiters.
- **Mobile-first controls.** Most Roblox players are on mobile, so ability buttons must be big and thumb-friendly.
- **PvP:** off by default in the overworld, opt-in **PvP toggle** + **Arena**. Keeps casual players safe, gives sweats a place to go.

---

## 8. Monetization (fair-ish, genre-standard)

| Item | Type | Notes |
|---|---|---|
| **Kin Spins** (race reroll) | Developer product | Also earned free: dailies, codes, Fae Pearls from fishing. **Pity at 60 spins → guaranteed Legendary+.** Odds shown. |
| **Lineage Spins** | Developer product | Cheaper, also earned free |
| **2x XP** | Gamepass | Classic |
| **2x Drop Luck** | Gamepass | |
| **+1 Element Storage** | Gamepass | Store elements to swap |
| **Fast Flight** | Gamepass | |
| **Wing & Aura cosmetics** | Products / gamepasses | **Biggest long-term earner.** Every race shows them (fairy wings, dragon wings, halos, demon horns). Zero pay-to-win complaints. |
| **Private servers** | | Cheap; grinders love them |
| **Battle Pass ("Fae Pass")** | seasonal | Cosmetics + spins each season |

Rule: **never sell raw power that free players can't earn.** Everything that gives power can also be grinded. This keeps the community (and YouTubers) on your side.

---

## 9. Growth & Retention plan

- **Codes:** release them at like/favorite milestones (e.g. "5K likes = 50 spins"). This is the genre's main growth engine.
- **Discord + Trello/wiki at launch.** Every game in this genre has them; players expect it.
- **Update cadence:** small update every 1–2 weeks, a big numbered update ("Update 2: Emberfang Caldera") every 6–8 weeks with a countdown.
- **Day-one TikTok/Shorts content:** "rolling Mythic Angel", "Fairy Queen transformation", "Void element showcase". Design moves to look amazing in a 10-second clip.
- **Friends as testers:** run a closed test with them, watch what they do (not what they say), fix the first 10 minutes ruthlessly.

---

## 10. Build roadmap

### Phase 0 — Prototype (2–4 weeks)
- [ ] Movement: sprint, dash, double jump, **fairy flight with stamina**
- [ ] M1 combo with 1 sword, hit stop + VFX
- [ ] 2 elements (Fire, Nature) with 3 moves each
- [ ] Training dummies + 1 mob type
- **Goal:** combat is *fun* with nothing else in the game. If it's not, fix it before building anything else.

### Phase 1 — Vertical Slice / Friends Test (1–2 months)
- [ ] Data saving (ProfileStore)
- [ ] Race roll system, 5 races (Human, Elf, Dwarf, Fairy, Dragonkin) + spin UI with odds
- [ ] 4 Primal elements, 5 moves each, mastery
- [ ] Island 1 with quests, 2 bosses, Shrine Trials
- [ ] Stats + leveling to 75
- [ ] 6 weapons, drops
- **Goal:** do friends come back on day 2 without being asked?

### Phase 2 — Launch (2–3 months)
- [ ] Islands 2–3, all 9 races, 8+ elements, forge/crafting, first dungeon, fishing
- [ ] Awakening I–II, gamepasses, codes, Discord, trailer
- **Goal:** public launch. Advertise with sponsored ads, using Robux from your smaller games.

### Phase 3 — Live ops (forever)
- Islands 4+, raids, Awakening III–IV, element fusions, Rebirth, seasonal events, battle pass.

---

## 11. Tech notes (Roblox / Luau)

- **Rojo + Git** so this repo is the source of truth (`src/shared`, `src/server`, `src/client`).
- **Data:** ProfileStore (session locking prevents item dupes).
- **Config-driven content:** races, elements and weapons live in data modules (`src/shared/RaceData.luau`, `src/shared/ElementData.luau`). Adding a new race should mean adding a table entry, not new code.
- **Hit detection:** server-side `workspace:GetPartBoundsInBox` / shapecasts. Never trust the client for damage.
- **Remotes:** one validated "ActionRequest" remote with rate-limiting, rather than dozens of loose RemoteEvents.
- **Rolls on the server only.** The client only ever *displays* a roll result.
