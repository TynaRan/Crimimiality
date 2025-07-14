--Crimimiality Dev v1
--By Darkness
local m1=loadstring(game:HttpGet("https://raw.githubusercontent.com/TynaRan/ShadowDarkness/main/Loader.lua"))()
local m2=m1.Window.new("Criminality UI")
local m3=m2:AddTab("Main")
local m4=m3:AddSection("left","Combat")
local m5=m3:AddSection("right","Security")
local m5={Camlock=false,Smooth=true,SmoothValue=0.2,Key=Enum.KeyCode.Q,Mobile=game:GetService("UserInputService").TouchEnabled}
local m6=nil

m4:AddTextbox("Smooth Value","0.2",function(v)m5.SmoothValue=tonumber(v)or 0.2 end)
if not m5.Mobile then
 m4:AddTextbox("Camlock Key","Q",function(v)m5.Key=Enum.KeyCode[v]or Enum.KeyCode.Q end)
end
m4:AddToggle("Smooth Toggle",true,function(v)m5.Smooth=v end)

m4:AddToggle("Camlock",false,function(v)
 m5.Camlock=v
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
    r.CFrame=m5.Smooth and r.CFrame:Lerp(cf,m5.SmoothValue)or cf
   end
  end)
  if not m5.Mobile then
   u.InputBegan:Connect(function(i,g)
    if not g and i.KeyCode==m5.Key then
     m5.Camlock=not m5.Camlock
     if not m5.Camlock and m6 then m6:Disconnect()m6=nil end
    end
   end)
  end
 else
  if m6 then m6:Disconnect()m6=nil end
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
     a[1] = 0,
     a[2] = 0,
     a[3] = 0
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
local m5={Silent=false,FOV=130,Prediction=0.13,HitChance=100}
local m6=nil

m4:AddTextbox("FOV","130",function(v)m5.FOV=tonumber(v)or 130 end)
m4:AddTextbox("Prediction","0.13",function(v)m5.Prediction=tonumber(v)or 0.13 end)
m4:AddTextbox("HitChance","100",function(v)m5.HitChance=tonumber(v)or 100 end)

m4:AddToggle("Silent Aim",false,function(v)
 m5.Silent=v
 if v then
  local p=game:GetService("Players")
  local l=p.LocalPlayer
  local c=workspace.CurrentCamera
  local function getClosest()
   local t,d=nil,m5.FOV
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
   if method=="FireServer" and tostring(self):lower():find("hit") and m5.Silent then
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
  m5.Silent=false
 end
end)
