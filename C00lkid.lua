local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GANTI INI DENGAN ASSET ID GAMBAR MU SENDIRI
local ID_DEPAN = "rbxassetid://17317611833"   -- contoh: logo depan c00lkid
local ID_BELAKANG = "rbxassetid://17317613047" -- contoh: logo belakang c00lkid

player.CharacterAdded:Connect(function(char)
	task.wait(1)

	-- 🔴 Warna tubuh merah
	for _, part in ipairs(char:GetChildren()) do
		if part:IsA("BasePart") then
			part.BrickColor = BrickColor.new("Really red")
		end
	end

	-- 🔥 Efek api (optional)
	local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
	if torso then
		local fire = Instance.new("Fire", torso)
		fire.Heat = 5
		fire.Size = 8

		-- 🖼️ Tambah decal depan
		local front = Instance.new("Decal")
		front.Face = Enum.NormalId.Front
		front.Texture = ID_DEPAN
		front.Parent = torso

		-- 🖼️ Tambah decal belakang
		local back = Instance.new("Decal")
		back.Face = Enum.NormalId.Back
		back.Texture = ID_BELAKANG
		back.Parent = torso
	end

	-- 👾 Sembunyikan nama asli
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end

	-- 👾 Tambahkan Billboard nama "c00lkid"
	local head = char:FindFirstChild("Head")
	if head then
		local billboard = Instance.new("BillboardGui", head)
		billboard.Name = "CoolkidName"
		billboard.Size = UDim2.new(0, 200, 0, 50)
		billboard.StudsOffset = Vector3.new(0, 2.5, 0)
		billboard.AlwaysOnTop = true

		local label = Instance.new("TextLabel", billboard)
		label.Size = UDim2.new(1, 0, 1, 0)
		label.Text = "👾 c00lkid 👾"
		label.TextColor3 = Color3.new(1, 0, 0)
		label.BackgroundTransparency = 1
		label.TextScaled = true
		label.Font = Enum.Font.Fantasy
	end
end)
