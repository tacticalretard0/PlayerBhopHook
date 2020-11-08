hook.Add("SetupMove", "PlayerBhopHook.SetupMove", function(ply, mv, cmd)
  -- You can't bhop when you're dead
  if !(ply:Alive()) then return end

  -- If it doesn't exist yet
  ply.IsInAir = ply.IsInAir || false

  local IsOnGround = ply:IsOnGround()

  if ply.IsInAir then
    if IsOnGround then

      ply.IsInAir = false

      if mv:KeyPressed(IN_JUMP) then
        hook.Run("PlayerBhopped", ply, true, mv, cmd)
      else
        hook.Run("PlayerBhopped", ply, false, mv, cmd)
      end
    end
  end

  ply.IsInAir = !IsOnGround

end)
