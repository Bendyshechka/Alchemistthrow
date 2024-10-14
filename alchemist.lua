local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Bendyshechka/Alchemistthrow/refs/heads/main/Library')))()

local Window = OrionLib:MakeWindow({Name = "Slap Battles Алхемист👽👽👽", HidePremium = false, SaveConfig = false})

_G.GetPotion = {
	["Grug"] = {"Mushroom"},
	["idIot"] = {"Cake Mix"},
	["Nightmare"] = {"Dark Root","Dark Root","Dark Root"},
	["Confusion"] = {"Red Crystal","Blue Crystal","Glowing Mushroom"},
	["Power"] = {"Dire Flower","Red Crystal","Wild Vine"},
	["Paralyzing"] = {"Plane Flower","Plane Flower"},
	["Haste"] = {"Autumn Sprout","Jade Stone"},
	["Invisibility"] = {"Hazel Lily","Hazel Lily","Blue Crystal"},
	["Explosion"] = {"Red Crystal","Fire Flower","Fire Flower"},
	["Invincible"] = {"Elder Wood","Mushroom","Mushroom"},
	["Toxic"] = {"Dark Root","Dark Root","Blood Rose","Red Crystal"},
	["Freeze"] = {"Winter Rose","Winter Rose","Wild Vine","Blue Crystal","Glowing Mushroom"},
	["Feather"] = {"Mushroom","Hazel Lily"},
	["Speed"] = {"Mushroom","Mushroom","Plane Flower","Hazel Lily","Blue Crystal"},
	["Lethal"] = {"Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Blood Rose","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root","Dark Root"},
	["Slow"] = {"Mushroom","Mushroom","Blue Crystal","Blue Crystal","Jade Stone","Plane Flower"},
	["Antitoxin"] = {"Blue Crystal","Glowing Mushroom","Plane Flower","Plane Flower","Elder Wood"},
	["Corrupted Vine"] = {"Wild Vine","Wild Vine","Wild Vine","Blood Rose","Dark Root","Elder Wood","Jade Stone"},
	["Field"] = {"Hazel Lily","Plane Flower","Plane Flower"}
}

local Tab = Window:MakeTab({
	Name = "Информация😒",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Отлично","Добро пожаловать в тоже самый ахуенный скрипт от сигмы момент!")
Tab:AddLabel("Здесь ты можешь хуячить зелья!")

local Tab1 = Window:MakeTab({
	Name = "Выдавалка зелек👽👽👽",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab1:AddDropdown({
    Name = "Выбери зелье😈",
    Default = "Speed Potion",
    Options = {"Grug", "idIot", "Nightmare", "Confusion", "Power", "Paralyzing", "Haste", "Invisibility", "Explosion", "Invincible", "Toxic", "Freeze", "Feather", "Speed", "Lethal", "Slow", "Antitoxin"},
    Callback = function(Value)
        _G.MakePotion = Value
    end    
})

PotionAuto = Tab1:AddToggle({
	Name = "Выдать зельки",
	Default = false,
	Callback = function(Value)
_G.AutoGetPotion = Value
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
while _G.AutoGetPotion do
if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron") then
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
for i = 1, #_G.GetPotion[_G.MakePotion] do
game.ReplicatedStorage:WaitForChild("AlchemistEvent"):FireServer(unpack({"AddItem", _G.GetPotion[_G.MakePotion][i]}))
game.ReplicatedStorage:WaitForChild("AlchemistEvent"):FireServer(unpack({"MixItem", _G.GetPotion[_G.MakePotion][i]}))
end
game.ReplicatedStorage:WaitForChild("AlchemistEvent"):FireServer(unpack({"BrewPotion"}))
task.wait()
end
elseif _G.AutoGetPotion == true then
OrionLib:MakeNotification({Name = "Error",Content = "You don't have Alchemist equipped",Image = "rbxassetid://7733658504",Time = 5})
wait(0.05)
PotionAuto:Set(false)
end
	end    
})

local Tab3 = Window:MakeTab({
	Name = "Бомбёшка",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab3:AddDropdown({
    Name = "Выбери зелье😈",
    Default = "Speed Potion",
    Options = {"Grug Potion", "IdIot Potion", "Nightmare Potion", "Confusion Potion", "Power Potion", "Paralyzing Potion", "Haste Potion", "Invisibility Potion", "Expotion", "Invincible Potion", "Toxic Potion", "Freeze Potion", "Feather Potion", "Speed Potion", "Lethal Poison", "Slow Potion", "Antitoxin Potion"},
    Callback = function(Value)
        _G.PotionThrownNuke = Value
    end    
})

if _G.NukeExtend == nil then
    _G.NukeExtend = "90"
end
Tab3:AddTextbox({
    Name = "Выбери дистанцию от себя😈",
    Default = "UseNumber",
    TextDisappear = false,
    Callback = function(Value)
        _G.NukeExtend = Value
    end    
})

PotionThrowNukeAuto = Tab3:AddToggle({
    Name = "Врубить бомбёжку",
    Default = false,
    Callback = function(Value)
        _G.AutoThrowPotion = Value
        if _G.AutoThrowPotion == false then
            -- Возвращаем камеру на персонажа игрока при отключении автокидания
            if game.Workspace.CurrentCamera and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                game.Workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
        end
        
        -- Проверка условий для автокидания
        if _G.AutoThrowPotion == true and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
            -- Автокидание зелий вокруг игрока
            while _G.AutoThrowPotion do
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart then
                    -- Выбираем случайные координаты вокруг игрока без телепортации
                    local randomOffsetX = math.random(-_G.NukeExtend, _G.NukeExtend)
                    local randomOffsetZ = math.random(-_G.NukeExtend, _G.NukeExtend)
                    
                    -- Получаем точку в пространстве вокруг игрока
                    local potionThrowPosition = humanoidRootPart.Position + Vector3.new(randomOffsetX, 0, randomOffsetZ)
                    
                    -- Кидаем зелье в выбранную позицию вокруг игрока
                    game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("UsePotion", _G.PotionThrownNuke, potionThrowPosition)
                end
                
                -- Ожидание перед следующим броском
                wait(0.000001)
            end
        elseif _G.AutoThrowPotion == true then
            -- Уведомление об ошибке, если игрок не экипировал Alchemist или находится в лобби
            OrionLib:MakeNotification({
                Name = "Ошибка!",
                Content = "У тебя не экипирован алхимист или ты не в лобби!",
                Image = "rbxassetid://7733658504",
                Time = 5
            })
            wait(0.05)
            PotionThrowNukeAuto:Set(false)
        end
    end    
})

Tab3:AddParagraph("Слушай","Бомбится там, куда ты смотришь")
