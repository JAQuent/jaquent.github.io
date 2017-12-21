######################################################################################################
### Functions
createPost <- function(postYear, postMonth, postDay, postTitle, postText, postKeywords){
  # Use the input the create an .html post for the index file. 
  postURL       <- sub(' ', '-', postTitle)
  return(paste('\t\t<h2>', postYear,
               '-', postMonth,
               '-', postDay, 
               ' <a href=\"/', postYear,
               '/', postMonth,
               '/', postDay,
               '/', postURL,
               '.html\">', postTitle,
               '</a>\n        </h2>\n\t\t    <p>', postText,
               '</p>\n\t\t    <p><strong>Tags: </strong>', postKeywords,
               '</p>\n', sep = ''))
}

parseInput <- function(){
  # Parses user input to add to data base
  finished <- FALSE
  while(!finished){
    # Standard input
    postDate  <- readline(prompt="Enter date as YYYYMMDD: ")
    postTitle <- readline(prompt="Enter title: ")
    postText  <- readline(prompt="Enter text: ")
    postType  <- readline(prompt="Is this post (p)ublic or (s)ecret: ")
    postFile  <- as.logical(readline(prompt="Is there an .html file (TRUE or FALSE): "))
    numberKW  <- as.numeric(readline(prompt="Number of keywwords: "))
    keywords  <- rep(NA, 6) # List to temporally hold keywords
    for(i in 1:numberKW){
      keywords[i] <- readline(prompt=paste('Enter keyword', i, ': '))
    }
    finished  <- as.logical(readline(prompt="Type in TRUE or FALSE to accept this entry: "))
  }
  postEntryTime <- Sys.time()
  return(data.frame(postEntryTime, postDate, postTitle, postText, postType, postFile, keyword1 = keywords[1], keyword2 = keywords[2], keyword3 = keywords[3], keyword4 =  keywords[4], keyword5 =  keywords[5], keyword6 =  keywords[6]))
}

updateDatase <- function(data){
  postYear     <- substr(data$postDate, 0, 4)
  postMonth    <- substr(data$postDate, 5, 6)
  postDay      <- substr(data$postDate, 7, 8)
  if(data$postFile){
    postFilename <- paste(postType, postDate, sep = '')
  } else {
    postFilename <- NA
  }
}
######################################################################################################
### Loading data and strings
headerString <- readChar('headerString.txt', file.info('headerString.txt')$size)
tailString   <- readChar('tailStringStart.txt', file.info('tailStringStart.txt')$size)
######################################################################################################

