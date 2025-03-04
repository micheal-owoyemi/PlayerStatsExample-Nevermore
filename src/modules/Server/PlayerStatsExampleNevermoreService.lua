--[=[
	@class PlayerStatsExampleNevermoreService
]=]

local require = require(script.Parent.loader).load(script)
local Blend = require("Blend")

local PlayerStatsExampleNevermoreService = {}
PlayerStatsExampleNevermoreService.ServiceName = "PlayerStatsExampleNevermoreService"

function PlayerStatsExampleNevermoreService:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")

	-- External
	self._serviceBag:GetService(require("CmdrService"))

	-- Internal
	self._serviceBag:GetService(require("PlayerStatsExampleNevermoreTranslator"))
end


function PlayerStatsExampleNevermoreService:Start()
	print("PlayerStatsExampleNevermoreService started")
end

function PlayerStatsExampleNevermoreService:CreateStatBlendObject(observableStatMap)
    assert(type(observableStatMap) == "table", "Expected observableStatMap to be a table")
    local statBinding = Blend.Object(observableStatMap)
    return statBinding
end

return PlayerStatsExampleNevermoreService