complete <- function(directory, id = 1:332){
        
        ## 'director' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the from:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        
        #Establece ruta donde se encuentran los archivos
        directorio <- paste0(getwd(),"/", directory) #pega caracteres y convierte a string
        
        #Inicia variable numerica para guardar observaciones completadas
        nobs <- numeric()
        
        
        #Lee cada archivo y cuenta la cantidad de casos completados, guarda el resultado en nobs
        for(i in id){
                dato <- read.csv(paste0(directorio,"/", formatC(i, width = 3, flag = "0"),".csv")) 
                
                nobs <- c(nobs, sum(complete.cases(dato)))
        }
        
        #Genera dataframe con id y nobs
        data.frame(id, nobs)
        
}