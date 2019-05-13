import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.Circle
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns
import System.Taffybar.Support.PagerHints (pagerHints)

myStartupHook = do
    spawn "status-notifier-watcher &"
    spawn "taffybar &"

myLayout = avoidStruts $
           tiled
           ||| Mirror tiled
           ||| Full
           ||| tabbed shrinkText defaultTheme
           ||| threeCol
           ||| spiral (4/3)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     threeCol = ThreeCol nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 2/100

myConfig = defaultConfig
              { modMask = mod4Mask  -- super instead of alt (usually Windows key)
              , terminal = "termite"
              , startupHook = myStartupHook
              , layoutHook = myLayout
              , focusedBorderColor = "#8D69C7"
              }

main = xmonad $
       docks $
       ewmh $
       pagerHints $
       myConfig
