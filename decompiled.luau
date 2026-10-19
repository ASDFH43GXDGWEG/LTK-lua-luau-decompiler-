

if not LPH_OBFUSCATED then
    function LPH_JIT(...) return ... end -- line: 4
    function LPH_CRASH() return error(debug.traceback()) end -- line: 5
    function LPH_ENCNUM(...) return ... end -- line: 6
    function LPH_ENCSTR(...) return ... end -- line: 7
    function LPH_JIT_MAX(...) return ... end -- line: 8
    function LPH_HOOK_FIX(...) return ... end -- line: 9
    function LPH_JIT_ULTRA(...) return ... end -- line: 10
    function LPH_NO_UPVALUES(p1) return function(...) -- line: 11, upvalues: p1 -- line: 11
            return p1(...)
        end
    end
    function LPH_NO_VIRTUALIZE(...) -- line: 12
        return ...
    end
end
if not game:IsLoaded() then
    while not game:IsLoaded() do
        task.wait()
    end
end

if getgenv()._CASHFARM_EXECUTED then
    return
end
getgenv()._CASHFARM_EXECUTED = true




local v1 = setmetatable({}, {
    __index = function(_, p2) -- line: 34
        return game:GetService(p2)
    end
})

local _ = v1.Teams
local Players = v1.Players
local CoreGui = v1.CoreGui
local Workspace = v1.Workspace
local Lighting = v1.Lighting
local StarterGui = v1.StarterGui
local RunService = v1.RunService
local HttpService = v1.HttpService
local _ = v1.VirtualUser
local TweenService = v1.TweenService
local TeleportService = v1.TeleportService
local _ = v1.UserInputService
local TextChatService = v1.TextChatService
local ReplicatedStorage = v1.ReplicatedStorage
local CollectionService = v1.CollectionService
local _ = v1.VirtualInputManager



local b2 = true
local LocalPlayer = Players.LocalPlayer
local Folder = LocalPlayer:WaitForChild("Folder")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local leaderstats = LocalPlayer:WaitForChild("leaderstats")
local function f3() return PlayerGui.MainGui.CellTime.Visible or Folder:FindFirstChild("Cuffed") end -- line: 63, upvalues: PlayerGui, Folder
local CurrentCamera = Workspace.CurrentCamera
local u4
local Humanoid
local HumanoidRootPart
local u5
local b6 = false
local TaskWait = task.wait
local TaskDelay = task.delay
local TaskSpawn = task.spawn
local MathFloor = math.floor
local CFrameNew = CFrame.new
local Vector3New = Vector3.new
local TableRemove = table.remove
local TableInsert = table.insert
local TableFind = table.find
local StringFind = string.find
local raycastParams = RaycastParams.new()
raycastParams.IgnoreWater = true
raycastParams.FilterType = Enum.RaycastFilterType.Exclude



local t7 = {
    UI = require(ReplicatedStorage.Module.UI),
    NPC = require(ReplicatedStorage.NPC.NPC),
    Store = require(ReplicatedStorage.App.store),
    RayCast = require(ReplicatedStorage.Module.RayCast),
    GunItem = require(ReplicatedStorage.Game.Item.Gun),
    TagUtils = require(ReplicatedStorage.Tag.TagUtils),
    GunShopUI = require(ReplicatedStorage.Game.GunShop.GunShopUI),
    ItemSystem = require(ReplicatedStorage.Game.ItemSystem.ItemSystem),
    Notification = require(ReplicatedStorage.Game.Notification),
    SafesConsts = require(ReplicatedStorage.Safes.SafesConsts),
    TeamChooseUI = require(ReplicatedStorage.TeamSelect.TeamChooseUI),
    VehicleUtils = require(ReplicatedStorage.Vehicle.VehicleUtils),
    GunShopUtils = require(ReplicatedStorage.Game.GunShop.GunShopUtils),
    RobberyConsts = require(ReplicatedStorage.Robbery.RobberyConsts),
    CharacterUtil = require(ReplicatedStorage.Game.CharacterUtil),
    BulletEmitter = require(ReplicatedStorage.Game.ItemSystem.BulletEmitter),
    InventoryItem = require(ReplicatedStorage.Inventory.InventoryItem),
    MansionRobberyUtils = require(ReplicatedStorage.MansionRobbery.MansionRobberyUtils),
    BossNPCConsts = require(ReplicatedStorage.MansionRobbery.BossNPCConsts)
}

local RobberyState = ReplicatedStorage:WaitForChild("RobberyState")
local GetLocalVehicleModel = t7.VehicleUtils.GetLocalVehicleModel
local Specs = t7.UI.CircleAction.Specs
local new = t7.Notification.new
local RayIgnoreNonCollideWithIgnoreList = t7.RayCast.RayIgnoreNonCollideWithIgnoreList
local new_1 = t7.NPC.new



local function GetDirectory() -- line: 117


    if not isfolder("Cashfarm") then
        makefolder("Cashfarm")
    end

    return "Cashfarm"
end

local function GetHeader(p1) -- line: 127, upvalues: GetDirectory
    local s1 = GetDirectory() .. "/" .. p1

    if not isfolder(s1) then
        makefolder(s1)
    end

    return s1
end

local function SaveFile(p1, p2) -- line: 137
    local ok, _ = pcall(writefile, p1, p2)

    return ok
end

local function LoadFile(p1, p2) -- line: 143
    local ok, err = pcall(readfile, p1 .. "\\" .. p2)

    return ok and err or nil
end



local t8 = {}
t8.SmallServers = true
t8.CollectCash = true
t8.FpsBooster = false
t8.ChatSpam = false
t8.CargoShip = true
t8.Airdrop = true
t8.Mansion = true
t8[LocalPlayer.Name] = 0
t8.RobRedCrates = true
t8.RobBlueCrates = true
t8.RobBrownCrates = true
t8.AutoOpenSafes = true
t8.LogWebhook = false
t8.LogHypers = false
t8.WebhookUrl = false
t8.KillAura = false
t8.KillAuraDistance = 600
t8.FlightSpeed = 175


local v9 = GetHeader("Autocrate")
local v10 = LoadFile(v9, "Config")

if v10 then
    local ok, err = pcall(function() -- line: 176, upvalues: HttpService, v10
        return HttpService:JSONDecode(v10)
    end)

    if ok then
        for k, v in err do
            t8[k] = v
        end
    end
end

local function SaveConfig() -- line: 187, upvalues: SaveFile, v9, HttpService, t8
    local ok, _ = pcall(SaveFile, v9 .. "\\Config", HttpService:JSONEncode(t8))

    return ok
end



if not getgenv()._StartingCash then
    getgenv()._StartingCash = leaderstats.Money.Value
end

if not getgenv()._StartingTime then
    getgenv()._StartingTime = tick()
end



local b11 = true
local b12 = false
local b13 = false
local s14 = ""

local u15, jSONDecode

local function ServerSwitch() -- line: 212, upvalues: b12, b11, TaskWait, b6, GetHeader, SaveFile, s14, LocalPlayer, b13, jSONDecode, HttpService, t8, u15, TeleportService
    if b12 then return end
    if not b11 then repeat TaskWait(0.01) until b11 end

    b12 = true
    b6 = true

    local s1 = GetHeader("Autocrate") .. "/Script.lua"
    SaveFile(s1, game:HttpGet("https://cashfarm.cc/Autocrate.lua"))

    if LPH_OBFUSCATED then
        s14 = "\t\t\tgetgenv()._StartingCash = " .. getgenv()._StartingCash .. "\t\t\tgetgenv()._StartingTime = " .. getgenv()._StartingTime .. [[

			if not game:IsLoaded() then
				while not game:IsLoaded() do
					task.wait()
				end
			end

           	local Success, _ = pcall(function()
		 		loadfile("]] .. tostring(s1) .. [[
")()
			end)

			if not Success then
				loadstring(game:HttpGet("https://cashfarm.cc/Autocrate.lua"))()
			end
        ]]
    else

        s14 = [[
 
			getgenv()._StartingCash = ]] .. getgenv()._StartingCash .. "\t\t\tgetgenv()._StartingTime = " .. getgenv()._StartingTime .. [[

			if not game:IsLoaded() then
				while not game:IsLoaded() do
					task.wait()
				end
			end
		]]
    end

    queue_on_teleport(s14)

    LocalPlayer.OnTeleport:Connect(function(p1) -- line: 256, upvalues: b13
        if p1 == Enum.TeleportState.Started then
            b13 = true
        end
    end)

    while not b13 do
        pcall(function() -- line: 263, upvalues: jSONDecode, HttpService, t8, u15, TeleportService, LocalPlayer, b13, TaskWait
            repeat
                jSONDecode = HttpService:JSONDecode(game:HttpGet("https://cdn.cashfarm.cc/servers" .. (t8.SmallServers and "" or "?type=big")))
                u15 = jSONDecode.Data[math.random(1, #jSONDecode.Data)]
            until jSONDecode and jSONDecode.Success and u15 and u15.playing < u15.maxPlayers - 2 and u15.id ~= game.JobId

            pcall(function() -- line: 269, upvalues: TeleportService, u15, LocalPlayer
                TeleportService:TeleportToPlaceInstance(game.PlaceId, u15.id, LocalPlayer)
                TeleportService.TeleportInitFailed:Wait()
            end)

            if b13 then
                TaskWait(math.huge)
            end
        end)
    end
end

TaskDelay(300, ServerSwitch)

local b16 = false

TaskDelay(10, function() -- line: 285, upvalues: b16, ServerSwitch
    if not b16 then
        ServerSwitch()
    end
end)

TaskSpawn(function() -- line: 291, upvalues: CoreGui, ServerSwitch, TaskWait






    while not pcall(function() -- line: 292, upvalues: CoreGui, ServerSwitch
        CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child) -- line: 293, upvalues: ServerSwitch
            if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
                ServerSwitch()
            end
        end)
    end) do
        TaskWait(0.1)
    end
end)
local function FormatMoney(p1) -- line: 305
    local parts = tostring(p1):split("")
    if #parts >= 10 then
        return parts[1] .. "." .. parts[2] .. "B"
    elseif #parts == 9 then
        return parts[1] .. parts[2] .. parts[3] .. "M"
    elseif #parts == 8 then
        return parts[1] .. parts[2] .. "." .. parts[3] .. "M"
    elseif #parts == 7 then
        return parts[1] .. "." .. parts[2] .. "M"
    elseif #parts == 6 then
        return parts[1] .. parts[2] .. parts[3] .. "k"
    elseif #parts == 5 then
        return parts[1] .. parts[2] .. "." .. parts[3] .. "k"
    elseif #parts == 4 and #parts[2] == 0 then
        return parts[1] .. "k"
    elseif #parts == 4 then
        return parts[1] .. "." .. parts[2] .. "k"
    else return p1
    end
end
local function FormatTime(p1) -- line: 329, upvalues: MathFloor
    local mathFloor = MathFloor(p1 / 3600)
    MathFloor(mathFloor % 24)
    local mathFloor_1 = MathFloor(p1 % 3600 / 60)
    local mathFloor_2 = MathFloor(p1 % 60)

    return mathFloor .. "h/" .. mathFloor_1 .. "m/" .. mathFloor_2 .. "s"
end




local bindable_event = Instance.new("BindableEvent")

local t17 = {}
t17["Cargo Ship"] = {
    ID = t7.RobberyConsts.ENUM_ROBBERY.CARGO_SHIP,
    Open = false,
    Status = 3,
    Robbed = false,
    Callback = function() -- line: 349
    end
}
t17.Mansion = {
    ID = t7.RobberyConsts.ENUM_ROBBERY.MANSION,
    Open = false,
    Status = 3,
    Robbed = false,
    Callback = function() -- line: 357
    end
}
t17.Airdrop = {
    Callback = function() -- line: 361
    end
}

local t18 = {
    Fire = function(self, ...) -- line: 366, upvalues: bindable_event
        bindable_event:Fire(...)
    end
}
local function Connect(_, ...) -- line: 370, upvalues: bindable_event
    bindable_event.Event:Connect(...)
end
t18.Connect = Connect
local v19 = setmetatable(t17, {
    __index = {
        OnOpen = t18
    }
})
for _, child in RobberyState:GetChildren() do
    for k_1, v_1 in v19 do
        if child.Name == tostring(v_1.ID) then
            v_1.Status = child.Value if k_1 == "Mansion" then
                v_1.Open = child.Value == 1
            else
                v_1.Open = child.Value ~= 3
            end

            if not v_1.Open then
                v_1.Robbed = false
            end

            v19.OnOpen:Fire(k_1, v_1.Open)

            if not v_1.Open then
                v_1.Robbed = false
            end

            child:GetPropertyChangedSignal("Value"):Connect(function() -- line: 398, upvalues: v_1, child, k_1, v19
                v_1.Status = child.Value

                if k_1 == "Mansion" then
                    v_1.Open = child.Value == 1
                else
                    v_1.Open = child.Value ~= 3
                end

                v19.OnOpen:Fire(k_1, v_1.Open)

                if not v_1.Open then
                    v_1.Robbed = false
                end
            end)
            break
        end
    end
end


RobberyState.ChildAdded:Connect(function(child) -- line: 419, upvalues: v19
    for k, v in v19 do
        if child.Name == tostring(v.ID) then
            v.Status = child.Value

            if k == "Mansion" then
                v.Open = child.Value == 1
            else
                v.Open = child.Value ~= 3
            end

            if not v.Open then
                v.Robbed = false
            end

            child:GetPropertyChangedSignal("Value"):Connect(function() -- line: 434, upvalues: v, child, k
                v.Status = child.Value

                if k == "Mansion" then
                    v.Open = child.Value == 1
                else
                    v.Open = child.Value ~= 3
                end

                if not v.Open then
                    v.Robbed = false
                end
            end)

            return
        end
    end
end)

local function GetAirdropModel() -- line: 453, upvalues: Workspace, t8
    for _, child in Workspace:GetChildren() do
        if child:IsA("Model") and child.Name == "Drop" and not child:GetAttribute("BriefcaseCollected") then
            if t8.RobRedCrates and child.Top.BrickColor == BrickColor.new("Dark red") then
                return child
            elseif t8.RobBlueCrates and child.Top.BrickColor == BrickColor.new("Storm blue") then
                return child
            elseif t8.RobBrownCrates and child.Top.BrickColor == BrickColor.new("Dark orange") then
                return child
            end
        end
    end



    return nil
end




local v20 = loadstring(game:HttpGet("https://cashfarm.cc/Gui.lua"))()

local gui = v20:CreateGui("Cashfarm Autocrate [PAID]", {
    Theme = Color3.fromRGB(73, 255, 170),
    Theme2 = Color3.fromRGB(27, 95, 62)
})

local default = gui:CreateTab("Main"):SetDefault()
local tab = gui:CreateTab("Robberies")
local tab_1 = gui:CreateTab("Settings")
local tab_2 = gui:CreateTab("Credits")
do
    local section = default:CreateSection("Main")

    section:CreateToggle("Enabled", function(p1) -- line: 488, upvalues: b2
        b2 = p1
    end, {Enabled = b2})

    section:CreateToggle("Small Servers", function(smallServers) -- line: 492, upvalues: t8, SaveConfig
        t8.SmallServers = smallServers
        SaveConfig()
    end, {Enabled = t8.SmallServers})

    section:CreateToggle("Collect Cash", function(collectCash) -- line: 497, upvalues: t8, SaveConfig
        t8.CollectCash = collectCash
        SaveConfig()
    end, {Enabled = t8.CollectCash})

    section:CreateToggle("Fps Booster", function(fpsBooster) -- line: 502, upvalues: t8, SaveConfig
        t8.FpsBooster = fpsBooster
        SaveConfig()
    end, {Enabled = t8.FpsBooster})

    section:CreateToggle("Chat Spam", function(chatSpam) -- line: 507, upvalues: t8, SaveConfig
        t8.ChatSpam = chatSpam
        SaveConfig()
    end, {Enabled = t8.ChatSpam})
end
local section_1 = default:CreateSection("Stats", "Right")

local textlabel = section_1:CreateTextlabel("Loading..")

section_1:CreateDividor()

local textlabel_1 = section_1:CreateTextlabel("Earnings: $0")
local textlabel_2 = section_1:CreateTextlabel("Time: 0h/0m/0s")
local textlabel_3 = section_1:CreateTextlabel("Hourly: $0")

local section_2 = tab:CreateSection("Status")

local textlabel_4 = section_2:CreateTextlabel("Cargo Ship")
textlabel_4:SetColor(Color3.new(255, 0, 0))

local textlabel_5 = section_2:CreateTextlabel("Airdrop")
textlabel_5:SetColor(Color3.new(255, 0, 0))

local textlabel_6 = section_2:CreateTextlabel("Mansion")
textlabel_6:SetColor(Color3.new(255, 0, 0))
do
    local section_3 = tab:CreateSection("Toggles", "Right")

    section_3:CreateToggle("Cargo Ship", function(cargoShip) -- line: 535, upvalues: t8, SaveConfig
        t8.CargoShip = cargoShip
        SaveConfig()
    end, {Enabled = t8.CargoShip})

    section_3:CreateToggle("Airdrop", function(airdrop) -- line: 540, upvalues: t8, SaveConfig
        t8.Airdrop = airdrop
        SaveConfig()
    end, {Enabled = t8.Airdrop})

    section_3:CreateToggle("Mansion", function(mansion) -- line: 545, upvalues: t8, SaveConfig
        t8.Mansion = mansion
        SaveConfig()
    end, {Enabled = t8.Mansion})
end
do local section_4 = tab:CreateSection("Airdrop Rarities")

    section_4:CreateToggle("Rob Red Crates", function(robRedCrates) -- line: 552, upvalues: t8, SaveConfig
        t8.RobRedCrates = robRedCrates
        SaveConfig()
    end, {Enabled = t8.RobRedCrates})

    section_4:CreateToggle("Rob Blue Crates", function(robBlueCrates) -- line: 557, upvalues: t8, SaveConfig
        t8.RobBlueCrates = robBlueCrates
        SaveConfig()
    end, {Enabled = t8.RobBlueCrates})

    section_4:CreateToggle("Rob Brown Crates", function(robBrownCrates) -- line: 562, upvalues: t8, SaveConfig
        t8.RobBrownCrates = robBrownCrates
        SaveConfig()
    end, {Enabled = t8.RobBrownCrates})
end
local section_5 = tab:CreateSection("Mansion Invites", "Right")
local textlabel_7 = section_5:CreateTextlabel("Invites: 0")
do
    local section_6 = tab_1:CreateSection("Safes")

    section_6:CreateToggle("Auto Open Safes", function(autoOpenSafes) -- line: 572, upvalues: t8, SaveConfig
        t8.AutoOpenSafes = autoOpenSafes
        SaveConfig()
    end, {Enabled = t8.AutoOpenSafes})

    section_6:CreateButton("Open All Safes", function() -- line: 577, upvalues: t7, ReplicatedStorage
        local count = #t7.Store._state.safesInventoryItems

        if count ~= 0 then
            task.spawn(function() -- line: 581, upvalues: count, t7, ReplicatedStorage
                for _ = 1, count do
                    local safesInventoryItem = t7.Store._state.safesInventoryItems[1]

                    ReplicatedStorage[t7.SafesConsts.SAFE_OPEN_REMOTE_NAME]:FireServer(safesInventoryItem.itemOwnedId)
                    task.wait(3)
                end
            end)
        end
    end)
end
do local section_7 = tab_1:CreateSection("Webhook", "Right")

    section_7:CreateToggle("Log Webhook", function(logWebhook) -- line: 594, upvalues: t8, SaveConfig
        t8.LogWebhook = logWebhook
        SaveConfig()
    end, {Enabled = t8.LogWebhook})

    section_7:CreateToggle("Log Hypers", function(logHypers) -- line: 599, upvalues: t8, SaveConfig
        t8.LogHypers = logHypers
        SaveConfig()
    end, {Enabled = t8.LogHypers})

    section_7:CreateTextbox("Webhook Url", function(webhookUrl) -- line: 604, upvalues: t8, SaveConfig
        t8.WebhookUrl = webhookUrl
        SaveConfig()
    end, {Text = t8.WebhookUrl or "Webhook Url"}, {RememberLastText = true})
end
do local section_8 = tab_1:CreateSection("Kill Aura")

    section_8:CreateToggle("Kill Aura", function(killAura) -- line: 611, upvalues: t8, SaveConfig
        t8.KillAura = killAura
        SaveConfig()
    end, {Enabled = t8.KillAura})

    section_8:CreateSlider("Kill Distance", function(killAuraDistance) -- line: 616, upvalues: t8, SaveConfig
        t8.KillAuraDistance = killAuraDistance
        SaveConfig()
    end, {Min = 100, Max = 1000, Value = t8.KillAuraDistance})
end
do local section_9 = tab_1:CreateSection("Speeds", "Right")

    section_9:CreateSlider("Flight Speed", function(flightSpeed) -- line: 623, upvalues: t8, SaveConfig
        t8.FlightSpeed = flightSpeed
        SaveConfig()
    end, {Min = 155, Max = 175, Value = t8.FlightSpeed})
end
do local section_10 = tab_2:CreateSection("Credits")

    section_10:CreateTextlabel("tempiscold - Scripting")
    section_10:CreateTextlabel("https://cashfarm.cc")
    section_10:CreateTextlabel("discord.gg/cashfarm")
end
local WaitForReward = tab_2:CreateSection("UI Controls", "Right")

WaitForReward:CreateKeybind("Toggle Gui", gui.Toggle, {Bind = Enum.KeyCode.RightShift})

function UpdateStatus(p1) -- line: 638, upvalues: TaskSpawn, textlabel, TaskWait
    TaskSpawn(function() -- line: 639, upvalues: textlabel, p1, TaskWait
        local function StatusFix() -- line: 640, upvalues: textlabel, p1
            textlabel:Set(tostring(p1))
        end

        while not pcall(StatusFix) do
            TaskWait(0.01)
        end
    end)
end

function UpdateRobberyStats() -- line: 650, upvalues: TaskSpawn, textlabel_4, v19, textlabel_5, GetAirdropModel, textlabel_6, TaskWait
    TaskSpawn(function() -- line: 651, upvalues: textlabel_4, v19, textlabel_5, GetAirdropModel, textlabel_6, TaskWait
        local function StatusFix() -- line: 652, upvalues: textlabel_4, v19, textlabel_5, GetAirdropModel, textlabel_6
            textlabel_4:SetColor(v19["Cargo Ship"].Open and Color3.new(0, 255, 0) or Color3.new(255, 0, 0))
            textlabel_5:SetColor(GetAirdropModel() and Color3.new(0, 255, 0) or Color3.new(255, 0, 0))
            textlabel_6:SetColor(v19.Mansion.Open and Color3.new(0, 255, 0) or Color3.new(255, 0, 0))
        end

        while not pcall(StatusFix) do
            TaskWait(0.01)
        end
    end)
end

function UpdateStats(p1, p2) -- line: 664, upvalues: TaskSpawn, textlabel_2, FormatTime, textlabel_1, FormatMoney, TaskWait, textlabel_3, MathFloor
    TaskSpawn(function() -- line: 665, upvalues: textlabel_2, FormatTime, p2, textlabel_1, FormatMoney, p1, TaskWait
        local function FixStats() -- line: 666, upvalues: textlabel_2, FormatTime, p2, textlabel_1, FormatMoney, p1
            textlabel_2:Set("Time: " .. FormatTime(p2))
            textlabel_1:Set("Money: $" .. FormatMoney(p1))
        end

        while not pcall(FixStats) do
            TaskWait(0.01)
        end
    end)

    TaskSpawn(function() -- line: 676, upvalues: textlabel_3, FormatMoney, p1, p2, MathFloor, TaskWait
        local function FixEstimation() -- line: 677, upvalues: textlabel_3, FormatMoney, p1, p2, MathFloor
            textlabel_3:Set("Hourly: $" .. FormatMoney(MathFloor(p1 / p2 * 3600)))
        end

        while not pcall(FixEstimation) do
            TaskWait(0.01)
        end
    end)
end

function UpdateMansionInvites(p1) -- line: 687, upvalues: TaskSpawn, textlabel_7, TaskWait
    TaskSpawn(function() -- line: 688, upvalues: textlabel_7, p1, TaskWait
        local function StatusFix() -- line: 689, upvalues: textlabel_7, p1
            textlabel_7:Set("Invites: " .. tostring(p1))
        end

        while not pcall(StatusFix) do
            TaskWait(0.01)
        end
    end)
end


local n21, n22 = 0, 0

TaskSpawn(function() -- line: 702, upvalues: TaskWait, n21, leaderstats, n22, RunService, t8, LocalPlayer
    while TaskWait(0.1) do
        pcall(function() -- line: 704, upvalues: n21, leaderstats
            n21 = leaderstats.Money.Value - getgenv()._StartingCash
        end)

        pcall(function() -- line: 708, upvalues: n22
            n22 = tick() - getgenv()._StartingTime
        end)

        RunService:Set3dRenderingEnabled(not t8.FpsBooster)
        UpdateStats(n21, n22)
        UpdateMansionInvites(t8[LocalPlayer.Name])
        UpdateRobberyStats()
    end
end)



t7.TagUtils.isPointInTag = newcclosure(function(p1, p2) -- line: 721, upvalues: TableFind, new
    if TableFind({"NoFallDamage", "NoRagdoll"}, p2) then
        return true
    end

    return new(p1, p2)
end)

TaskSpawn(function() -- line: 729, upvalues: Workspace
    pcall(function() -- line: 730, upvalues: Workspace
        Workspace:WaitForChild("OilRig", 999).Turrets:Destroy()
    end)
end)



local function OnPlayerAdded(p1) -- line: 737, upvalues: u4, Humanoid, HumanoidRootPart, LocalPlayer
    u4 = p1
    Humanoid = p1:WaitForChild("Humanoid")
    HumanoidRootPart = p1:WaitForChild("HumanoidRootPart")

    if Humanoid:FindFirstChild("HumanoidUnloadExists") then
        Humanoid.BreakJointsOnDeath = false
        Humanoid.HumanoidUnloadExists:Destroy()
    end

    if Humanoid:FindFirstChild("HumanoidUnloadNetworkOwnerId") then
        Humanoid.HumanoidUnloadNetworkOwnerId:Destroy()
    end

    if Humanoid:FindFirstChild("HumanoidUnloadServerPosition") then
        Humanoid.HumanoidUnloadServerPosition:Destroy()
    end

    pcall(function() -- line: 755, upvalues: LocalPlayer
        if LocalPlayer.PlayerScripts:FindFirstChild("HumanoidUnload") and LocalPlayer.PlayerScripts.HumanoidUnload:FindFirstChild("HumanoidUnload") then
            LocalPlayer.PlayerScripts.HumanoidUnload.HumanoidUnload.Disabled = true
        end
    end)

    Humanoid.Died:Connect(function() -- line: 761, upvalues: u4, Humanoid, HumanoidRootPart
        u4, Humanoid, HumanoidRootPart = nil
    end)
end

local function OnVehicleAdded() -- line: 766, upvalues: GetLocalVehicleModel, u5
    u5 = GetLocalVehicleModel() or nil
end







if LocalPlayer.Character then
    OnPlayerAdded(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(OnPlayerAdded)

t7.VehicleUtils.OnVehicleEntered:Connect(OnVehicleAdded)
t7.VehicleUtils.OnVehicleExited:Connect(OnVehicleAdded)



LPH_NO_VIRTUALIZE(function() -- line: 787, upvalues: LocalPlayer, TableFind, ReplicatedStorage
    for _, v in getgc(true) do
        if typeof(v) == "function" then
            if getfenv(v).script == LocalPlayer.PlayerScripts.LocalScript then
                if debug.info(v, "n"):match("CheatCheck") then
                    hookfunction(v, function() -- line: 792
                    end) elseif TableFind(debug.getconstants(v), "Stunned") then
                    hookfunction(v, function() -- line: 794
                    end)
                end elseif getfenv(v).script == ReplicatedStorage.Game.MilitaryTurret.MilitaryTurret and debug.info(v, "n"):match("_fire") then

                hookfunction(v, function() -- line: 798
                end)
            end
        end
    end
end)()



local function DistanceXYZ(p1) -- line: 807, upvalues: LocalPlayer
    local ok, err = pcall(function() -- line: 808, upvalues: LocalPlayer, p1
        return (LocalPlayer.Character.HumanoidRootPart.Position - p1).Magnitude
    end) return ok and err or math.huge
end

local function DistanceXZ(p1, p2) -- line: 813, upvalues: Vector3New
    return (Vector3New(p1.X, 0, p1.Z) - Vector3New(p2.X, 0, p2.Z)).Magnitude
end



local t23 = {High = Vector3.new(0, 999, 0), Low = Vector3.new(0, -999, 0)}

local t24


















t24 = {
    Ignored = {Workspace.Vehicles, Workspace.VehicleSpawns},
    Ignorable = {"Items", "Plane", "Rain", "RainSnow", "RainFall", "DirtRoad"},

    Start = function(p1, p2, p3) -- line: 825, upvalues: t24, raycastParams, Workspace
        if p3 then
            t24.Ignored[#t24.Ignored + 1] = p3
        end

        raycastParams.FilterDescendantsInstances = t24.Ignored
        return Workspace:Raycast(p1, p2, raycastParams)
    end,

    OnChildAdded = function(p1) -- line: 834, upvalues: TableFind, t24
        if TableFind(t24.Ignorable, p1.Name) then
            t24.Ignored[#t24.Ignored + 1] = p1
        end
    end,

    OnChildRemoved = function(p1) -- line: 840, upvalues: TableFind, t24, TableRemove
        if TableFind(t24.Ignorable, p1.Name) then
            TableRemove(t24.Ignored, TableFind(t24.Ignored, p1))
        end
    end
}
Workspace.ChildAdded:Connect(t24.OnChildAdded)
Workspace.ChildRemoved:Connect(t24.OnChildRemoved)
for _, child_1 in Workspace:GetChildren() do
    if child_1.Name == "Bench" then
        child_1:Destroy()
    end
    t24.OnChildAdded(child_1)
end
for _, instance in CollectionService:GetTagged("Tree") do
    t24.Ignored[#t24.Ignored + 1] = instance
end
for _, instance_1 in CollectionService:GetTagged("NoClipAllowed") do
    t24.Ignored[#t24.Ignored + 1] = instance_1
end
local function DetectLagBack(p1) -- line: 868, upvalues: TaskWait, DistanceXZ, HumanoidRootPart
    TaskWait(0.75)
    return DistanceXZ(HumanoidRootPart.Position, p1) > 30
end
local t25 = {
    ObjectsToManage = {}
}
function t25:AddLightingObject(p1, p2) -- line: 878
    self.ObjectsToManage[p1.Name] = {
        object = p1,
        savedProperties = {},
        propertyNames = p2,
        toggle = false,
        debounce = false
    }
end
function t25:SaveLightingProperties(p1, p2) -- line: 888
    if p1.debounce then
        return
    end
    if p2 then
        p1.savedProperties[p2] = p1.object[p2]
    else
        for _, v in p1.propertyNames do
            p1.savedProperties[v] = p1.object[v]
        end
    end
end
function t25:SetLightingProperties(p1) -- line: 900
    p1.debounce = true
    if not p1.toggle then
        p1.object.Enabled = false
    else
        for _, v in p1.propertyNames do
            p1.object[v] = p1.savedProperties[v]
        end
    end
    p1.debounce = false
end
function t25:SetLightingEffect(p1, toggle) -- line: 914
    if self.ObjectsToManage[p1] then
        self.ObjectsToManage[p1].toggle = toggle
        self:SetLightingProperties(self.ObjectsToManage[p1])
    end
end





while not pcall(function() -- line: 921, upvalues: t25, Lighting
    t25:AddLightingObject(Lighting.Blur, {"Enabled"})

    for _, child in Lighting:GetChildren() do
        if child.Name == "ColorCorrection" and child.Brightness == 0 then
            t25:AddLightingObject(child, {"Enabled"})
        end
    end
end) do
    TaskWait(0.01)
end
for _, v_2 in t25.ObjectsToManage do
    t25:SaveLightingProperties(v_2)
    v_2.object.Changed:Connect(function(property) -- line: 936, upvalues: v_2, t25
        if not v_2.debounce then
            t25:SaveLightingProperties(v_2, property)
            t25:SetLightingProperties(v_2)
        end
    end)
end
t25:SetLightingEffect("Blur", false)
t25:SetLightingEffect("ColorCorrection", false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
local function ExitVehicle() -- line: 948, upvalues: u4, HumanoidRootPart, Humanoid, LocalPlayer, f3, t7, TaskWait, u5
    if not u4 or not HumanoidRootPart or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1 or f3() then
        return
    end
    repeat
        t7.CharacterUtil.OnJump()
        TaskWait()
    until not u5
end
local b26 = false local function InstantTP(cFrame, p2) -- line: 961, upvalues: u4, HumanoidRootPart, Humanoid, LocalPlayer, f3, u5, ExitVehicle, DistanceXZ, Vector3New, PlayerGui, Workspace, b26, CurrentCamera, TaskWait, DetectLagBack, DistanceXYZ
    if not u4 or not HumanoidRootPart or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1 or f3() then
        return error()
    end

    if u5 then
        ExitVehicle()
    end

    local n1 = 5

    repeat
        if DistanceXZ(Vector3New(cFrame.X, cFrame.Y, cFrame.Z), HumanoidRootPart.Position) > 30 then
            local connect = {}

            connect = PlayerGui.AppUI.ChildAdded:Connect(function(child) -- line: 976, upvalues: connect
                if child.Name == "ChooseSpawn" then
                    child:Destroy()
                    connect:Disconnect()
                end
            end)

            local part = Instance.new("Part")
            part.CFrame = cFrame
            part.Anchored = true
            part.CanCollide = false
            part.Transparency = 1
            part.Parent = Workspace

            if PlayerGui:FindFirstChild("DeathGui") then PlayerGui.DeathGui.Enabled = false end
            if PlayerGui:FindFirstChild("ContractPopupGui") then PlayerGui.ContractPopupGui.Enabled = false end

            b26 = true

            local Volume = HumanoidRootPart:WaitForChild("Died").Volume

            HumanoidRootPart:WaitForChild("Died").Volume = 0
            Humanoid:TakeDamage(Humanoid.MaxHealth)

            while (not u4 or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1) and not p2() do
                if CurrentCamera.CameraSubject ~= part then
                    CurrentCamera.CameraSubject = part
                end

                TaskWait()
            end

            b26 = false

            if p2() then
                return
            end

            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = cFrame
            HumanoidRootPart:WaitForChild("Died").Volume = Volume
            CurrentCamera.CameraSubject = Humanoid
            part:Destroy()
        else
            HumanoidRootPart.CFrame = cFrame
        end

        n1 -= 1
    until not DetectLagBack(Vector3New(cFrame.X, cFrame.Y, cFrame.Z)) or n1 == 0 or p2()

    if p2() then
        return error()
    end

    if DistanceXYZ(Vector3New(cFrame.X, cFrame.Y, cFrame.Z)) > 30 or n1 == 0 then
        return error()
    end
end
local lPH_JIT_MAX
lPH_JIT_MAX = LPH_JIT_MAX(function(p1) -- line: 1034, upvalues: t8, HumanoidRootPart, u4
    local n1 = -t8.FlightSpeed
    local function f2() return Vector3.new(p1.x, 500, p1.z) end -- line: 1036, upvalues: p1
    local function f3() return HumanoidRootPart end -- line: 1037, upvalues: HumanoidRootPart

    u4:PivotTo(CFrame.new(HumanoidRootPart.Position.x, 500, HumanoidRootPart.Position.z))

    local n4 = f3().Position - f2()

    while n4.Magnitude > 10 do
        n4 = f3().Position - f2()
        local n5 = n4.Unit * n1
        local vector3 = Vector3.new(n5.x, 0, n5.z)

        f3().Velocity = vector3
        u4:PivotTo(CFrame.new(HumanoidRootPart.Position.x, 500, HumanoidRootPart.Position.z))
        task.wait()
    end

    f3().Velocity = Vector3.zero
    u4:PivotTo(p1)
end)



local request_1 = http and http.request or syn and syn.request or request or HttpPost or http_request

local function LogWebhook(p1) -- line: 1061, upvalues: leaderstats, LocalPlayer, FormatMoney, MathFloor, FormatTime, request_1, t8, HttpService
    pcall(function() -- line: 1062, upvalues: leaderstats, LocalPlayer, FormatMoney, MathFloor, FormatTime, p1, request_1, t8, HttpService
        local n1 = leaderstats.Money.Value - getgenv()._StartingCash
        local n2 = tick() - getgenv()._StartingTime
        local dateStr = os.date("!%Y-%m-%dT%H:%M:%SZ")

        local t3 = {}
        t3["Content-Type"] = "application/json"


        local t4 = {}
        t4.content = nil

        local t5 = {}
        t5.title = "Cashfarm Jailbreak"
        t5.description = "``👨\226\128\141💼`` **Username**: " .. tostring(LocalPlayer.Name) .. "\n``💲`` **Money Earned**: $" .. FormatMoney(n1) .. "\n``💲`` **Money**: " .. FormatMoney(leaderstats.Money.Value) .. "\n``❓`` **Estimated Hourly**: $" .. FormatMoney(MathFloor(n1 / n2 * 3600)) .. "\n``⌛`` **Elapsed Time**: " .. FormatTime(n2) .. "\n```" .. tostring(p1) .. "```"
        t5.color = 65403
        local footer = {}
        footer.text = "https://cashfarm.cc"
        t5.footer = footer
        t5.timestamp = dateStr
        t4.embeds = {







            t5
        }
        t4.attachments = {}
        request_1({Url = tostring(t8.WebhookUrl), Body = HttpService:JSONEncode(t4), Method = "POST", Headers = t3})
    end)
end
local function LogHyper(p1) -- line: 1091, upvalues: LocalPlayer, FormatTime, request_1, t8, HttpService
    pcall(function() -- line: 1092, upvalues: LocalPlayer, FormatTime, p1, request_1, t8, HttpService
        local n1 = tick() - getgenv()._StartingTime
        local dateStr = os.date("!%Y-%m-%dT%H:%M:%SZ")

        local t2 = {}
        t2["Content-Type"] = "application/json"


        local t3 = {}
        t3.content = nil

        local t4 = {}
        t4.title = "Cashfarm Jailbreak"
        t4.description = "``👨\226\128\141💼`` **Username**: " .. tostring(LocalPlayer.Name) .. "\n``⌛`` **Elapsed Time**: " .. FormatTime(n1) .. "\n```You have received a " .. p1 .. "!```"
        t4.color = 65403
        local footer = {}
        footer.text = "https://cashfarm.cc"
        t4.footer = footer
        t4.timestamp = dateStr
        t3.embeds = {







            t4
        }
        t3.attachments = {}
        request_1({Url = tostring(t8.WebhookUrl), Body = HttpService:JSONEncode(t3), Method = "POST", Headers = t2})
    end)
end
local n27 = 0
local b28 = false
local function HandleChatMessage(p1) -- line: 1125, upvalues: StringFind, LocalPlayer, n27, t8, b28, LogHyper, TaskDelay
    local text = tostring(p1.Text)
    if StringFind(text, LocalPlayer.DisplayName .. " robbed the cargo ship for") then
        n27 = n27 + 1
    elseif t8.LogHypers and t8.WebhookUrl ~= "" then
        if b28 then
            return
        end
        if p1.TextSource then
            return
        end
        if (StringFind(text, "Hyper") or StringFind(text, "HyperChrome")) and (StringFind(text, LocalPlayer.Name) or StringFind(text, LocalPlayer.DisplayName)) then
            local text_1 = text
            text_1 = text_1:gsub("<[^>]+>", "")
            text_1 = text_1:gsub(LocalPlayer.Name, "")
            text_1 = text_1:gsub("got a", "")
            LogHyper(text_1)
            b28 = true
            TaskDelay(5, function() -- line: 1146, upvalues: b28
                b28 = false
            end)
        end
    end
end
TextChatService.MessageReceived:Connect(HandleChatMessage)
local setidentity = setidentity or set_thread_identity or setcontext or setthreadcontext or set_thread_context local function GetWeapon(p1) -- line: 1157, upvalues: setidentity, t7, PlayerGui, TaskWait, Folder
    setidentity(2)
    pcall(t7.GunShopUI.open)

    repeat
        for _, child in t7.GunShopUI.gui.Container.Container.Main.Container.Slider:GetChildren() do
            if p1 and child:IsA("ImageLabel") and (child.Bottom.Action.Text == "EQUIP" or child.Bottom.Action.Text == "FREE") and child.Name == "Pistol" then
                firesignal(PlayerGui.GunShopGui.Container.Container.Main.Container.Slider.Pistol.Bottom.Action.MouseButton1Down)
            elseif not p1 and child.Name == "Pistol" then
                firesignal(PlayerGui.GunShopGui.Container.Container.Main.Container.Slider.Pistol.Bottom.Action.MouseButton1Down)
            end
        end

        TaskWait(0.01)
    until p1 and Folder:FindFirstChild("Pistol") or not Folder:FindFirstChild("Pistol")

    setidentity(8)
    pcall(t7.GunShopUI.close)
end

local function EquipWeapon(p1) -- line: 1177, upvalues: Folder, GetWeapon, t7
    if not Folder:FindFirstChild("Pistol") then
        GetWeapon(true)
    end

    if not Folder:FindFirstChild("Pistol") then
        return
    end

    t7.InventoryItem.AttemptSetEquipped({obj = Folder.Pistol}, p1)
end

local function ShootWeapon() -- line: 1189, upvalues: t7, Folder, GetWeapon, EquipWeapon
    local GetLocalEquipped = t7.ItemSystem.GetLocalEquipped

    if Folder:FindFirstChild("Pistol") and Folder.Pistol:GetAttribute("AmmoCurrent") == 0 then
        GetWeapon(false)
    end

    if not GetLocalEquipped() then
        EquipWeapon(true)
    end

    t7.GunItem._attemptShoot(GetLocalEquipped())
end

local function GetClosestCop() -- line: 1203, upvalues: Players, DistanceXZ, HumanoidRootPart, t8
    for _, player in Players:GetPlayers() do
        if player.Team.Name == "Police" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and DistanceXZ(player.Character.HumanoidRootPart.Position, HumanoidRootPart.Position) < t8.KillAuraDistance then

            return player
        end
    end


    return nil
end

function WaitForReward() -- line: 1215, upvalues: PlayerGui, b11, TaskWait
    if PlayerGui.AppUI:FindFirstChild("RewardSpinner") then
        b11 = false

        repeat
            TaskWait()
        until not PlayerGui.AppUI:FindFirstChild("RewardSpinner")

        b11 = true
    end
end

local function CanRobMansion() -- line: 1227, upvalues: t8, LocalPlayer
    return t8[LocalPlayer.Name] > 0
end

local function AddMansionInvite() -- line: 1231, upvalues: t8, LocalPlayer, SaveConfig
    if t8[LocalPlayer.Name] > 299 then
        return
    end

    t8[LocalPlayer.Name] = t8[LocalPlayer.Name] + 1
    SaveConfig()
end

local function RemoveMansionInvite() -- line: 1240, upvalues: t8, LocalPlayer, SaveConfig
    t8[LocalPlayer.Name] = t8[LocalPlayer.Name] - 1
    SaveConfig()
end



v19["Cargo Ship"].Callback = function() -- line: 1247, upvalues: u4, HumanoidRootPart, Humanoid, LocalPlayer, f3, t8, v19, TaskSpawn, LogWebhook, Workspace, t7, TableFind, TableInsert, DistanceXZ, t24, Vector3New, t23, lPH_JIT_MAX, CFrameNew, InstantTP, Specs, TaskWait, u5, n27, CurrentCamera, WaitForReward
    if not u4 or not HumanoidRootPart or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1 or f3() then
        return
    end

    if not t8.CargoShip then
        return
    end

    if not v19["Cargo Ship"].Open then
        return
    end

    if t8.LogWebhook and t8.WebhookUrl ~= "" then
        TaskSpawn(LogWebhook, "Robbing ship..")
    end

    local children = Workspace.Vehicles:GetChildren()

    local t1 = {"Heli"}
    local t2 = {"LittleBird", "BlackHawk", "Escape Bot"}

    for k, _ in t7.Store._state.garageOwned.Vehicles do
        if TableFind(t2, k) then
            TableInsert(t1, k)
        end
    end

    table.sort(children, function(p1, p2) -- line: 1275, upvalues: DistanceXZ, HumanoidRootPart
        local PrimaryPart = p1.PrimaryPart or p1:FindFirstChildWhichIsA("Part")
        local PrimaryPart_1 = p2.PrimaryPart or p2:FindFirstChildWhichIsA("Part")

        if PrimaryPart ~= nil and PrimaryPart_1 ~= nil then
            return DistanceXZ(PrimaryPart.Position, HumanoidRootPart.Position) < DistanceXZ(PrimaryPart_1.Position, HumanoidRootPart.Position)
        end
    end)

    for _, v in children do
        if v.PrimaryPart and v.Seat and TableFind(t1, v.Name) and v.Seat.Position.Y < 300 and not v:GetAttribute("VehicleHasDriver") and not t24.Start(v.PrimaryPart.Position, Vector3New(0, 1000, 0)) and v19["Cargo Ship"].Open and not v:GetAttribute("Locked") then
            UpdateStatus("TPing to heli..")

            if DistanceXZ(v.PrimaryPart.Position, HumanoidRootPart.Position) < t8.FlightSpeed * 4 and not t24.Start(HumanoidRootPart.Position + Vector3New(0, 5, 0), t23.High) then
                lPH_JIT_MAX(v.Seat.CFrame * CFrameNew(0, 2.5, 0))
            else
                InstantTP(v.Seat.CFrame * CFrameNew(0, 5, 0), function() -- line: 1291, upvalues: v
                    return not v or not v:FindFirstChild("Seat") or v:GetAttribute("VehicleHasDriver")
                end)
            end

            UpdateStatus("Entering helicopter..")

            for _ = 1, 10 do
                if DistanceXZ(v.Seat.Position, HumanoidRootPart.Position) > 10 and DistanceXZ(v.Seat.Position, HumanoidRootPart.Position) < 30 then
                    HumanoidRootPart.CFrame = v.Seat.CFrame * CFrameNew(0, 2.5, 0)
                elseif DistanceXZ(v.Seat.Position, HumanoidRootPart.Position) > 30 then
                    local CFrame, cFrameNew = v.Seat.CFrame, CFrameNew(0, 2.5, 0) lPH_JIT_MAX(CFrame * cFrameNew)
                end

                for _, v_1 in Specs do
                    if v_1.Part == v.Seat then
                        v_1:Callback(true)
                    end
                end

                local v3 = tick()

                repeat
                    TaskWait()
                until tick() - v3 > 0.25 or u5 or v:GetAttribute("VehicleHasDriver") or v:GetAttribute("Locked")

                if u5 or v:GetAttribute("VehicleHasDriver") then
                    break
                end
            end

            if u5 then
                break
            end

            if not v19["Cargo Ship"].Open then
                return error()
            end
        end
    end

    if not v19["Cargo Ship"].Open then
        return
    end

    if not u5 then
        v19["Cargo Ship"].Robbed = true
        return error()
    end

    v19["Cargo Ship"].Robbed = true

    u5:PivotTo(CFrameNew(HumanoidRootPart.Position.X, 300, HumanoidRootPart.Position.Z))
    TaskWait(0.25)

    if not u5.Preset:FindFirstChild("RopePull") then
        UpdateStatus("Deploying rope..")

        local v4 = tick()

        repeat
            t7.VehicleUtils.Classes.Heli.attemptDropRope()

            local v5 = tick()

            repeat
                TaskWait()
            until tick() - v5 > 1
        until u5.Preset:FindFirstChild("RopePull") or tick() - v4 > 5

        if not u5.Preset:FindFirstChild("RopePull") then
            return
        end
    end

    local RopeConstraint = u5.Winch:FindFirstChild("RopeConstraint")
    local RopePull = u5.Preset:FindFirstChild("RopePull")

    if RopeConstraint and RopePull then
        RopeConstraint.Length = 999
        RopeConstraint.WinchEnabled = true
        RopePull.CanCollide = false
        RopePull.Massless = true




        n27 = 0
        TaskWait(1.75)

        if not v19["Cargo Ship"].Open then
            return
        end

        UpdateStatus("Collecting & robbing crates..")

        for _, child in Workspace.CargoShip.Crates:GetChildren() do
            if not v19["Cargo Ship"].Open then
                return
            end

            CurrentCamera.CameraType = Enum.CameraType.Scriptable
            CurrentCamera.CFrame = child.MeshPart.CFrame

            TaskWait(1)

            CurrentCamera.CameraType = Enum.CameraType.Custom
            CurrentCamera.CameraSubject = Humanoid

            local v6 = tick()

            repeat
                RopePull.CFrame = child.PrimaryPart.CFrame
                RopePull.ReqLink:FireServer(child, Vector3.zero)
                TaskWait()
            until RopePull.AttachedTo.Value or not v19["Cargo Ship"].Open or not RopePull:FindFirstChild("ReqLink") or tick() - v6 > 10

            if not v19["Cargo Ship"].Open or not RopePull:FindFirstChild("ReqLink") then
                return
            end

            if RopePull.AttachedTo.Value then
                if n27 == 1 then
                    WaitForReward()
                end

                local v7 = tick()

                repeat
                    RopePull.CFrame = child.PrimaryPart.CFrame
                    child:SetPrimaryPartCFrame(CFrameNew(-475, -43, 1905))
                    TaskWait()
                until not child or not child:FindFirstChild("MeshPart") or not RopePull:FindFirstChild("ReqLink") or tick() - v7 > 10

                if tick() - v7 > 10 then
                    return
                end

                if not RopePull:FindFirstChild("ReqLink") then
                    return
                end
            end

            if n27 == 2 then
                break
            end
        end

        if t8.LogWebhook and t8.WebhookUrl ~= "" then
            TaskSpawn(LogWebhook, "Robbed ship!")
        end
    end
end
function v19.Airdrop:Callback() -- line: 1444, upvalues: u4, HumanoidRootPart, Humanoid, LocalPlayer, f3, t8, TaskSpawn, LogWebhook, TaskWait, InstantTP, CFrameNew, Vector3New, DistanceXZ, AddMansionInvite, Workspace, Specs, WaitForReward
    if not u4 or not HumanoidRootPart or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1 or f3() then
        return
    end

    if not t8.Airdrop then
        return
    end

    if not self or not self.PrimaryPart then
        return
    end

    if t8.LogWebhook and t8.WebhookUrl ~= "" then
        TaskSpawn(LogWebhook, "Robbing drop..")
    end

    if not self:GetAttribute("BriefcaseLanded") then
        UpdateStatus("Waiting for drop..")

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        Humanoid.Sit = true

        repeat
            TaskWait()
        until self:GetAttribute("BriefcaseLanded")

        Humanoid.Sit = false
    end

    TaskSpawn(function() -- line: 1474, upvalues: self, TaskWait
        pcall(function() -- line: 1475, upvalues: self, TaskWait
            while self and self:FindFirstChild("NPCs") == nil do
                TaskWait(0.1)
            end

            self.NPCs:Destroy()
        end)
    end)

    UpdateStatus("TPing on drop..")

    InstantTP(self.PrimaryPart.CFrame * CFrameNew(0, 5, 0), function() -- line: 1486, upvalues: self
        return not self or not self.PrimaryPart or self:GetAttribute("BriefcaseCollected")
    end)

    if not self or not self.PrimaryPart or self:GetAttribute("BriefcaseCollected") then
        return error()
    end

    local body_velocity = Instance.new("BodyVelocity", HumanoidRootPart)
    body_velocity.P = 3000
    body_velocity.MaxForce = Vector3New(9000000000, 9000000000, 9000000000)
    body_velocity.Velocity = Vector3New()

    HumanoidRootPart.CFrame = self.PrimaryPart.CFrame * CFrameNew(0, 5, 0)

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid.Sit = true

    if LocalPlayer.Team.Name == "Prisoner" then
        local v1 = tick()

        UpdateStatus("Awaiting team change..")

        repeat
            TaskWait()
        until tick() - v1 > 10 or LocalPlayer.Team.Name ~= "Prisoner" or not self or not self.PrimaryPart or self:GetAttribute("BriefcaseCollected")

        if LocalPlayer.Team.Name == "Prisoner" or not self or not self.PrimaryPart or self:GetAttribute("BriefcaseCollected") then
            body_velocity:Destroy()
            Humanoid.Sit = false
            return error()
        end
    end

    UpdateStatus("Collecting drop..")

    repeat
        pcall(function() -- line: 1523, upvalues: self, TaskWait
            self.BriefcasePress:FireServer()

            local v1 = tick()

            repeat
                TaskWait()
            until tick() - v1 > 1 or self:GetAttribute("BriefcaseCollected")

            self.BriefcaseRelease:FireServer()
            self.BriefcaseCollect:FireServer()
        end)
    until self:GetAttribute("BriefcaseCollected") or not self or not self.PrimaryPart or DistanceXZ(self.PrimaryPart.Position, HumanoidRootPart.Position) > 10

    body_velocity:Destroy()

    if DistanceXZ(self.PrimaryPart.Position, HumanoidRootPart.Position) > 10 then
        Humanoid.Sit = false
        return error()
    end

    if not self or not self.PrimaryPart then
        Humanoid.Sit = false
        return error()
    end

    HumanoidRootPart.CFrame = self.PrimaryPart.CFrame * CFrameNew(0, 5, 0)

    AddMansionInvite()
    self.Name = ""

    TaskWait(0.15)

    if t8.CollectCash then
        TaskSpawn(function() -- line: 1557, upvalues: Workspace, DistanceXZ, HumanoidRootPart, TaskWait, Specs
            local b1 = false

            while not b1 do
                for _, child in Workspace.DroppedCash:GetChildren() do
                    if child:IsA("Model") and child.PrimaryPart and child.PrimaryPart.Position.Y > 5 and DistanceXZ(child.PrimaryPart.Position, HumanoidRootPart.Position) < 100 then
                        b1 = true
                    end
                end

                TaskWait(0.01)
            end

            for _ = 1, 10 do
                for _, v in Specs do
                    if v.Name:sub(1, 9) == "Collect $" then
                        v:Callback(true)
                    end
                end

                TaskWait(0.1)
            end
        end)
    end

    UpdateStatus("Waiting for reward..")
    WaitForReward()

    if t8.PickUpCash then
        TaskSpawn(function() -- line: 1586, upvalues: Specs, TaskWait
            for _ = 1, 10 do
                for _, v in Specs do
                    if v.Name:sub(1, 9) == "Collect $" then
                        pcall(function() -- line: 1590, upvalues: v
                            v:Callback(true)
                        end)
                    end
                end

                TaskWait(0.1)
            end
        end)
    end

    if t8.LogWebhook and t8.WebhookUrl ~= "" then
        TaskSpawn(LogWebhook, "Robbed drop!")
    end

    Humanoid.Sit = false
end

function v19.Mansion.Callback() -- line: 1608, upvalues: u4, HumanoidRootPart, Humanoid, LocalPlayer, f3, v19, t8, u5, ExitVehicle, TaskSpawn, LogWebhook, Workspace, Vector3New, CFrameNew, TaskDelay, RunService, TaskWait, t7, GetWeapon, RemoveMansionInvite, b6, TableInsert, new_1, ReplicatedStorage, RayIgnoreNonCollideWithIgnoreList, MathFloor, EquipWeapon, ShootWeapon, PlayerGui, WaitForReward
    if not u4 or not HumanoidRootPart or not Humanoid or LocalPlayer.Character.Humanoid.Health < 1 or f3() then
        return
    end

    if not v19.Mansion.Open then
        return
    end

    if not t8.Mansion then
        return
    end

    if u5 then
        ExitVehicle()
    end

    if t8.LogWebhook and t8.WebhookUrl ~= "" then
        TaskSpawn(LogWebhook, "Robbing mansion..")
    end

    UpdateStatus("Entering elevator..")

    local MansionRobbery = Workspace.MansionRobbery
    local TouchToEnter = MansionRobbery.Lobby.EntranceElevator.TouchToEnter
    local TriggerFoundBossRoom = MansionRobbery.TriggerFoundBossRoom
    local Door = MansionRobbery.ArrivalElevator.Floors:GetChildren()[1].DoorLeft.InnerModel.Door
    local n1 = TouchToEnter.CFrame - Vector3New(0, TouchToEnter.Size.Y / 2 - LocalPlayer.Character.Humanoid.HipHeight * 2, -TouchToEnter.Size.Z)
    local cFrameNew = CFrameNew(3154, -205, -4558)
    local b2 = false
    local b3 = false

    TaskDelay(10, function() -- line: 1640, upvalues: b2
        b2 = true
    end)

    local connect = RunService.Heartbeat:Connect(function() -- line: 1644, upvalues: HumanoidRootPart, n1
        HumanoidRootPart.CFrame = n1
    end)

    repeat
        firetouchinterest(HumanoidRootPart, TouchToEnter, 0)
        TaskWait()
        firetouchinterest(HumanoidRootPart, TouchToEnter, 1)
    until t7.MansionRobberyUtils.isPlayerInElevator(MansionRobbery, LocalPlayer) or b2

    connect:Disconnect()

    if b2 then
        Humanoid.Health = 0
        return
    end

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    Humanoid.Sit = true

    TaskWait(0.75)
    HumanoidRootPart.CFrame = CFrameNew(3198, 63, -4659)

    GetWeapon(true)
    UpdateStatus("Waiting for elevator..")
    RemoveMansionInvite()

    repeat
        TaskWait(0.1)
    until Door.Position.X > 3208

    Humanoid.Sit = false
    b6 = true

    for _, child in MansionRobbery.Lasers:GetChildren() do
        child:Remove()
    end

    for _, child in MansionRobbery.LaserTraps:GetChildren() do
        child:Remove()
    end

    TaskDelay(12.5, function() -- line: 1686, upvalues: b3
        b3 = true
    end)

    local connect_1 = RunService.Heartbeat:Connect(function() -- line: 1690, upvalues: HumanoidRootPart, cFrameNew
        HumanoidRootPart.CFrame = cFrameNew
    end)

    UpdateStatus("Triggering cutscene..")

    repeat
        firetouchinterest(HumanoidRootPart, TriggerFoundBossRoom, 0)
        TaskWait()
        firetouchinterest(HumanoidRootPart, TriggerFoundBossRoom, 1)
    until MansionRobbery:GetAttribute("MansionRobberyProgressionState") == 3 or Humanoid.Health <= 0 or not u4 or b3

    connect_1:Disconnect()

    if b3 then
        Humanoid.Health = 0
        return
    end

    UpdateStatus("Waiting for cutscene..")
    t7.MansionRobberyUtils.getProgressionStateChangedSignal(MansionRobbery):Wait()

    local body_velocity = Instance.new("BodyVelocity", HumanoidRootPart)
    body_velocity.P = 3000
    body_velocity.MaxForce = Vector3New(9000000000, 9000000000, 9000000000)
    body_velocity.Velocity = Vector3New()

    local v4 = HumanoidRootPart.CFrame.Y
    local HumanoidRootPart_1, v5, n6, CFrame = HumanoidRootPart, HumanoidRootPart.CFrame.X, v4 + 9, HumanoidRootPart.CFrame HumanoidRootPart_1.CFrame = CFrameNew(v5, n6, CFrame.Z)

    local t9 = {}

    function t7.NPC.new(p1, ...) -- line: 1722, upvalues: t9, TableInsert, new_1
        if p1.Name ~= "ActiveBoss" then
            TableInsert(t9, p1)
        end

        return new_1(p1, ...)
    end

    function t7.NPC.GetTarget() -- line: 1730, upvalues: MansionRobbery
        return MansionRobbery and MansionRobbery:FindFirstChild("ActiveBoss") and MansionRobbery:FindFirstChild("ActiveBoss").Head
    end

    Workspace.Items.DescendantAdded:Connect(function(descendant) -- line: 1734
        if descendant:IsA("BasePart") then
            descendant.Transparency = 1

            descendant:GetPropertyChangedSignal("Transparency"):Connect(function() -- line: 1738, upvalues: descendant
                descendant.Transparency = 1
            end)
        end
    end)

    for _, child_1 in ReplicatedStorage.Game.Item:GetChildren() do
        require(child_1).ReloadDropAmmoVisual = function() -- line: 1745
        end require(child_1).ReloadDropAmmoSound = function() -- line: 1746
        end require(child_1).ReloadRefillAmmoSound = function() -- line: 1747
        end require(child_1).ShootSound = function() -- line: 1748
        end
    end
    getfenv(t7.BulletEmitter.Emit).Instance = {
        new = function() -- line: 1752
            return {
                Destroy = function() -- line: 1754
                end
            }
        end
    }
    local ActiveBoss = MansionRobbery:WaitForChild("ActiveBoss")
    local Health = ActiveBoss.Humanoid.Health

    LPH_NO_VIRTUALIZE(function() -- line: 1762, upvalues: t7, RayIgnoreNonCollideWithIgnoreList, ActiveBoss
        function t7.RayCast.RayIgnoreNonCollideWithIgnoreList(...) -- line: 1763, upvalues: RayIgnoreNonCollideWithIgnoreList, ActiveBoss
            local t1 = {RayIgnoreNonCollideWithIgnoreList(...)}

            if tostring(getfenv(2).script) ~= "BulletEmitter" then if tostring(getfenv(2).script) == "Taser" then if ActiveBoss.Head then
                        t1[1] = ActiveBoss.Head
                        t1[2] = ActiveBoss.Head.Position
                    end
                end
            elseif ActiveBoss.Head then
                t1[1] = ActiveBoss.Head
                t1[2] = ActiveBoss.Head.Position
            end
            return unpack(t1)
        end
    end)()
    local ATTACK_STATE = t7.BossNPCConsts.ATTACK_STATE
    setreadonly(ATTACK_STATE, false) for v in pairs(ATTACK_STATE) do
        ATTACK_STATE[v] = nil
    end

    setreadonly(ATTACK_STATE, true)

    while ActiveBoss and ActiveBoss:FindFirstChild("HumanoidRootPart") and ActiveBoss.Humanoid.Health ~= 1 do
        UpdateStatus("Killing boss.. (" .. MathFloor((Health - ActiveBoss.Humanoid.Health) / Health * 100) .. "%)")
        EquipWeapon(true)
        TaskWait(0.1)
        pcall(ShootWeapon)
    end

    t7.RayCast.RayIgnoreNonCollideWithIgnoreList = RayIgnoreNonCollideWithIgnoreList
    HumanoidRootPart.CFrame = CFrameNew(HumanoidRootPart.CFrame.X, v4, HumanoidRootPart.CFrame.Z)
    body_velocity:Destroy()
    EquipWeapon(false)

    for _, v_1 in t9 do
        pcall(function() -- line: 1798, upvalues: v_1
            v_1:Destroy()
        end)
    end

    UpdateStatus("Waiting for spinner..")

    repeat
        TaskWait()
    until PlayerGui.AppUI:FindFirstChild("RewardSpinner")

    UpdateStatus("Waiting for reward..")
    WaitForReward()

    if t8.LogWebhook and t8.WebhookUrl ~= "" then
        TaskSpawn(LogWebhook, "Robbed mansion!")
    end

    b6 = false
end


Workspace.Terrain.WaterWaveSize = 0
Workspace.Terrain.WaterWaveSpeed = 0
Workspace.Terrain.WaterReflectance = 0
Workspace.Terrain.WaterTransparency = 0

Lighting.GlobalShadows = false
Lighting.FogEnd = 9000000000
Lighting.Brightness = 0

settings().Rendering.QualityLevel = "Level01"
do
    local function HideObject(p1) -- line: 1831
        if p1:IsA("Part") or p1:IsA("CornerWedgePart") or p1:IsA("TrussPart") then
            p1.Material = "Plastic"
            p1.Reflectance = 0
        elseif p1:IsA("Decal") or p1:IsA("Texture") then
            p1.Transparency = 1
        elseif p1:IsA("Explosion") then
            p1.BlastPressure = 1
            p1.BlastRadius = 1
        elseif p1:IsA("Fire") or p1:IsA("SpotLight") or p1:IsA("Smoke") then
            p1.Enabled = false
        elseif p1:IsA("MeshPart") then
            p1.Material = "Plastic"
            p1.Reflectance = 0
            p1.TextureID = 10385902758728956
        end
    end

    for _, descendant in game:GetDescendants() do
        HideObject(descendant)
    end

    for _, descendant in Lighting:GetChildren() do
        if descendant:IsA("BlurEffect") or descendant:IsA("SunRaysEffect") or descendant:IsA("ColorCorrectionEffect") or descendant:IsA("BloomEffect") or descendant:IsA("DepthOfFieldEffect") then
            descendant.Enabled = false
        end
    end

    Workspace.DescendantAdded:Connect(HideObject)
end

repeat TaskWait(0.1) until u4 and Humanoid and HumanoidRootPart
repeat pcall(function() -- line: 1863, upvalues: t7
        t7.TeamChooseUI.Hide()
    end)
    TaskWait(0.1)
until PlayerGui:FindFirstChild("TeamSelectGui") == nil or PlayerGui:FindFirstChild("TeamSelectGui").Enabled == false
while Humanoid == nil do
    TaskWait(0.1)
end
b16 = true if t8.Airdrop then
    local CFrame_1 = HumanoidRootPart.CFrame

    HumanoidRootPart.Anchored = true

    local t29 = {
        Vector3New(-846, 39, -6231),
        Vector3New(-1541, 39, 3311),
        Vector3New(-363, 39, -6340),
        Vector3New(-820, 39, 3306),
        Vector3New(44, 39, -6409),
        Vector3New(811, 39, 3206),
        Vector3New(308, 39, -6350),
        Vector3New(979, 39, 3173),
        Vector3New(683, 39, -6267),
        Vector3New(1303, 39, 3150),
        Vector3New(1350, 39, -5764),
        Vector3New(1976, 39, 3028),
        Vector3New(2698, 39, -5365)
    }

    for _, v_3 in t29 do
        if GetAirdropModel() then
            break
        end

        local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

        pcall(function() -- line: 1899, upvalues: TweenService, HumanoidRootPart, tweenInfo, CFrameNew, v_3
            UpdateStatus("Scanning workspace..")

            local create = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = CFrameNew(v_3)})
            create:Play()

            create.Completed:Wait()
        end)
    end

    HumanoidRootPart.CFrame = CFrame_1
    HumanoidRootPart.Anchored = false
end

TaskSpawn(LPH_JIT_MAX(function() -- line: 1913, upvalues: TaskWait, f3, b26, Humanoid, LocalPlayer, b2, t8, TaskSpawn, LogWebhook, ServerSwitch
    while TaskWait(0.01) do
        if (f3() or not b26 and (not Humanoid or LocalPlayer.Character.Humanoid.Health < 1)) and b2 then
            if t8.LogWebhook and t8.WebhookUrl ~= "" then
                TaskSpawn(LogWebhook, "Server switching..")
            end

            UpdateStatus("Server switching..")
            return ServerSwitch()
        end
    end
end))

TaskSpawn(function() -- line: 1926, upvalues: TaskWait, b2, t8, b6, u4, HumanoidRootPart, u5, GetClosestCop, t7, RayIgnoreNonCollideWithIgnoreList, DistanceXYZ, Folder, GetWeapon, EquipWeapon, ShootWeapon
    while TaskWait(0.5) do
        if not b2 or not t8.KillAura or b6 or not u4 or not HumanoidRootPart or u5 then
            continue
        end

        pcall(function() -- line: 1932, upvalues: GetClosestCop, t7, RayIgnoreNonCollideWithIgnoreList, DistanceXYZ, t8, Folder, GetWeapon, b6, u5, EquipWeapon, TaskWait, ShootWeapon
            local closestCop = GetClosestCop()

            if closestCop then
                function t7.RayCast.RayIgnoreNonCollideWithIgnoreList(...) -- line: 1936, upvalues: RayIgnoreNonCollideWithIgnoreList, closestCop, DistanceXYZ, t8
                    local t1 = {RayIgnoreNonCollideWithIgnoreList(...)}

                    if tostring(getfenv(2).script) ~= "BulletEmitter" then if tostring(getfenv(2).script) == "Taser" then if closestCop and closestCop.Character and closestCop.Character:FindFirstChild("HumanoidRootPart") and closestCop.Character:FindFirstChild("Humanoid") and DistanceXYZ(closestCop.Character.HumanoidRootPart.Position) < t8.KillAuraDistance and closestCop.Character.Humanoid.Health > 0 then
                                t1[1] = closestCop.Character.HumanoidRootPart
                                t1[2] = closestCop.Character.HumanoidRootPart.Position
                                t1[3] = closestCop.Character.HumanoidRootPart.Position
                            end
                        end
                    elseif closestCop and closestCop.Character and closestCop.Character:FindFirstChild("HumanoidRootPart") and closestCop.Character:FindFirstChild("Humanoid") and DistanceXYZ(closestCop.Character.HumanoidRootPart.Position) < t8.KillAuraDistance and closestCop.Character.Humanoid.Health > 0 then
                        t1[1] = closestCop.Character.HumanoidRootPart
                        t1[2] = closestCop.Character.HumanoidRootPart.Position
                        t1[3] = closestCop.Character.HumanoidRootPart.Position
                    end
                    return unpack(t1)
                end
                if not Folder:FindFirstChild("Pistol") then
                    GetWeapon(true)
                end
                if Folder:FindFirstChild("Pistol") then
                    while Folder:FindFirstChild("Pistol") and closestCop and closestCop.Character and closestCop.Character:FindFirstChild("HumanoidRootPart") and closestCop.Character:FindFirstChild("Humanoid") and DistanceXYZ(closestCop.Character.HumanoidRootPart.Position) < t8.KillAuraDistance and closestCop.Character.Humanoid.Health > 0 and not b6 and t8.KillAura and not u5 do
                        EquipWeapon(true)
                        TaskWait()
                        ShootWeapon()
                    end
                    EquipWeapon(false)
                    t7.RayCast.RayIgnoreNonCollideWithIgnoreList = RayIgnoreNonCollideWithIgnoreList
                end else t7.RayCast.RayIgnoreNonCollideWithIgnoreList = RayIgnoreNonCollideWithIgnoreList
            end
        end)
    end
end)

while TaskWait() do
    if v19["Cargo Ship"].Open and not v19["Cargo Ship"].Robbed and t8.CargoShip and b2 then
        pcall(v19["Cargo Ship"].Callback)
    elseif GetAirdropModel() and t8.Airdrop and b2 then
        warn(pcall(v19.Airdrop.Callback, GetAirdropModel()))

        if t8.AutoOpenSafes then
            local count = #t7.Store._state.safesInventoryItems

            if count ~= 0 then
                b11 = false

                for _ = 1, count do
                    local safesInventoryItem = t7.Store._state.safesInventoryItems[1]

                    ReplicatedStorage[t7.SafesConsts.SAFE_OPEN_REMOTE_NAME]:FireServer(safesInventoryItem.itemOwnedId)
                    TaskWait(3)

                    if not t8.AutoOpenSafes then
                        break
                    end
                end

                WaitForReward()
                b11 = true
            end
        end
    elseif v19.Mansion.Open and CanRobMansion() and t8.Mansion and b2 then
        warn(pcall(v19.Mansion.Callback))
    elseif b2 then
        if t8.LogWebhook and t8.WebhookUrl ~= "" then
            TaskSpawn(LogWebhook, "Server switching..")
        end

        UpdateStatus("Server switching..")
        return ServerSwitch()
    else
        UpdateStatus("Script disabled.")
    end
end
