pollutantmean <- function(directory, pollutant, id = 1:332){
        
        ## 'directory' is a character vector of length 1 indicating the location of
        ## the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating the name of the
        ## pollutant for which we will calculate the mean; either 'sulfate' or
        ## 'nitrate'.
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used
        
        ## Return the mean of the pollutant across all monitors list in the 'id'
        ## vector (ignoring NA values)
        
        
        #Establece ruta donde se encuentran los archivos
        directorio <- paste0(getwd(),"/", directory) #pega caracteres y convierte a string
        
        datos <- data.frame() #inicia un dataframe
        
        #se crea la ruta a cada archivo y se lee el archivo, luego se usa rbind para a?adirlo al data frame datos.
        for(i in id){
                dato <- read.csv(paste0(directorio,"/", formatC(i, width = 3, flag = "0"),".csv")) 
                datos <- rbind(datos, dato)
        }
        
        #Calcula el promedio (media aritmetica), ignorando los valores NA
        mean(datos[,pollutant], na.rm = TRUE)
        
}