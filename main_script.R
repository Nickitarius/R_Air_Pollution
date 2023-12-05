
getMean <- function(folder, type, id=1:332){
  values <- c()
  for (i in id){
    file_name = i
    if (i<10){
      file_name <- paste("00", file_name, sep="")
    } else if (i <100)
    {file_name <- paste("0", file_name, sep="")
    }
    
    file_name <- paste(folder, "/", file_name, ".csv", sep="")
    
    file = read.csv(file_name)
    
    #Удаляем NA
    file <- file[, type]
    file <- file[!is.na(file)]
    
    values <- c(values, file)
  }
  mean(values)
}

print("Testing function 1: ")
getMean("data", "sulfate", 1:10)
getMean("data", "nitrate", 70:72)
getMean("data", "nitrate", 23)

