#Открывает и читает файл для других функций
readFile <- function(folder, id){
  file_name = id
  
  #Добавляем нули
  if (id<10){
    file_name <- paste("00", file_name, sep="")
  } else if (id <100)
  {file_name <- paste("0", file_name, sep="")
  }
  
  file_name <- paste(folder, "/", file_name, ".csv", sep="")
  
  file <- read.csv(file_name)
  file
}

getMean <- function(folder, type, id=1:332){
  values <- c()
  for (i in id){
    file <- readFile(folder, i)
    file <- file[, type]
    #Удаляем NA
    file <- file[!is.na(file)]
    values <- c(values, file)
  }
  mean(values)
}

print("Testing function 1: ")
getMean("data", "sulfate", 1:10)
getMean("data", "nitrate", 70:72)
getMean("data", "nitrate", 23)

getCompleteObservation <- function(folder, id = 1:332) {
  df <- data.frame(matrix(ncol = 2, nrow = 0))
  colnames(df) <- c("id", "count")
  
  for (i in id){
    file <- readFile(folder, i)
    count <- dim(file[complete.cases(file),])[1]
    df[nrow(df)+1, ] <- c(i, count)
  }
  df
}

print("Testing function 2: ")
getCompleteObservation("data", 1)
getCompleteObservation("data", c(2, 4, 8, 10, 12))
getCompleteObservation("data", 30:25)
getCompleteObservation("data", 3)



