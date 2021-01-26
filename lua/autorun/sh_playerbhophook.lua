hook.Add("SetupMove", "PlayerBhopHook.SetupMove", function(ply, mv, cmd)

  if IsFirstTimePredicted() && ply:Alive() then
    -- If it doesn't exist yet
    ply.WasInAir = ply.WasInAir || false

    ply._IsOnGround = ply:IsOnGround()

    -- If they were in the air last time, and they're on the ground this time, then this is the first time that they touched the ground
    if ply.WasInAir && ply._IsOnGround then
      -- If they also pressed jump, then they successfully hit a bhop
      if mv:KeyPressed(IN_JUMP) then
        hook.Run("PlayerBhopped", ply, true, mv, cmd)
      else
        -- If they didn't press jump, then they missed
        hook.Run("PlayerBhopped", ply, false, mv, cmd)
      end
    end
    -- Update ply.WasInAir AFTER it's used, so that whenever it gets used, it gives us the value that it had the previous time this hook was run
    ply.WasInAir = !ply._IsOnGround
  end
end)
