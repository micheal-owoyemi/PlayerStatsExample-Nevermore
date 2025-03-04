--[[
	@class ServerMain
]]
local ServerScriptService = game:GetService("ServerScriptService")

local loader = ServerScriptService.PlayerStatsExampleNevermore:FindFirstChild("LoaderUtils", true).Parent
local require = require(loader).bootstrapGame(ServerScriptService.PlayerStatsExampleNevermore)

local serviceBag = require("ServiceBag").new()
serviceBag:GetService(require("PlayerStatsExampleNevermoreService"))
serviceBag:Init()
serviceBag:Start()