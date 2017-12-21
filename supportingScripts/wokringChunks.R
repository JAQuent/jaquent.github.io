postYear      <- '2017'
postMonth     <- '12'
postDay       <- '16'
postTitle     <- 'Example post'
postText      <- 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
postKeywords  <- 'example, open diary'

post       <- createPost(postYear, postMonth, postDay, postTitle, postText, postKeywords)
tailString <- paste(post, tailString, sep = '')

htmlString <- paste(headerString, post, tailString, sep = '')
cat(htmlString, file = 'index.html')
cat(tailString, file = 'tailString.txt')

# To do
# create data base
# create option for post without urls
# Create archive and maximmal number of entries per site
# public and secret posts
