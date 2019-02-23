# init skriftan á að hlaða öllum skriftum í foldernum, nema sjálfri sér

fRunInit <- function(this.folder){
  file.list <- list.files(
    path = this.folder,
    pattern = '\\.R',
    full.names = TRUE
  )
  file.list <- file.list[-1]
  
  if(length(file.list)>0){
    for(i in 1:length(file.list)){
      source(file.list[i])
    }  
  }
}

fRunInit(this.folder = './Rprocs')

rm(fRunInit)
