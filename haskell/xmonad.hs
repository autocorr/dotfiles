-- -*- haskell -*-
import Control.Monad (liftM)
import XMonad
import XMonad.Core
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
import XMonad.Layout.Magnifier
import XMonad.Layout.TabBarDecoration
import XMonad.Hooks.DynamicLog hiding (shorten)
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.DwmPromote
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run (spawnPipe)
import System.IO
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.WorkspaceCompare
import XMonad.Util.EZConfig
import XMonad.Actions.Warp
import Data.Ratio

myTerminal    = "gnome-terminal"
myScreenLock  = "/usr/bin/gnome-screensaver-command -l"
myBorderWidth = 1
myModMask     = mod4Mask
myWorkspaces  = ["α", "β" ,"γ", "δ", "ε", "ζ", "η", "θ", "ι"]
myNormalBorderColor  = "grey40"
myFocusedBorderColor = "yellow3"

myKeys = \conf -> mkKeymap conf $
    -- standard keybindings
    [ ("M-S-<Return>", spawn $ XMonad.terminal conf)
    , ("C-S-<Esc>",    spawn $ myScreenLock)
    , ("M-c",          kill)  -- default M-S-c
    , ("M-p",          shellPrompt myXPConfig)
    , ("M-<Space>",    sendMessage NextLayout)
    , ("M-S-<Space>",  setLayout $ XMonad.layoutHook conf)
    , ("M-n",          refresh)
    , ("M-<Tab>",      windows W.focusDown)
    , ("M-j",          windows W.focusDown)
    , ("M-S-<Tab>",    windows W.focusUp)
    , ("M-k",          windows W.focusUp)
    , ("M-m",          windows W.focusMaster)
    , ("M-S-k",        windows W.swapDown)
    , ("M-S-j",        windows W.swapUp)
    , ("M-b",          sendMessage ToggleStruts)
    , ("M-h",          sendMessage Shrink)
    , ("M-l",          sendMessage Expand)
    , ("M-t",          withFocused $ windows . W.sink)
    , ("M-,",          sendMessage (IncMasterN 1))
    , ("M-.",          sendMessage (IncMasterN (-1)))
    , ("M-S-q",        io (exitWith ExitSuccess))
    , ("M-q",          restart "xmonad" True)
    -- non-standard keybindings
    , ("M-S-<Right>",  shiftToNext >> nextWS)
    , ("M-S-<Left>",   shiftToPrev >> prevWS)
    , ("M-<Down>",     nextScreen)
    , ("M-S-<Down>",   shiftNextScreen >> nextScreen)
    , ("M-<Left>",     prevNonEmptyWS )
    , ("M-C-k",        prevNonEmptyWS )
    , ("M-<Right>",    nextNonEmptyWS )
    , ("M-C-j",        nextNonEmptyWS )
    , ("M-s",          swapNextScreen)
    , ("M-<Up>",       swapNextScreen)
    , ("M-a",          sendMessage MirrorShrink)
    , ("M-y",          sendMessage MirrorExpand)
    , ("M-<Return>",   dwmpromote)
    , ("M-<",          warpToWindow (1%10) (1%10)) -- Move pointer to currently focused window
    -- spawn commands
    , ("M-x f",        spawn "firefox")
    ]
    ++
    [ (m ++ i, windows $ f j)
        | (i, j) <- zip (map show [1..9]) (XMonad.workspaces conf)
        , (m, f) <- [("M-", W.view), ("M-S-", W.shift)]
    ]
  where
    nextNonEmptyWS = moveTo Next (WSIs (liftM (not .) isVisible))
    prevNonEmptyWS = moveTo Prev (WSIs (liftM (not .) isVisible))

isVisible :: X (WindowSpace -> Bool)
isVisible = do
    vs <- gets (map (W.tag . W.workspace) . W.visible . windowset)
    return (\w -> (W.tag w) `elem` vs)

-- Config for Prompt
myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
    { font              = "xft:UbuntuMono-10"
    , bgColor           = "grey20"
    , fgColor           = "white"
    , fgHLight          = "white"
    , bgHLight          = "red4"
    , borderColor       = "black"
    , promptBorderWidth = 1
    , position          = Top
    , height            = 18
    , defaultText       = []
    }

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    -- cycle focus
    , ((modMask, button4), (\_ -> windows W.focusUp))
    , ((modMask, button5), (\_ -> windows W.focusDown))
    -- cycle through workspaces
    , ((controlMask .|. modMask, button5), nextNonEmptyWS)
    , ((controlMask .|. modMask, button4), prevNonEmptyWS)
    ]
  where
    nextNonEmptyWS = \_ -> moveTo Next (WSIs (liftM (not .) isVisible))
    prevNonEmptyWS = \_ -> moveTo Prev (WSIs (liftM (not .) isVisible))

myLayout = avoidStrutsOn[U] $ tiled
    ||| tabs
    ||| Mirror tiled
    ||| magnify Grid
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = ResizableTall nmaster delta ratio []
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 8 % 13
    -- Percent of screen to increment by when resizing panes
    delta   = 3 % 100
    -- tabbed layout
    tabs = tabbed shrinkText myTheme
    -- magnification in grid
    magnify = magnifiercz (13%10)

-- Configuration for Tabbed
myTheme :: Theme
myTheme = defaultTheme
    { inactiveBorderColor = "black"
    , activeBorderColor = myFocusedBorderColor
    , activeColor = "grey40"
    , inactiveColor = "grey20"
    , inactiveTextColor = "grey80"
    , activeTextColor = "white"
    , fontName = "xft:UbuntuMono-10"
    , decoHeight = 18
    , urgentColor = "red4"
    , urgentTextColor = "white"
    }

-- Status bars and logging
myLogHook h = do
    ewmhDesktopsLogHook
    dynamicLogWithPP $ myPP h
    updatePointer (Relative (1/20) (1/20))

myPP :: Handle -> PP
myPP h = defaultPP
    { ppCurrent = wrap "<fc=black,yellow3> " " </fc>"
    , ppSep     = ""
    , ppWsSep = ""
    , ppVisible = wrap "<fc=black,yellow3> " " </fc>"
    , ppLayout = \x -> ":: "
                 ++ case x of
                      "Mirror ResizableTall"   -> "MTiled"
                      "ResizableTall"          -> "Tiled"
                      "Tabbed Bottom Simplest" -> "Tabbed"
                      "Tabbed Simplest"        -> "Tabbed"
                      _                        -> x
                 ++ " "
    , ppTitle = \x -> case length x of
                        0 -> ""
                        _ -> "<fc=orange3,black>[" ++ shorten 33 x ++ "]</fc>"
    , ppHiddenNoWindows = wrap "<fc=grey50,black> " " </fc>"
    , ppHidden = wrap "<fc=white,black> " " </fc>"
    , ppOutput = hPutStrLn h
    }

shorten :: Int -> String -> String
shorten n xs
    | length xs < n = xs
    | otherwise     = (take (n - length end) xs) ++ end
  where
    end = "…"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
main = do
    pipe <- spawnPipe "xmobar"
    xmonad $ withUrgencyHook NoUrgencyHook $ defaults pipe

defaults pipe = defaultConfig
    -- simple stuff
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    -- key bindings
    , keys               = myKeys
    , mouseBindings      = myMouseBindings
    -- hooks, layouts
    , layoutHook         = myLayout
    , logHook            = myLogHook pipe
    }
