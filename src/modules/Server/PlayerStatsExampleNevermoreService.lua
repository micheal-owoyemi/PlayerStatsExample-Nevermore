--[=[
	@class PlayerStatsExampleNevermoreService
]=]

local require = require(script.Parent.loader).load(script)

local PlayerStatsExampleNevermoreService = {}
PlayerStatsExampleNevermoreService.ServiceName = "PlayerStatsExampleNevermoreService"

function PlayerStatsExampleNevermoreService:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")

	-- Internal
	self._serviceBag:GetService(require("PlayerStatsExampleNevermoreTranslator"))
end


function PlayerStatsExampleNevermoreService:Start()
	print("PlayerStatsExampleNevermoreService started")
end

return PlayerStatsExampleNevermoreService