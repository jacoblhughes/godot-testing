local sprite = app.activeSprite

if sprite == nil then
    app.alert("There is no active sprite")
    return
end

-- Create a new layer called "Merged Layer"
app.command.NewLayer {
    name = "Merged Layer"
}

local mergedLayer = sprite.layers[#sprite.layers]

-- Iterate over all frames
for frameNumber=1, #sprite.frames do
    -- Create an empty image for the merged layer in this frame
    local mergedImage = Image(sprite.width, sprite.height)

    -- Iterate over all layers (bottom to top)
    for i=1, #sprite.layers do
        local layer = sprite.layers[i]

        -- Check if the layer is visible and has a cel in this frame
        if layer.isVisible and layer:cel(frameNumber) then
            -- Composite the cel image onto the merged image
            local cel = layer:cel(frameNumber)
            mergedImage:drawImage(cel.image, cel.position)
        end
    end

    -- Add the merged image to the merged layer in this frame
    sprite:newCel(mergedLayer, frameNumber, mergedImage)
end
