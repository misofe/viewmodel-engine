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
local Button = toolbar:CreateButton("Load View Model ", "Loads the view model character to be animated or modified", "http://www.roblox.com/asset/?id=8249779339")
Button.ClickableWhenViewportHidden = true
--
function FormatSelections()
	local selections = SEL:Get()
	return 
end
function SetWarning(s)
	warn(s.Name.." successfully appended ".."- "..s.ClassName, s.LinkedSource)
end
--
local B1_CloseSt = true
local B1_Gui
Button.Click:Connect(function()
	local handle 
	if B1_CloseSt then
		B1_CloseSt = not B1_CloseSt
		B1_Gui = script["_1coreguimain"]:Clone()
		B1_Gui.Parent = game.CoreGui
		B1_Gui["Frame"]["Select_Handle"].MouseButton1Click:Connect(function()
			assert(handle:FindFirstAncestorOfClass("Tool") and handle:FindFirstAncestorOfClass("Model"), "Ancestor of the Handle instance must be within a tool or a Model")
			handle = SEL:Get()[1]
			B1_Gui["Frame"]["Select_Handle"]["check_box"].Visible = true
		end)
	else 
		B1_CloseSt = not B1_CloseSt
		B1_Gui:Destroy()
	end
end)
