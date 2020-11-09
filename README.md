# PlayerBhopHook
A simple script that adds a hook for if a player hits a bhop or misses a bhop

## How to use
Add a hook to `PlayerBhopped` with [hook.Add](https://wiki.facepunch.com/gmod/hook.Add)

## Arguments
Argument | Use
---------|----
ply | The player that bhopped
hit | `true` if the player successfully hit the bhop, `false` if they missed
mv | The move data
cmd | The command data

## Example
Example code that counts how many bhops a player has hit in a row

```lua
hook.Add("PlayerBhopped", "BhopCounter", function(ply, hit)

  ply.BhopCount = ply.BhopCount || 0

  if hit then
    ply.BhopCount = ply.BhopCount + 1

    print(ply:Name() .. " is on a " .. ply.BhopCount .. " bhop streak with " .. math.Round(ply:GetVelocity():Length2D()) .. " speed")

  elseif ply.BhopCount > 0 then

    print(ply:Name() .. " ended a bhop streak with " .. ply.BhopCount .. " total bhops and " .. math.Round(ply:GetVelocity():Length2D()) .. " speed")

    ply.BhopCount = 0

  end
end)
```
