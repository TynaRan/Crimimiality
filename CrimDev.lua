local m1=loadstring(game:HttpGet("https://raw.githubusercontent.com/TynaRan/ShadowDarkness/main/Loader.lua"))()
local m2=m1.Window.new("CrimDev v1.1")
local m3=m2:AddTab("Main")
local m4=m3:AddSection("left","Combat")
local m5=m3:AddSection("right","Bypass")

local m5a={Camlock=false,Smooth=true,SmoothValue=0.2,Key=Enum.KeyCode.Q,Mobile=game:GetService("UserInputService").TouchEnabled}
local m6=nil

m4:AddTextbox("Smooth Value","0.2",function(v)m5a.SmoothValue=tonumber(v)or 0.2 end)
if not m5a.Mobile then
 m4:AddTextbox("Camlock Key","Q",function(v)m5a.Key=Enum.KeyCode[v]or Enum.KeyCode.Q end)
end
m4:AddToggle("Smooth Toggle",true,function(v)m5a.Smooth=v end)

m4:AddToggle("Camlock(PC)",false,function(v)
 m5a.Camlock=v
 if v then
  local p=game:GetService("Players")
  local u=game:GetService("UserInputService")
  local r=workspace.CurrentCamera
  local s=game:GetService("RunService")
  local l=p.LocalPlayer
  local function getTarget()
   local t,d=nil,1e9
   for _,x in pairs(p:GetPlayers())do
    if x~=l and x.Character and x.Character:FindFirstChild("HumanoidRootPart") and x.Character:FindFirstChild("Humanoid") and x.Character.Humanoid.Health>0 then
     local part=x.Character.HumanoidRootPart
     local dist=(l.Character.HumanoidRootPart.Position-part.Position).Magnitude
     if dist<d then t=part d=dist end
    end
   end
   return t
  end
  m6=s.RenderStepped:Connect(function()
   local t=getTarget()
   if t then
    local cf=CFrame.new(r.CFrame.Position,t.Position)
    r.CFrame=m5a.Smooth and r.CFrame:Lerp(cf,m5a.SmoothValue)or cf
   end
  end)
  if not m5.Mobile then
   u.InputBegan:Connect(function(i,g)
    if not g and i.KeyCode==m5.Key then
     m5a.Camlock=not m5a.Camlock
     if not m5a.Camlock and m6 then m6:Disconnect()m6=nil end
    end
   end)
  end
 else
  if m6 then m6:Disconnect()m6=nil end
 end
end)
--[[
local v1 = {Camlock = false}
local v2 = {Smooth = false, SmoothValue = 0.1} 
local v3 = {Key = Enum.KeyCode.N, Mobile = false}
local v4 = nil
local ui = nil

m4:AddToggle("Camlock(Mobi)",false,function(v)
    v1.Camlock = v
    
    if v then
        ui = Instance.new("ScreenGui", game:GetService("CoreGui"))
        ui.Name = "CamlockUI"

        local frame = Instance.new("Frame", ui)
        frame.Size = UDim2.new(0, 150, 0, 50)
        frame.Position = UDim2.new(1, -160, 0, 20)
        frame.BackgroundColor3 = Color3.new(1, 1, 1)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true

        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 6)

        local shadow = Instance.new("ImageLabel", frame)
        shadow.Name = "Shadow"
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://1316045217"
        shadow.ImageColor3 = Color3.new(0, 0, 0)
        shadow.ImageTransparency = 0.8
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(10, 10, 118, 118)
        shadow.Size = UDim2.new(1, 10, 1, 10)
        shadow.Position = UDim2.new(0, -5, 0, -5)
        shadow.ZIndex = -1

        local title = Instance.new("TextLabel", frame)
        title.Text = "Camlock"
        title.Size = UDim2.new(1, 0, 0, 20)
        title.Position = UDim2.new(0, 0, 0, 5)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.new(0, 0, 0)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 14

        local hotkey = Instance.new("TextLabel", frame)
        hotkey.Text = "Hotkey: ["..tostring(v3.Key).."]"
        hotkey.Size = UDim2.new(1, 0, 0, 20)
        hotkey.Position = UDim2.new(0, 0, 0, 25)
        hotkey.BackgroundTransparency = 1
        hotkey.TextColor3 = Color3.new(0.5, 0.5, 0.5)
        hotkey.Font = Enum.Font.Gotham
        hotkey.TextSize = 12

        local toggleBtn = Instance.new("TextButton", frame)
        toggleBtn.Text = "OFF"
        toggleBtn.Size = UDim2.new(0, 40, 0, 20)
        toggleBtn.Position = UDim2.new(1, -45, 0, 5)
        toggleBtn.BackgroundColor3 = Color3.new(0.9, 0.2, 0.2)
        toggleBtn.TextColor3 = Color3.new(1, 1, 1)
        toggleBtn.Font = Enum.Font.GothamBold
        toggleBtn.TextSize = 12

        toggleBtn.MouseButton1Click:Connect(function()
            v1.Camlock = not v1.Camlock
            if v1.Camlock then
                toggleBtn.Text = "ON"
                toggleBtn.BackgroundColor3 = Color3.new(0.2, 0.9, 0.2)
            else
                toggleBtn.Text = "OFF"
                toggleBtn.BackgroundColor3 = Color3.new(0.9, 0.2, 0.2)
                if v4 then v4:Disconnect() v4=nil end
            end
        end)

        local p = game:GetService("Players")
        local u = game:GetService("UserInputService")
        local r = workspace.CurrentCamera
        local s = game:GetService("RunService")
        local l = p.LocalPlayer

        local function getTarget()
            local t,d = nil,1e9
            for _,x in pairs(p:GetPlayers())do
                if x~=l and x.Character and x.Character:FindFirstChild("HumanoidRootPart") and x.Character:FindFirstChild("Humanoid") and x.Character.Humanoid.Health>0 then
                    local part = x.Character.HumanoidRootPart
                    local dist = (l.Character.HumanoidRootPart.Position-part.Position).Magnitude
                    if dist<d then t=part d=dist end
                end
            end
            return t
        end

        v4 = s.RenderStepped:Connect(function()
            if v1.Camlock then
                local t = getTarget()
                if t then
                    local cf = CFrame.new(r.CFrame.Position,t.Position)
                    r.CFrame = v2.Smooth and r.CFrame:Lerp(cf,v2.SmoothValue) or cf
                end
            end
        end)

        if not v3.Mobile then
            u.InputBegan:Connect(function(i,g)
                if not g and i.KeyCode == v3.Key then
                    v1.Camlock = not v1.Camlock
                    if v1.Camlock then
                        toggleBtn.Text = "ON"
                        toggleBtn.BackgroundColor3 = Color3.new(0.2, 0.9, 0.2)
                    else
                        toggleBtn.Text = "OFF"
                        toggleBtn.BackgroundColor3 = Color3.new(0.9, 0.2, 0.2)
                    end
                end
            end)
        end
    else
        if v4 then v4:Disconnect() v4=nil end
        if ui then ui:Destroy() ui=nil end
    end
end)
--]]
local v1 = {Camlock = false}
local v2 = {Smooth = false, SmoothValue = 0.1} 
local v3 = {Key = Enum.KeyCode.N, Mobile = false}
local v4 = nil
local ui = nil

local function updateCamlockState()
    if v1.Camlock then
        local p = game:GetService("Players")
        local u = game:GetService("UserInputService")
        local r = workspace.CurrentCamera
        local s = game:GetService("RunService")
        local l = p.LocalPlayer

        local function getTarget()
            local t,d = nil,1e9
            for _,x in pairs(p:GetPlayers())do
                if x~=l and x.Character and x.Character:FindFirstChild("HumanoidRootPart") and x.Character:FindFirstChild("Humanoid") and x.Character.Humanoid.Health>0 then
                    local part = x.Character.HumanoidRootPart
                    local dist = (l.Character.HumanoidRootPart.Position-part.Position).Magnitude
                    if dist<d then t=part d=dist end
                end
            end
            return t
        end

        v4 = s.RenderStepped:Connect(function()
            local t = getTarget()
            if t then
                local cf = CFrame.new(r.CFrame.Position,t.Position)
                r.CFrame = cf
            end
        end)

        if not v3.Mobile then
            u.InputBegan:Connect(function(i,g)
                if not g and i.KeyCode == v3.Key then
                    v1.Camlock = not v1.Camlock
                    if ui and ui:FindFirstChild("CamlockUI") then
                        local toggleBtn = ui.CamlockUI:FindFirstChildOfClass("TextButton")
                        if toggleBtn then
                            toggleBtn.Text = v1.Camlock and "ON" or "OFF"
                            toggleBtn.BackgroundColor3 = v1.Camlock and Color3.new(0.2, 0.9, 0.2) or Color3.new(0.9, 0.2, 0.2)
                        end
                    end
                    if not v1.Camlock and v4 then 
                        v4:Disconnect() 
                        v4=nil 
                    end
                end
            end)
        end
    else
        if v4 then 
            v4:Disconnect() 
            v4=nil 
        end
    end
end

m4:AddToggle("Camlock",false,function(v)
    v1.Camlock = v
    
    if v then
        ui = Instance.new("ScreenGui", game:GetService("CoreGui"))
        ui.Name = "CamlockUI"

        local frame = Instance.new("Frame", ui)
        frame.Size = UDim2.new(0, 150, 0, 50)
        frame.Position = UDim2.new(1, -160, 0, 20)
        frame.BackgroundColor3 = Color3.new(1, 1, 1)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true

        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 6)

        local shadow = Instance.new("ImageLabel", frame)
        shadow.Name = "Shadow"
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://1316045217"
        shadow.ImageColor3 = Color3.new(0, 0, 0)
        shadow.ImageTransparency = 0.8
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(10, 10, 118, 118)
        shadow.Size = UDim2.new(1, 10, 1, 10)
        shadow.Position = UDim2.new(0, -5, 0, -5)
        shadow.ZIndex = -1

        local title = Instance.new("TextLabel", frame)
        title.Text = "Camlock Control"
        title.Size = UDim2.new(1, 0, 0, 20)
        title.Position = UDim2.new(0, 0, 0, 5)
        title.BackgroundTransparency = 1
        title.TextColor3 = Color3.new(0, 0, 0)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 14

        local hotkey = Instance.new("TextLabel", frame)
        hotkey.Text = "Hotkey: ["..tostring(v3.Key).."]"
        hotkey.Size = UDim2.new(1, 0, 0, 20)
        hotkey.Position = UDim2.new(0, 0, 0, 25)
        hotkey.BackgroundTransparency = 1
        hotkey.TextColor3 = Color3.new(0.5, 0.5, 0.5)
        hotkey.Font = Enum.Font.Gotham
        hotkey.TextSize = 12

        local toggleBtn = Instance.new("TextButton", frame)
        toggleBtn.Name = "ToggleButton"
        toggleBtn.Text = v1.Camlock and "ON" or "OFF"
        toggleBtn.Size = UDim2.new(0, 40, 0, 20)
        toggleBtn.Position = UDim2.new(1, -45, 0, 5)
        toggleBtn.BackgroundColor3 = v1.Camlock and Color3.new(0.2, 0.9, 0.2) or Color3.new(0.9, 0.2, 0.2)
        toggleBtn.TextColor3 = Color3.new(1, 1, 1)
        toggleBtn.Font = Enum.Font.GothamBold
        toggleBtn.TextSize = 12

        toggleBtn.MouseButton1Click:Connect(function()
            v1.Camlock = not v1.Camlock
            toggleBtn.Text = v1.Camlock and "ON" or "OFF"
            toggleBtn.BackgroundColor3 = v1.Camlock and Color3.new(0.2, 0.9, 0.2) or Color3.new(0.9, 0.2, 0.2)
            updateCamlockState()
        end)

        updateCamlockState()
    else
        if v4 then 
            v4:Disconnect() 
            v4=nil 
        end
        if ui then 
            ui:Destroy() 
            ui=nil 
        end
    end
end)
m4:AddToggle("ESP",false,function(v)
 if v then
  local m6=game:GetService("Players")
  local m7=m6.LocalPlayer
  local m8=game:GetService("RunService")
  m8.RenderStepped:Connect(function()
   for _,p in pairs(m6:GetPlayers())do
    if p~=m7 and p.Character and p.Character:FindFirstChild("HumanoidRootPart")and not p.Character:FindFirstChild("ESPHighlight")then
     local h=Instance.new("Highlight",p.Character)
     h.Name="ESPHighlight"
     h.FillColor=Color3.fromRGB(255,0,0)
     h.OutlineColor=Color3.fromRGB(255,255,255)
     h.FillTransparency=0.5
     h.OutlineTransparency=0
    end
   end
  end)
 end
end)

m4:AddToggle("Jump No CD",false,function(v)
 if v then
  local m6=game:GetService("Players").LocalPlayer
  local m7
  m7=hookmetamethod(game,"__newindex",function(t,k,val)
   if t:IsDescendantOf(m6.Character) and k=="Jump" and val==false then return end
   return m7(t,k,val)
  end)
 end
end)
--[[
m5:AddToggle("Chat Spy",false,function(v)
 if v then
  local m6=game:GetService("Players")
  local m7=m6.LocalPlayer.PlayerGui.Chat.Frame
  m7.ChatChannelParentFrame.Visible=true
  m7.ChatBarParentFrame.Position=UDim2.new(0,0,1,-42)
  local m8=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering
  m8.OnClientEvent:Connect(function(msg,channel)
   if msg and msg.FromSpeaker and msg.Message then
    print(string.format("[%s]: %s",msg.FromSpeaker,msg.Message))
   end
  end)
 end
end)
--]]
m5:AddToggle("Anti Lag",false,function(v)
 if v then
  local m6=game:GetService("Lighting")
  m6.FogEnd=1e9
  m6.Brightness=4
  m6.GlobalShadows=false
  for _,o in pairs(m6:GetDescendants())do
   if o:IsA("BloomEffect")or o:IsA("BlurEffect")or o:IsA("SunRaysEffect")or o:IsA("ColorCorrectionEffect")then o.Enabled=false end
  end
  for _,o in pairs(workspace:GetDescendants())do
   if o:IsA("Decal")or o:IsA("Texture")then o.Transparency=1
   elseif o:IsA("ParticleEmitter")or o:IsA("Trail")then o.Enabled=false end
  end
 end
end)

m5:AddToggle("Bypass Ban",false,function(v)
 if v then
  for _,t in ipairs(getgc(true))do
   if typeof(t)=="table"then
    if rawget(t,"A")and rawget(t,"B")and rawget(t,"EN")and rawget(t,"GP")then
     if typeof(t.A)=="function"then hookfunction(t.A,function()end)end
     if typeof(t.B)=="function"then hookfunction(t.B,function()end)end
    end
    for k,f in pairs(t)do
     if typeof(f)=="function"and tostring(k):lower():find("kick")or tostring(k):lower():find("detect")then
      hookfunction(f,function()end)
     end
    end
   end
  end
 end
end)

m5:AddToggle("No Detection (Instance)",false,function(v)
 if v then
  for _,t in next,getgc(true)do
   if typeof(t)=="table"and(rawget(t,"indexInstance")or rawget(t,"newindexInstance")or rawget(t,"newIndexInstance"))then
    t.tvk={"kick",function()return task.wait(9e9)end}
   end
  end
 end
end)

m5:AddToggle("No Detection (Detected)",false,function(v)
 if v then
  for _,f in pairs(getgc(true))do
   if typeof(f)=="function"then
    for i=1,debug.getinfo(f).nups do
     local n,val=debug.getupvalue(f,i)
     if n=="Detected"and typeof(val)=="boolean"then debug.setupvalue(f,i,false)end
    end
   end
  end
 end
end)

m5:AddToggle("Anti Admin Detection",false,function(v)
 if v then
  for _,f in pairs(getgc(true))do
   if typeof(f)=="function"and islclosure(f)then
    local c=getconstants(f)
    if table.find(c,"Detected")and table.find(c,"Kick")and table.find(c,"IsStudio")then
     hookfunction(f,function()return Instance.new("BindableEvent").Event:Wait()end)
    end
   end
  end
 end
end)

m4:AddToggle("No Spread",false,function(v)
 if v then
  local h
  h=hookfunction(getrenv().CFrame.Angles,function(...)
   local a={...}
   local i=debug.info(3,"f")
   if not getfenv(i).script and getinfo(i).name~="updtCam"then
    local u=getupvalue(getinfo(i).func,1)
    if u and typeof(u)=="userdata"then
     a[1],a[2],a[3]=0,0,0
    end
   end
   return h(unpack(a))
  end)
 end
end)

m4:AddToggle("Anti Animation",false,function(v)
 if v then
  local a=Instance.new("Animation")
  a.AnimationId="rbxassetid://215384594"
  a.Parent=game:GetService("CoreGui")
 end
end)

m4:AddToggle("Infinite Stamina",false,function(v)
 if v then
  local f=getupvalue(getupvalue(getrenv()._G.S_Take,2),1)
  hookfunction(f,function()return 100,100 end)
 end
end)
local Settings = {
 Thickness = 2,
 VisibleColor = Color3.fromRGB(0,255,0),
 HiddenColor = Color3.fromRGB(120,120,120),
 HPBarWidth = 4,
 HPBarHeight = 60
}
local Drawn = {}
local Loop = nil
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

local function GetVisible(part)
 local rayParams = RaycastParams.new()
 rayParams.FilterDescendantsInstances = {Players.LocalPlayer.Character}
 rayParams.FilterType = Enum.RaycastFilterType.Blacklist
 local result = workspace:Raycast(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 500, rayParams)
 return not result or result.Instance:IsDescendantOf(part.Parent)
end

local function Skeleton(player)
 if not player.Character then return end
 local limbs = {
  {player.Character:FindFirstChild("Head"), player.Character:FindFirstChild("Torso")},
  {player.Character:FindFirstChild("Torso"), player.Character:FindFirstChild("Left Arm")},
  {player.Character:FindFirstChild("Torso"), player.Character:FindFirstChild("Right Arm")},
  {player.Character:FindFirstChild("Torso"), player.Character:FindFirstChild("Left Leg")},
  {player.Character:FindFirstChild("Torso"), player.Character:FindFirstChild("Right Leg")}
 }
 if not Drawn[player] then
  Drawn[player] = {Lines={},HPBar=nil}
  for i = 1, #limbs do
   local l = Drawing.new("Line")
   l.Thickness = Settings.Thickness
   l.Visible = false
   Drawn[player].Lines[i] = l
  end
  local bar = Drawing.new("Line")
  bar.Thickness = Settings.HPBarWidth
  bar.Visible = false
  Drawn[player].HPBar = bar
 end
 for i, pair in ipairs(limbs) do
  local a,b = pair[1],pair[2]
  if a and b then
   local aPos,onA = Camera:WorldToViewportPoint(a.Position)
   local bPos,onB = Camera:WorldToViewportPoint(b.Position)
   local visA = GetVisible(a)
   local visB = GetVisible(b)
   if onA and onB then
    local d = Drawn[player].Lines[i]
    d.From = Vector2.new(aPos.X, aPos.Y)
    d.To = Vector2.new(bPos.X, bPos.Y)
    d.Color = visA and visB and Settings.VisibleColor or Settings.HiddenColor
    d.Visible = true
   else
    Drawn[player].Lines[i].Visible = false
   end
  end
 end
 local head = player.Character:FindFirstChild("Head")
 local hum = player.Character:FindFirstChild("Humanoid")
 if head and hum then
  local pos, on = Camera:WorldToViewportPoint(head.Position)
  if on then
   local ratio = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
   local top = Vector2.new(pos.X - 30, pos.Y - 25)
   local bottom = Vector2.new(pos.X - 30, pos.Y - 25 + Settings.HPBarHeight * ratio)
   local clr = Color3.fromRGB(255 * (1 - ratio),255 * ratio,0)
   local bar = Drawn[player].HPBar
   bar.From = top
   bar.To = bottom
   bar.Color = clr
   bar.Visible = true
  else
   Drawn[player].HPBar.Visible = false
  end
 end
end
local tab=m2:AddTab("Visual")
local sec=tab:AddSection("left","Drawing")

sec:AddTextbox("Line Thickness","1",function(v)Settings.Thickness=tonumber(v)or 1 end)
sec:AddTextbox("Visible Color RGB","0,255,0",function(v)local r,g,b=v:match("(%d+),(%d+),(%d+)")Settings.VisibleColor=Color3.fromRGB(tonumber(r),tonumber(g),tonumber(b))end)
sec:AddTextbox("Hidden Color RGB","120,120,120",function(v)local r,g,b=v:match("(%d+),(%d+),(%d+)")Settings.HiddenColor=Color3.fromRGB(tonumber(r),tonumber(g),tonumber(b))end)

sec:AddToggle("Bone + HPBar Drawing",false,function(v)
 if v then
  Loop = game:GetService("RunService").RenderStepped:Connect(function()
   for _,p in pairs(Players:GetPlayers())do
    if p~=Players.LocalPlayer then Skeleton(p)end
   end
  end)
 else
  if Loop then Loop:Disconnect() Loop=nil end
  for _,pack in pairs(Drawn)do
   for _,l in pairs(pack.Lines)do l:Remove()end
   pack.HPBar:Remove()
  end
  Drawn = {}
 end
end)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local Config = {
 WalkSpeed = 20,
 FieldOfView = 80
}

local loop
m4:AddTextbox("WalkSpeed", "20", function(v)
 Config.WalkSpeed = tonumber(v) or 16
end)

m4:AddTextbox("FOV", "80", function(v)
 Config.FieldOfView = tonumber(v) or 70
end)

m4:AddToggle("Loop Speed/FOV", false, function(state)
 if state then
  loop = RunService.RenderStepped:Connect(function()
   if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
    LocalPlayer.Character.Humanoid.WalkSpeed = Config.WalkSpeed
   end
   Camera.FieldOfView = Config.FieldOfView
  end)
 else
  if loop then loop:Disconnect() loop = nil end
 end
end)
m5:AddToggle("No WalkSpeed Detection", false, function(state)
 if state then
  for _, v in pairs(getgc(true)) do
   if typeof(v) == "table" and rawget(v, "DTXC1") then
    hookfunction(v.DTXC1, function() return end)
   end
  end
 end
end)
local taba = m2:AddTab("Info")
local left = taba:AddSection("left", "Credits")
left:AddLabel("Credits:")
left:AddLabel("TynaRan")
left:AddLabel("Conglinduan")
local PlayersService = game:GetService("Players")
local RunService = game:GetService("RunService")
local WorkspaceService = game:GetService("Workspace")
local DebrisService = game:GetService("Debris")
local LocalPlayer = PlayersService.LocalPlayer

local VisualToggle = false
local HealthRecords = {}

local VisualSection = tab:AddSection("right", "Visual")
VisualSection:AddToggle("Bullet Ray", false, function(state)
 VisualToggle = state
end)

local function PlayerHasTool(targetPlayer)
 for _, toolInstance in pairs(targetPlayer.Character:GetChildren()) do
  if toolInstance:IsA("Tool") then
   return true
  end
 end
 return false
end

local function CreateBulletVisual(startPos, endPos)
 local direction = endPos - startPos
 local range = direction.Magnitude

 local attachmentStart = Instance.new("Attachment")
 local attachmentEnd = Instance.new("Attachment")
 attachmentStart.WorldPosition = startPos
 attachmentEnd.WorldPosition = endPos
 attachmentStart.Parent = WorkspaceService.Terrain
 attachmentEnd.Parent = WorkspaceService.Terrain

 local beamEffect = Instance.new("Beam")
 beamEffect.Attachment0 = attachmentStart
 beamEffect.Attachment1 = attachmentEnd
 beamEffect.Width0 = 0.5
 beamEffect.Width1 = 0.35
 beamEffect.Color = ColorSequence.new{
  ColorSequenceKeypoint.new(0, Color3.fromRGB(0,230,255)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(0,100,210))
 }
 beamEffect.FaceCamera = true
 beamEffect.LightEmission = 1
 beamEffect.LightInfluence = 1
 beamEffect.Texture = "rbxassetid://446111271"
 beamEffect.TextureMode = Enum.TextureMode.Wrap
 beamEffect.TextureSpeed = 8
 beamEffect.CurveSize0 = 0.3
 beamEffect.Transparency = NumberSequence.new{
  NumberSequenceKeypoint.new(0, 0.02),
  NumberSequenceKeypoint.new(0.5, 0.08),
  NumberSequenceKeypoint.new(1, 0.5)
 }
 beamEffect.Parent = attachmentStart

 local particleFlash = Instance.new("ParticleEmitter")
 particleFlash.Texture = "rbxassetid://2529074587"
 particleFlash.Lifetime = NumberRange.new(0.25)
 particleFlash.Rate = 999
 particleFlash.Speed = NumberRange.new(0)
 particleFlash.ZOffset = 2
 particleFlash.Rotation = NumberRange.new(0,360)
 particleFlash.Size = NumberSequence.new{
  NumberSequenceKeypoint.new(0, 0.7),
  NumberSequenceKeypoint.new(1, 0)
 }
 particleFlash.LightEmission = 1
 particleFlash.Color = ColorSequence.new{
  ColorSequenceKeypoint.new(0, Color3.fromRGB(0,220,255)),
  ColorSequenceKeypoint.new(1, Color3.fromRGB(0,120,220))
 }
 particleFlash.Parent = attachmentEnd

 local pointLight = Instance.new("PointLight")
 pointLight.Color = Color3.fromRGB(0,200,255)
 pointLight.Range = 6
 pointLight.Brightness = 5
 pointLight.Shadows = true
 pointLight.Parent = attachmentEnd

 local meshRay = Instance.new("MeshPart")
 meshRay.Anchored = true
 meshRay.CanCollide = false
 meshRay.Size = Vector3.new(0.4, 0.4, range)
 meshRay.CFrame = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -range / 2)
 meshRay.Material = Enum.Material.Neon
 meshRay.Color = Color3.fromRGB(0,200,255)
 meshRay.Transparency = 0.1
 meshRay.MeshId = "rbxassetid://7767422366"
 meshRay.Parent = WorkspaceService

 local neonRay = Instance.new("Part")
 neonRay.Anchored = true
 neonRay.CanCollide = false
 neonRay.Size = Vector3.new(0.25, 0.25, range)
 neonRay.CFrame = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -range / 2)
 neonRay.Material = Enum.Material.Neon
 neonRay.Color = Color3.fromRGB(0,230,255)
 neonRay.Transparency = 0.05
 neonRay.Parent = WorkspaceService

 local hitSound = Instance.new("Sound")
 hitSound.SoundId = "rbxassetid://160432334"
 hitSound.Volume = 1
 hitSound.PlayOnRemove = true
 hitSound.Parent = attachmentEnd
 hitSound:Destroy()

 DebrisService:AddItem(attachmentStart, 0.35)
 DebrisService:AddItem(attachmentEnd, 0.35)
 DebrisService:AddItem(beamEffect, 0.35)
 DebrisService:AddItem(particleFlash, 0.35)
 DebrisService:AddItem(pointLight, 0.35)
 DebrisService:AddItem(meshRay, 0.35)
 DebrisService:AddItem(neonRay, 0.35)
end

RunService.Heartbeat:Connect(function()
 if not VisualToggle then return end
 for _, targetPlayer in pairs(PlayersService:GetPlayers()) do
  if targetPlayer ~= LocalPlayer and targetPlayer.Character and PlayerHasTool(targetPlayer) then
   local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
   local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
   local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
   if humanoid and rootPart and localRoot then
    local currentHealth = humanoid.Health
    local previousHealth = HealthRecords[targetPlayer] or currentHealth
    HealthRecords[targetPlayer] = currentHealth
    local distance = (rootPart.Position - localRoot.Position).Magnitude
    if distance < 50 and currentHealth < previousHealth then
     CreateBulletVisual(localRoot.Position, rootPart.Position)
    end
   end
  end
 end
end)
VisualSection:AddToggle("Silent Aim", false, function(state)
 if not state then return end

 local Players = game:GetService("Players")
 local LocalPlayer = Players.LocalPlayer

 local is_safecall = function()
  local ok = pcall(function()
   return getrenv and typeof(getrenv()) == "table"
  end)
  return ok
 end

 local RaycastClosure = function(self, ...)
  local args = {select(2, ...)}
  local direction = args[2]
  local params = args[3]

  local character = LocalPlayer.Character
  local root = character and character:FindFirstChild("HumanoidRootPart")
  if not root or typeof(direction) ~= "Vector3" then return self:Raycast(unpack(args)) end

  local closest, dist = nil, math.huge
  for _, plr in ipairs(Players:GetPlayers()) do
   if plr ~= LocalPlayer and plr.Character then
    local hum = plr.Character:FindFirstChild("Humanoid")
    local head = plr.Character:FindFirstChild("Head")
    if hum and head and hum.Health > 0 then
     for _, tool in ipairs(plr.Character:GetChildren()) do
      if tool:IsA("Tool") then
       local d = (head.Position - root.Position).Magnitude
       if d < dist then
        closest = head
        dist = d
       end
       break
      end
     end
    end
   end
  end

  if not closest then return self:Raycast(unpack(args)) end

  args[1] = root
  args[2] = CFrame.lookAt(root.Position, closest.Position).LookVector * direction.Magnitude
  args[3] = params

  local ok, res = pcall(function()
   return self:Raycast(unpack(args))
  end)

  return ok and res or self:Raycast(unpack(args))
 end

 local hook = hookmetamethod(game, "__namecall", function(self, ...)
  if getnamecallmethod() ~= "Raycast" or checkcaller() then return hook(self, ...) end
  local caller = getcallingscript()
  if caller and typeof(caller) == "Instance" then
   local name = tostring(caller)
   if name == "ControlScript" or name == "ControlModule" then return hook(self, ...) end
  end
  if not is_safecall() then return hook(self, ...) end
  return RaycastClosure(self, ...)
 end)
end)
