--[=[
	@class PlayerStatsExampleNevermoreServiceClient
]=]

local require = require(script.Parent.loader).load(script)
local Blend = require("Blend")
local Maid = require("Maid")

local statObservables = {
    Points = Blend.State(2),
    Assists = Blend.State(0),
    Spikes = Blend.State(6),
    Blocks = Blend.State(0),
    Sets = Blend.State(1),
    Dives = Blend.State(0),
    Recieves = Blend.State(7),
}

local PlayerStatsExampleNevermoreServiceClient = {}
PlayerStatsExampleNevermoreServiceClient.ServiceName = "PlayerStatsExampleNevermoreServiceClient"

function PlayerStatsExampleNevermoreServiceClient:Init(serviceBag)
	assert(not self._serviceBag, "Already initialized")
	self._serviceBag = assert(serviceBag, "No serviceBag")
	self._maid = Maid.new()

	-- Internal
	self._serviceBag:GetService(require("PlayerStatsExampleNevermoreTranslator"))
end

function PlayerStatsExampleNevermoreServiceClient:Start()
	print("PlayerStatsExampleNevermoreServiceClient started")
	self:InitStatsUI()
end

function PlayerStatsExampleNevermoreServiceClient:InitStatsUI()
	local statsUI = self:ConstructStatsUI()

	self._maid:GiveTask(statsUI:Subscribe(function(gui)
		self:PopulateStatsUI(gui.Container.Background.StatsContainer, statObservables)
	end))
end

function PlayerStatsExampleNevermoreServiceClient:ConstructStatsUI()
	local render = Blend.New "ScreenGui" {
		Parent = game.Players.LocalPlayer.PlayerGui,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		Name = "PlayerStatsGUI",
	
		Blend.New "Frame" {
			Size = UDim2.new(0.25, 0, 0.5, 0),
			Position = UDim2.new(0.1, 0, 0.25, 0),
			BackgroundTransparency = 1,
			Name = "Container",

			Blend.New "Frame" {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Name = "Background",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),

				Blend.New "UIStroke" {
					Thickness = 4,
					Color = Color3.fromRGB(0, 0, 0),
				},

				Blend.New "TextLabel" {
					Size = UDim2.new(1, 0, 0.1, 0),
					Position = UDim2.new(0, 0, 0, 0),
					Name = "Title",
					BackgroundTransparency = 1,
					Text = "STATS",
					TextColor3 = Color3.fromRGB(0, 0, 0),
					TextSize = 40,
					Font = Enum.Font.SourceSansBold,
				},

				Blend.New "ScrollingFrame" {
					Size = UDim2.new(1, 0, 0.9, 0),
					Position = UDim2.new(0, 0, 0.1, 0),
					Name = "StatsContainer",
					BackgroundTransparency = 1,
					ScrollBarThickness = 8,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,

					Blend.New "UIListLayout" {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 20),
					},
					
				},
			}
		}
	}

	return render
end

function PlayerStatsExampleNevermoreServiceClient:ConstructStatCell(key, value)
	if not (key and value) then
		return
	end

	local statCellRender = Blend.New "TextButton" {
		Size = UDim2.new(0.5, 0, 0.1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Name = key.." StatCell",
		BackgroundTransparency = 1,
		Text = key .. ": " .. value,
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 20,
		Font = Enum.Font.SourceSans,
	}

	print("Constructed stat cell", key, value)
	return statCellRender
end

function PlayerStatsExampleNevermoreServiceClient:PopulateStatsUI(guiContainer: ScrollingFrame, stats: table)
	if not (guiContainer and stats) then
		return
	end

	for key, stat in (stats) do
		local statFrame = self:ConstructStatCell(key, stat.Value)

		self._maid:GiveTask(statFrame:Subscribe(function(gui)
			gui.Parent = guiContainer
		end))
	end
end

return PlayerStatsExampleNevermoreServiceClient