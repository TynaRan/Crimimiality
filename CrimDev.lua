local m1=loadstring(game:HttpGet("https://raw.githubusercontent.com/TynaRan/ShadowDarkness/main/Loader.lua"))()
local m2=m1.Window.new("CrimDev v1.0")
local m3=m2:AddTab("Main")
local m4=m3:AddSection("left","Combat")
local m5=m3:AddSection("right","Security")

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
  m6.Brightness=1
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
local m5b={Silent=false,FOV=130,Prediction=0.13,HitChance=100}
local m6=nil

m4:AddTextbox("FOV","130",function(v)m5b.FOV=tonumber(v)or 130 end)
m4:AddTextbox("Prediction","0.13",function(v)m5b.Prediction=tonumber(v)or 0.13 end)
m4:AddTextbox("HitChance","100",function(v)m5b.HitChance=tonumber(v)or 100 end)

m4:AddToggle("Silent Aim",false,function(v)
 m5b.Silent=v
 if v then
  local p=game:GetService("Players")
  local l=p.LocalPlayer
  local c=workspace.CurrentCamera
  local function getClosest()
   local t,d=nil,m5b.FOV
   for _,x in ipairs(p:GetPlayers())do
    if x~=l and x.Character and x.Character:FindFirstChild("HumanoidRootPart") and x.Character:FindFirstChild("Humanoid") and x.Character.Humanoid.Health>0 then
     local pos=c:WorldToViewportPoint(x.Character.HumanoidRootPart.Position)
     local dist=(Vector2.new(pos.X,pos.Y)-Vector2.new(c.ViewportSize.X/2,c.ViewportSize.Y/2)).Magnitude
     if dist<d then t=x.Character.HumanoidRootPart d=dist end
    end
   end
   return t
  end
  m6=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
   local args={...}
   local method=getnamecallmethod()
   if method=="FireServer" and tostring(self):lower():find("hit") and m5b.Silent then
    if math.random(0,100)<=m5.HitChance then
     local t=getClosest()
     if t then
      local predicted=t.Position+(t.Velocity*m5.Prediction)
      args[2].part=t
      args[2].h=t
      args[2].pos=predicted
     end
    end
   end
   return m6(self,unpack(args))
  end))
 else
  m5b.Silent=false
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
local taba = window:AddTab("Info")
local left = taba:AddSection("left", "Credits")
left:AddLabel("Credits:")
left:AddLabel("TynaRan")
left:AddLabel("Conglinduan")
