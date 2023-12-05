
getMean <- function(folder, type, id=1:332){
  files_list <- list.files(folder)
  # files_list <- files_list[which(file_path_sans_ext(basename(files_list)) )]
  res = 0
  
  #имена файлов с нулями в начале
  # file_names <- c()
  for (i in id){
    file_name = i
    if (i<10){
      file_name <- paste("00", file_name, sep="")
    } else if (i <100)
    {file_name <- paste("0", file_name, sep="")}
    
    file_name <- paste(folder, "/", file_name, ".csv", sep="")
    # file_names <- append(file_names, file_name)
    
    
  }

}

getMean("data", "sulfate", 12:124)

