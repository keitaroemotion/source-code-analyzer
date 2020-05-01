-- create Groovy analyzer and kinda lint tool 

import Data.List
import Data.List.Split
import System.Environment
import System.Exit

-- TODO: need to parse the command line argument.
--       if command line argument as the directory path missing,
--       it is going to refer to the current directory 

main :: IO ()
main = do
    -- First, need to extract the action param, which starts from '-'
    -- -l        ... wordCount analyzer 
    -- --groovy  ... groocy syntax analyzer

    args <- getArgs
    let bigOptions    = ["-l", "--groovy"]
    let parsedOptions = [x | x <- args, x `elem` bigOptions]

    if length parsedOptions > 1
        then do putStrLn "\nDuplicated option. Please choose one..\n"
                exitWith(ExitFailure 44)
        else
            return ()

    let parsedArgs= [lines x | x <- splitOn "-" $ unlines args, x /= ""]
    print parsedArgs
    return ()
