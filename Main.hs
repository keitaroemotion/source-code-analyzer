-- create Groovy analyzer and kinda lint tool 

import Data.List
import Data.List.Split
import System.Environment

-- TODO: need to parse the command line argument.
--       if command line argument as the directory path missing,
--       it is going to refer to the current directory 

main :: IO ()
main = do
    -- First, need to extract the action param, which starts from '-'
    -- -l        ... wordCount analyzer 
    -- --groovy  ... groocy syntax analyzer
    args <- getArgs 
    let actions    = ["-l", "--groovy"]
    let parsedArgs = [lines x | x <- splitOn "-" $ unlines args, x /= ""]
    print parsedArgs
    return ()

