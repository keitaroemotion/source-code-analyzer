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
        "-lc"      -> countLinesFromParsedArgs(parsedArgs)
        "--groovy" -> return ()
        otherwise  -> return ()

    return ()

data Directory = Directory String | Nothing

-- need to check if path is dir/not and whether the dir exist or not.
countLinesFromParsedArgs :: [[String]] -> IO ()
countLinesFromParsedArgs parsedArgs = do
    countLines dirPath
    return ()
    where 
       targetArgs = [x | x <- parsedArgs, x !! 0 == "lc"] !! 0
       dirPath    = getDirPath targetArgs 

countLines :: String -> IO Int
countLines filePath = do
    isFile <- doesFileExist filePath
    if isFile
        then do contents <- readFile filePath
                print contents
                pure 0
        else do files <- getDirectoryContents filePath    
                [countLines(file) | file <- files]
                pure 0

getDirPath :: [String] -> String
getDirPath targetArgs
    | length targetArgs > 1 = targetArgs !! 1
    | otherwise             = "."

