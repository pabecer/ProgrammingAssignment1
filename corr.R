corr <- function(directory, threshold = 0){
        ## 'directory' is a character vector of length 1 indicating the location of
        ## the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the number of
        ## completely observed observations (on all variables) required to compute
        ## the correlation between nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        #Crea data frame con el identificador y numeros de casos completados
        cc <- complete(directory)
        
        #Extrae los indices de los monitores con observaciones mayores al limite
        ids <- cc[cc["nobs"] > threshold,]$id
        
        #inicia vector numerico vacio.
        correlacion <- numeric()
        
        
        
        for(i in ids){
                #lees los datos de los archivos que superan el limite
                datos <- read.csv(paste0(getwd(),"/", directory,"/", formatC(i, width = 3, flag = "0"), ".csv")) 
                
                #elimina los casos no completados 
                datos <- datos[complete.cases(datos),]
                
                #calcula la correlacion de las variables.
                correlacion <- c(correlacion, cor(datos$sulfate, datos$nitrate))
                
        }
        
        correlacion        
}