--[[
	@class ClientMain
]]
local loader = game:GetService("ReplicatedStorage"):WaitForChild("PlayerStatsExampleNevermore"):WaitForChild("loader")
local require = require(loader).bootstrapGame(loader.Parent)

local serviceBag = require("ServiceBag").new()
serviceBag:GetService(require("PlayerStatsExampleNevermoreServiceClient"))
serviceBag:Init()
serviceBag:Start()