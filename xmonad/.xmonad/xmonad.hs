import XMonad
import XMonad.Layout.Spacing

main = xmonad $ defaultConfig
  { terminal           = "termite"
  , focusFollowsMouse  = True
  , modMask            = mod4Mask
  , borderWidth        = 4
  , focusedBorderColor = "#0a9dff" -- tardis
  , normalBorderColor  = "#d9cec3" -- brightgravel
  }
