--
local HTTP = game:GetService("HttpService")
local RS = game:GetService("ReplicatedStorage")
local SS = game:GetService("StudioService")
local UIS = game:GetService("UserInputService")
local RES = game:GetService("RunService")
local CHS = game:GetService("ChangeHistoryService")
local SEL = game:GetService("Selection")
local IS = game:GetService("InsertService")
--
local toolbar = plugin:CreateToolbar("VwMl Engine by AstralNetwork")
local Button = toolbar:CreateButton("Load View Model", "Loads the view model character to be animated or modified", "http://www.roblox.com/asset/?id=8249779339")
Button.ClickableWhenViewportHidden = true
local Button1 = toolbar:CreateButton( "Install", "Installs the VwMl engine into the game", "http://www.roblox.com/asset/?id=8249779339")
Button1.ClickableWhenViewportHidden = true
local Instance2 = require(script.colbert_instance2)
--
function fsel()
	local selections = SEL:Get()
	return 
end
function swarn(s)
	warn(s.Name.." successfully appended ".."- "..s.ClassName, s.LinkedSource)
end
function ungroup(model)
	local mainfirst = model:GetChildren()[1]
	for _, c in pairs(model:GetChildren()) do
		c.Parent = model.Parent
	end
	model:Destroy()
	return mainfirst
end
function rcheck()
	if RS:FindFirstChild("lib") and RS:FindFirstChild("lib")["GunEngine"]["vm"] then 
		if RS:FindFirstChild("ClientModule") and RS:FindFirstChild("ClientModule"):FindFirstChild("util") then
			warn("VM : : Installing Finished")
		else 
			local lib = IS:LoadAsset(8255957772)
			lib.Parent = RS
			ungroup(lib)
			warn("VM : : Installing lib", "Version "..IS:GetLatestAssetVersionAsync(8255957772))
			warn("VM : : Installing Finished")
		end
	else 
		local lib = IS:LoadAsset(8255947059)
		lib.Parent = RS
		lib = ungroup(lib)
		lib["Animations"]["AK47"]:Destroy()
		warn("VM : : Installing Library")
		if RS:FindFirstChild("ClientModule") and RS:FindFirstChild("ClientModule"):FindFirstChild("util") then
			warn("VM : : Installing Finished")
		else 
			local misclib = IS:LoadAsset(8255957772)
			misclib.Parent = RS
			ungroup(misclib)
			warn("VM : : Installing lib", "Version "..IS:GetLatestAssetVersionAsync(8255957772))
		end
	end
end
--
local B1_CloseSt = true
local B1_Gui
Button1.Click:Connect(function()
	rcheck()
end)
Button.Click:Connect(function()
	local handle
	local model
	local tool
	if B1_CloseSt then
		B1_CloseSt = not B1_CloseSt
		B1_Gui = ungroup(IS:LoadAsset(8256031188))
		B1_Gui.Parent = game.CoreGui
		B1_Gui["Frame"]["Select_Handle"].MouseButton1Click:Connect(function()
			tool = handle:FindFirstAncestorOfClass("Tool")
			model = handle:FindFirstAncestorOfClass("Model")
			assert(tool and model, "Ancestor of the Handle instance must be within a tool or a Model")
			handle = SEL:Get()[1]
			rcheck()
			B1_Gui["Frame"]["Select_Handle"]["check_box"].Visible = true
			local newfolder = Instance.new("Folder")
			if RS:FindFirstChild("Library")["GunEngine"]["Animations"]:FindFirstChild(tool.Name) then 
				warn("There are two view model tools set with the same names, consider changing it")
			end
			newfolder.Name = tool.Name	
			newfolder.Parent = RS:FindFirstChild("Library")["GunEngine"]["Animations"]
			local equip, hold, unequip = Instance2.new("Animation", newfolder, "Equip"), Instance2.new("Animation", newfolder, "Hold"), Instance2.new("Animation", newfolder, "Unequip")
		end)
	else 
		B1_CloseSt = not B1_CloseSt
		B1_Gui:Destroy()
	end
end)
