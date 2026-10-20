--!strict
-- Element definitions and two-element fusions (second slot unlocks at Race Awakening III).

export type Tier = "Primal" | "Greater" | "Ascended" | "Mythic"

export type Element = {
	Tier: Tier,
	Source: string,
	Moves: { string }, -- Z, X, C, V, F (F = ultimate)
}

local ElementData = {}

ElementData.MoveUnlockMastery = { 0, 25, 75, 150, 400 }

ElementData.Elements = {
	-- Primal: starting Shrine Trials on Island 1
	Earth = { Tier = "Primal", Source = "Shrine", Moves = { "Stone Fist", "Pillar Rise", "Boulder Toss", "Quake", "Titan's Wrath" } },
	Water = { Tier = "Primal", Source = "Shrine", Moves = { "Tide Lash", "Bubble Prison", "Riptide Dash", "Whirlpool", "Leviathan Wave" } },
	Fire = { Tier = "Primal", Source = "Shrine", Moves = { "Ember Shot", "Flame Dash", "Fire Pillar", "Inferno Ring", "Phoenix Dive" } },
	Air = { Tier = "Primal", Source = "Shrine", Moves = { "Gust Blade", "Updraft", "Cyclone Step", "Vacuum Pull", "Tempest" } },

	-- Greater: Island 2-3 trials, crystal stock
	Lightning = { Tier = "Greater", Source = "Trial", Moves = { "Spark Bolt", "Flash Step", "Chain Shock", "Thunder Cage", "Judgement Bolt" } },
	Nature = { Tier = "Greater", Source = "Trial", Moves = { "Thorn Whip", "Root Snare", "Petal Storm", "Ancient Treant", "World Tree" } },
	Ice = { Tier = "Greater", Source = "Trial", Moves = { "Frost Shard", "Ice Slide", "Glacier Wall", "Frozen Field", "Absolute Zero" } },
	Sand = { Tier = "Greater", Source = "Trial", Moves = { "Sand Blast", "Quicksand", "Dune Surf", "Sand Coffin", "Desert Pharaoh" } },

	-- Ascended: boss drops, rare stock
	Light = { Tier = "Ascended", Source = "Boss", Moves = { "Light Lance", "Blink", "Halo Burst", "Sanctuary", "Dawnbreaker" } },
	Dark = { Tier = "Ascended", Source = "Boss", Moves = { "Shadow Claw", "Umbral Step", "Abyss Grip", "Night Veil", "Black Sun" } },
	Crystal = { Tier = "Ascended", Source = "Boss", Moves = { "Shard Volley", "Prism Guard", "Crystal Spire", "Refraction", "Geode Colossus" } },
	Magma = { Tier = "Ascended", Source = "Boss", Moves = { "Lava Glob", "Magma Surf", "Eruption", "Molten Field", "Volcano Heart" } },
	Storm = { Tier = "Ascended", Source = "Boss", Moves = { "Squall Bolt", "Storm Rush", "Thunderhead", "Eye of the Storm", "Hurricane God" } },
	Bloom = { Tier = "Ascended", Source = "Boss", Moves = { "Pollen Burst", "Blossom Heal", "Vine Swing", "Garden of Life", "Eternal Spring" } },

	-- Mythic: world bosses, raids, events
	Starlight = { Tier = "Mythic", Source = "WorldBoss", Moves = { "Star Needle", "Comet Dash", "Constellation", "Meteor Rain", "Supernova" } },
	Void = { Tier = "Mythic", Source = "Raid", Moves = { "Null Orb", "Rift Step", "Gravity Well", "Erase", "Event Horizon" } },
	Moonfire = { Tier = "Mythic", Source = "Event", Moves = { "Lunar Flame", "Crescent Slash", "Moonwell", "Eclipse Brand", "Blood Moon" } },
	Time = { Tier = "Mythic", Source = "Raid", Moves = { "Haste", "Rewind", "Time Stop Field", "Echo Clones", "Chronobreak" } },
	Spirit = { Tier = "Mythic", Source = "WorldBoss", Moves = { "Wisp Swarm", "Soul Link", "Ancestor Call", "Spirit Form", "Great Spirit" } },
} :: { [string]: Element }

-- Key is the two element names sorted alphabetically and joined with "+".
ElementData.Fusions = {
	["Lightning+Water"] = { Name = "Storm Surge", Status = "Shock" },
	["Earth+Fire"] = { Name = "Magma Burst", Status = "Burn" },
	["Air+Water"] = { Name = "Blizzard", Status = "Freeze" },
	["Air+Earth"] = { Name = "Sandstorm", Status = "Blind" },
	["Light+Nature"] = { Name = "Sunbloom", Status = "AreaHeal" },
	["Dark+Light"] = { Name = "Eclipse", Status = "SelfDamageBurst" },
	["Air+Fire"] = { Name = "Wildfire", Status = "SpreadingBurn" },
	["Dark+Nature"] = { Name = "Blight", Status = "Poison" },
} :: { [string]: { Name: string, Status: string } }

function ElementData.GetFusion(a: string, b: string): { Name: string, Status: string }?
	local key = if a < b then `{a}+{b}` else `{b}+{a}`
	return ElementData.Fusions[key]
end

return ElementData
