local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function highlightPlayer(player)
  local character = player.Character
  if character then
    local humanoid = character:WaitForChild("Humanoid")
    local head = humanoid:WaitForChild("Head")

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Parent = head
    billboardGui.Size = UDim2.new(1, 0, 1, 0)
    billboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.BackgroundTransparency = 1
    textLabel.Text = player.Name
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
  end
end

local function updateHighlights()
  for _, player in ipairs(Players:GetPlayers()) do
    highlightPlayer(player)
  end
end

Players.PlayerAdded:Connect(function(player)
  highlightPlayer(player)
end)

local refreshRate = 1 -- Refresh every 1 second
RunService.Heartbeat:Connect(function()
  updateHighlights()
end)
