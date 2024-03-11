--[[
    if getgenv().ExecuteOnce then
    print("[Lua Guard]: You Can't Run 2 Scripts")
    return 
else
    getgenv().ExecuteOnce = true
end
]]
function InstantKick(Text)
    task.spawn(function()
        while task.wait(.1) do
            pcall(function()
                for i,v in pairs(game.CoreGui:GetDescendants()) do
                    pcall(function()
                        if string.find(v.Name,"ErrorMessage") then
                            v.Text = Text
                        end
                        if string.find(v.Name,"ErrorTitle") then
                            v.Text = "[ Lua Guard ]"
                        end
                    end)
                end
            end)
        end
    end)
    wait()
    game.Players.LocalPlayer:Destroy()
end
if type(hookfunction) == "function" and getgenv().AntiHttpSpy then
    local hof = clonefunction(hookfunction)
    local http = {}
    local antihook
    antihook = hof(appendfile, function(a)
        for i,v in next,http:GetChildren() do
        if string.find(a,v) then
        return 'Why Https Spy'
        end
        end
    return a
    end)
    antihook = hof(print, function(a)
        for i,v in next,http:GetChildren() do
        if string.find(a,v) then
        return 'Why Https Spy'
        end
        end
        return a
    end)
end
if game.PlaceId == 2753915549 then
    print("[Lua Guard]: Game : Blox Fruits Travel Main")
    TravelMain = true
elseif game.PlaceId == 4442272183 then
    print("[Lua Guard]: Game : Blox Fruits Travel Dressrosa")
    TravelDressrosa = true
elseif game.PlaceId == 7449423635 then
    print("[Lua Guard]: Game : Blox Fruits Travel Zou")
    TravelZou = true
else
    local GameCheckings = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    print("[Message]: "..GameCheckings.Name.." Is Not Support")
    InstantKick("Game Checkings : "..GameCheckings.Name.." Is Not Support")
end

function Notify(content,color)
 if color == nil or color == "" then
    color = "Yellow"
 end
 local Notification = require(game.ReplicatedStorage:WaitForChild("Notification"))
 Notification.new("<Color="..color..">"..content.."<Color=/>"):Display()
end

repeat task.wait()
 if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
    if string.find(tostring(getgenv().Team), "Pirate") then
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do
            v.Function()
        end
    elseif string.find(tostring(getgenv().Team), "Marine") then
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
            v.Function()
        end
    else
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do
            v.Function()
        end
    end
 end
until game.Players.LocalPlayer.Team ~= nil 

local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
function GetBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then 
        return 
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do 
        ret = ret.Parent 
    end
    return ret
end
function AttackNoCD(Num)
    if Num == 1 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.001,0.001,0.001)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end)
            end
        end
    elseif Num == 0 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        for i,CombatFrameworkR in pairs(CbFw) do
                            pcall(function()
                                if i == 2 then
                                    CombatFrameworkR.activeController.increment = 4
                                    CombatFrameworkR.activeController.hitboxMagnitude = 55
                                    CombatFrameworkR.activeController.timeToNextAttack = tick()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760))
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end
end
local STOP = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
if not shared.orl then
    shared.orl = STOPRL.wrapAttackAnimationAsync
end
if not shared.cpc then
    shared.cpc = STOP.play 
end
spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
    end
end)
spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(0.01,0.01,0.01)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end             
        end
    end
end)
spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = shared.cpc
                func(Hits)   
            end             
        end
    end
end)
spawn(function()
    while task.wait() do 
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
          AttackNoCD(0)
        end
    end
end)
b2 = tick()
spawn(function()
    while wait(0.001276) do
        if b2 - tick() > 2 then
            wait(0.01)
            b2 = tick()
        end
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        AttackNoCD(1)
        end
    end
end)


function tween(postion)
    local Postion = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local Postion1 = postion * CFrame.new(0,0,0)
    local Postion2 = (postion.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = 300
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Postion.X,postion.Y,Postion.Z)
    local start = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Postion2/Speed, Enum.EasingStyle.Linear),{CFrame = postion})
    start:Play()
end
function tweenpart(part,postion)
    local Postion = part.CFrame
    local Postion1 = postion * CFrame.new(0,0,0)
    local Postion2 = (postion.Position - part.Position).Magnitude
    local start = game:GetService("TweenService"):Create(part,TweenInfo.new(Postion2/300, Enum.EasingStyle.Linear),{CFrame = postion})
    start:Play()
end
function BringMob()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                    v.Humanoid.WalkSpeed = 0
                    v.Humanoid.JumpPower = 0
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                    if v.Humanoid:FindFirstChild('Animator') then
                        v.Humanoid.Animator:Destroy()
                    end
                    v.Humanoid:ChangeState(11)
                    v.Humanoid:ChangeState(14)
                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                    end
        end
end
getgenv().TurnOnfunction = false
spawn(function()
    while wait() do
       if getgenv().TurnOnfunction then
        repeat wait(0.0137)
               game:GetService 'VirtualUser':CaptureController()
               game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
        until not getgenv().TurnOnfunction
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local ag = Instance.new("BodyVelocity")
                ag.Velocity = Vector3.new(0, 0, 0)
                ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                ag.P = 9000
                ag.Parent = game.Players.LocalPlayer.Character.Head
                for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
        end
       else 
           if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
               game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
           end
     end
    end
   end)
   
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/lynxloader/Script/main/UIFluents.lua"))()

local Window = Fluent:CreateWindow({
    Title = "VN Hub",
    SubTitle = "[Tech]",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 360),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
}
Tabs.Home:AddParagraph({
    Title = "Welcome To "..game.Players.LocalPlayer.Name.."",
    Content = "Thanks For You Buy Premium Script VN Hub"
})
Tabs.Home:AddParagraph({
    Title = "Verison :",
    Content = "Script Version : [Tech]\n Language : English \n Script Name : "..LRM_ScriptName..""
})
ShopDevilSell = {}
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
for i,v in next,Remote_GetFruits do
    if v.OnSale then 
        table.insert(ShopDevilSell,v.Name)
    end
end
Tabs.Home:AddParagraph({
    Title = "Shop Devils Fruits :",
    Content = "Fruits On Sale : "..ShopDevilSell
})
function CheckRace()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local c4 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if bf == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if c4 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end
Tabs.Home:AddParagraph({
    Title = "Players Status :",
    Content = "Name : "..game.Players.LocalPlayer.Name.." \n Level : "..game.Players.LocalPlayer.Data.Level.Value.." \n Race : "..CheckRace().." \n Beli : "..game.Players.LocalPlayer.Data.Beli.Value.." \n Fragments : "..game.Players.LocalPlayer.Data.Fragments.Value.." Bounty : "..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)..""
})
function MirageIslandCheck()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
       return "✅"
    else
       return "❌"
    end
    return "❌"
end
function KitsuneIslandCheck()
    if game.Workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace.Map.KitsuneIsland then
        return "✅"
    else
        return "❌"
    end
    return "❌"
end
local ServersStatusLabel = Tabs.Home:AddParagraph({
    Title = "Server Status :",
    Content = "Mirage : "..MirageIslandCheck().." \n Kitsune : "..KitsuneIslandCheck().." "
})
spawn(function()
 while wait() do
    ServersStatusLabel:SetDescription("Mirage : "..MirageIslandCheck().." \n Kitsune : "..KitsuneIslandCheck().." \n Full Moon : error")
 end
end)

Tabs.Home:AddParagraph({
    Title = "Your Info :",
    Content = "Discord ID : "..LRM_LinkedDiscordID.."\n Total Run Script : "..LRM_TotalExecutions.." "
})


  for _, Interface in ipairs(game.CoreGui:GetChildren()) do
    if Interface.Name == "Tech" then
       Interface:Destroy()
    end
  end
  local ThunderScreen = Instance.new("ScreenGui")
  local ThunderToggleUI = Instance.new("TextButton")
  local ThunderImageUI = Instance.new("ImageLabel")
  ThunderScreen.Name = "Tech"
  ThunderScreen.Parent = game.CoreGui
  ThunderScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ThunderToggleUI.Name = "ThunderToggleUI"
  ThunderToggleUI.Parent = ThunderScreen
  ThunderToggleUI.BackgroundColor3 = Color3.fromRGB(31,31,31)
  ThunderToggleUI.BorderSizePixel = 0
  ThunderToggleUI.Position = UDim2.new(0.03, 0, 0.02, 0)
  ThunderToggleUI.Size = UDim2.new(0, 50, 0, 50)
  ThunderToggleUI.Font = Enum.Font.SourceSansBold
  ThunderToggleUI.Text = ""
  ThunderToggleUI.TextColor3 = Color3.fromRGB(0, 0, 0)
  ThunderToggleUI.TextSize = 14.000
  ThunderToggleUI.Draggable = true
  ThunderToggleUI.MouseButton1Click:Connect(function()
  game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
  end)
  local ThunderCornerUI = Instance.new("UICorner")
  ThunderCornerUI.Name = "ThunderCornerUI"
  ThunderCornerUI.Parent = ThunderToggleUI
  ThunderImageUI.Name = "MODILEMAGE"
  ThunderImageUI.Parent = ThunderToggleUI
  ThunderImageUI.BackgroundColor3 = Color3.fromRGB(192,192,192)
  ThunderImageUI.BackgroundTransparency = 1.000
  ThunderImageUI.BorderSizePixel = 0
  ThunderImageUI.Position = UDim2.new(0.0, 0, 0.0, 0)
  ThunderImageUI.Size = UDim2.new(0, 50, 0, 50)
  ThunderImageUI.Image = "rbxassetid://15965809846"
  local ThunderCornerUI = Instance.new("UICorner")
  ThunderCornerUI.Name = "ThunderCornerUI"
  ThunderCornerUI.Parent = ThunderImageUI
  
  Window:SelectTab(1)
