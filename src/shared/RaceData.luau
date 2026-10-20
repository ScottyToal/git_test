--!strict
-- Race definitions. Adding a race = adding an entry here.
-- Weights are percentages and should sum to 100 (shown to players as odds).

export type Rarity = "Common" | "Uncommon" | "Rare" | "Legendary" | "Mythic"

export type Race = {
	DisplayName: string,
	Rarity: Rarity,
	Weight: number,
	Movement: string,
	Passive: string,
	AffinityElements: { string },
	StatMultipliers: { [string]: number },
}

local RaceData = {}

RaceData.RarityOrder = {
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Legendary = 4,
	Mythic = 5,
} :: { [Rarity]: number }

RaceData.PityThreshold = 60 -- spins without a Legendary+ before one is guaranteed
RaceData.PityMinRarity = "Legendary" :: Rarity
RaceData.AffinityBonus = 0.15

RaceData.Races = {
	Human = {
		DisplayName = "Human",
		Rarity = "Common",
		Weight = 30,
		Movement = "WallClimb",
		Passive = "Adaptable", -- +10% XP, bonus stat point every 10 levels
		AffinityElements = {},
		StatMultipliers = {},
	},
	Gnome = {
		DisplayName = "Gnome",
		Rarity = "Common",
		Weight = 22,
		Movement = "BurrowDash",
		Passive = "LuckyTinkerer", -- +15% drop luck
		AffinityElements = { "Earth", "Nature" },
		StatMultipliers = { Vitality = 0.9 },
	},
	Dwarf = {
		DisplayName = "Dwarf",
		Rarity = "Uncommon",
		Weight = 16,
		Movement = "GroundPound",
		Passive = "Forgeborn", -- better crafting rolls, +20% ore yield
		AffinityElements = { "Earth", "Magma" },
		StatMultipliers = { Vitality = 1.15, Strength = 1.1, Agility = 0.9 },
	},
	Elf = {
		DisplayName = "Elf",
		Rarity = "Uncommon",
		Weight = 16,
		Movement = "DoubleJumpDash",
		Passive = "KeenSenses", -- +crit, bow/spear bonus, reveals hidden chests
		AffinityElements = { "Nature", "Air" },
		StatMultipliers = { Agility = 1.15, Vitality = 0.95 },
	},
	Fairy = {
		DisplayName = "Fairy",
		Rarity = "Rare",
		Weight = 7,
		Movement = "Flight",
		Passive = "FaeGrace", -- dodge i-frames, small hitbox
		AffinityElements = { "Nature", "Light" },
		StatMultipliers = { Arcana = 1.15, Spirit = 1.1, Vitality = 0.85 },
	},
	Golem = {
		DisplayName = "Golem",
		Rarity = "Rare",
		Weight = 6,
		Movement = "Unstoppable", -- immune to knockback
		Passive = "Stoneheart", -- damage reduction
		AffinityElements = { "Earth", "Crystal" },
		StatMultipliers = { Vitality = 1.3, Agility = 0.8 },
	},
	Dragonkin = {
		DisplayName = "Dragonkin",
		Rarity = "Legendary",
		Weight = 2.2,
		Movement = "Glide", -- upgrades to Flight at Awakening II
		Passive = "DragonHeart", -- breath attack, fire resistance
		AffinityElements = { "Fire", "Storm" },
		StatMultipliers = { Strength = 1.15, Vitality = 1.1 },
	},
	Angel = {
		DisplayName = "Angel",
		Rarity = "Mythic",
		Weight = 0.4,
		Movement = "FlightHover",
		Passive = "Radiance", -- regen, one revive per dungeon
		AffinityElements = { "Light", "Air" },
		StatMultipliers = { Arcana = 1.15, Spirit = 1.15 },
	},
	Demon = {
		DisplayName = "Demon",
		Rarity = "Mythic",
		Weight = 0.4,
		Movement = "ShadowStep",
		Passive = "Hellbound", -- lifesteal, stronger at low HP
		AffinityElements = { "Dark", "Fire" },
		StatMultipliers = { Strength = 1.15, Arcana = 1.1, Vitality = 0.95 },
	},
} :: { [string]: Race }

return RaceData
