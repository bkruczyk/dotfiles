import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig ( additionalKeys )

myLayoutHook = spacing 16 $ avoidStruts $ layoutHook def
myManageHook = manageDocks <+> manageHook def
myModMask = mod4Mask
myKeys = [ ((myModMask , xK_r), spawn "rofi -show run")
         , ((myModMask , xK_p), spawn "rofi -show window")
         , ((myModMask .|. shiftMask, xK_l), spawn "slock")
         ]
-- myLogHook h = dynamicLogWithPP $ defaultPP
--   {
--
--   }


main :: IO()
main = do
  xmonad $ ewmh def
    { terminal           = "termite"
    , focusFollowsMouse  = True
    , modMask            = myModMask
    , borderWidth        = 4
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , focusedBorderColor = "#0a9dff"
    , normalBorderColor  = "#d9cec3"
    } `additionalKeys` myKeys
