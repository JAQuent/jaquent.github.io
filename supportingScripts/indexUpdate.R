######################################################################################################
### Checking for new files
years              <- c('2017', '2018')
fileNames          <- list.files(years) #Lists all files in the year folders
fileNameLength     <- nchar(fileNames)
fileNamesHTML      <- fileNames[substr(fileNames, fileNameLength - 3, fileNameLength) == 'html']
fileNameHTMLLength <- nchar(fileNamesHTML)
######################################################################################################
### Compare strings to log file

######################################################################################################
### Loading strings
headerString <- readChar('supportingScripts/headerString.txt', file.info('supportingScripts/headerString.txt')$size)
bodyString   <- readChar('supportingScripts/bodyString.txt', file.info('supportingScripts/headerString.txt')$size)
tailString   <- readChar('supportingScripts/tailString.txt', file.info('supportingScripts/tailString.txt')$size)
######################################################################################################
### Create new entry
#"\t\t<p>2017-12-16 <a href=\"\">Place holder</a>.\n            </p>\n"

newEntry <- paste("\t\t<p>", substr(fileNamesHTML, 0, 4),
                  "-", substr(fileNamesHTML, 5, 6),
                  "-", substr(fileNamesHTML, 7, 8), 
                  " <a href=/", substr(fileNamesHTML, 0, 4),
                  "/", fileNamesHTML,
                  ">", sub('-', ' ', substr(fileNamesHTML, 10, fileNameHTMLLength-5)),
                  "</a>.\n            </p>\n", sep = "")

bodyString <- paste(newEntry, bodyString, sep = "")
cat(paste(headerString, bodyString, tailString), file = 'index.html')