--!strict
-- Server-only race rolling with a pity counter. Never roll on the client.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RaceData = require(ReplicatedStorage.Shared.RaceData)

local RaceRoller = {}

local rng = Random.new()

local function pickWeighted(pool: { string }): string
	local total = 0
	for _, name in pool do
		total += RaceData.Races[name].Weight
	end

	local roll = rng:NextNumber() * total
	for _, name in pool do
		roll -= RaceData.Races[name].Weight
		if roll <= 0 then
			return name
		end
	end
	return pool[#pool] -- floating-point fallback
end

local function isPityRarity(name: string): boolean
	local rarity = RaceData.Races[name].Rarity
	return RaceData.RarityOrder[rarity] >= RaceData.RarityOrder[RaceData.PityMinRarity]
end

-- pityCount is the number of spins since the player last got a Legendary or better.
-- Returns the rolled race and the new pity count to save to the player's profile.
function RaceRoller.Roll(pityCount: number): (string, number)
	local pool = {}
	local forcePity = pityCount + 1 >= RaceData.PityThreshold

	for name in RaceData.Races do
		if not forcePity or isPityRarity(name) then
			table.insert(pool, name)
		end
	end
	table.sort(pool) -- deterministic order, independent of table iteration

	local result = pickWeighted(pool)
	local newPity = if isPityRarity(result) then 0 else pityCount + 1
	return result, newPity
end

-- Odds as percentages, for the spin UI (paid random items must show odds).
function RaceRoller.GetOdds(): { [string]: number }
	local total = 0
	for _, race in RaceData.Races do
		total += race.Weight
	end

	local odds = {}
	for name, race in RaceData.Races do
		odds[name] = race.Weight / total * 100
	end
	return odds
end

return RaceRoller
