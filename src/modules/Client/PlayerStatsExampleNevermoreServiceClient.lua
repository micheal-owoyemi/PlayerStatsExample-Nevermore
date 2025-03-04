--[=[
	@class PlayerStatsExampleNevermoreServiceClient
]=]

local require = require(script.Parent.loader).load(script)

local PlayerStatsExampleNevermoreServiceClient = {}
PlayerStatsExampleNevermoreServiceClient.ServiceName = "PlayerStatsExampleNevermoreServiceClient"

function PlayerStatsExampleNevermoreServiceClient:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")

	-- External
	self._serviceBag:GetService(require("CmdrServiceClient"))

	-- Internal
	self._serviceBag:GetService(require("PlayerStatsExampleNevermoreTranslator"))
end

function PlayerStatsExampleNevermoreServiceClient:Start()
	print("PlayerStatsExampleNevermoreServiceClient started")
end

return PlayerStatsExampleNevermoreServiceClient