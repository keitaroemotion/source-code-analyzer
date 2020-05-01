-- create Groovy analyzer and kinda lint tool 

import Data.List
import Data.List.Split
import System.Directory
import System.Environment
import System.Exit
import System.IO
import Control.Monad

-- TODO: need to parse the command line argument.
--       if command line argument as the directory path missing,
--       it is going to refer to the current directory 

main :: IO ()
main = do
    -- First, need to extract the action param, which starts from '-'
    -- -lc       ... wordCount analyzer 
    -- --groovy  ... groocy syntax analyzer

    args <- getArgs
    let bigOptions    = ["-lc", "--groovy"]
    let parsedOptions = [x | x <- args, x `elem` bigOptions]

    if length parsedOptions /= 1
        then do putStrLn "\nDuplicated option. Please choose one..\n"
                exitWith(ExitFailure 44)
        else
            return ()

    let parsedArgs= [lines x | x <- splitOn "-" $ unlines args, x /= ""]

    case parsedOptions !! 0 of
        "-lc"      -> countLines(parsedArgs)
        "--groovy" -> return ()
        otherwise  -> return ()

    return ()

data Directory = Directory String | Nothing
countLines :: [[String]] -> IO ()
countLines parsedArgs = do
                        print dirPath
                        -- need to check if path is dir/not and whether the dir exist or not.
                        return ()
                        where 
                           targetArgs = [x | x <- parsedArgs, x !! 0 == "lc"] !! 0
                           dirPath    = targetArgs !! 1

