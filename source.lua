-- Define your Roblox UI Library module
local UI = {}

-- Function to create a window with customizable background and title
function UI.createWindow(parent, title, backgroundColor)
    -- Create the main frame for the window
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200) -- Adjust size as needed
    frame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Centered position
    frame.BackgroundColor3 = backgroundColor or Color3.fromRGB(255, 255, 255) -- Default white background
    frame.BorderSizePixel = 0 -- No border

    -- Create a title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 30) -- Full width, 30px height
    titleLabel.Position = UDim2.new(0, 0, 0, 0) -- Top-left corner
    titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark background
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    titleLabel.Text = title or "Window Title" -- Default title
    titleLabel.TextSize = 18 -- Adjust text size
    titleLabel.Font = Enum.Font.SourceSansBold -- Choose a font
    titleLabel.BorderSizePixel = 0 -- No border

    -- Function to allow dragging the window (optional)
    local dragging
    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local initialPosition = frame.Position
            local initialOffset = input.Position - frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
            while dragging do
                local newPosition = input.Position - initialOffset
                frame.Position = UDim2.new(0, newPosition.X, 0, newPosition.Y)
                wait()
            end
        end
    end)

    -- Return the frame as the window object
    return frame
end

return UI -- Return the UI module
