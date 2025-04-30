
  library(readxl)
  library(lubridate)
  
  Campbell_Cleaner <- function(myfiledir){
    DF            <- read.table(myfiledir, skip = 4, sep = ",")
    header        <- readLines(myfiledir, n=2)
    header        <- t(as.data.frame(unlist(strsplit(header[2], ","))))
    header        <- gsub('"', '', header)
    colnames(DF)  <- header
    #DF[,c(1)]     <- ymd_hms(DF[,c(1)])
    DF            <- DF[!duplicated(DF[,c(1)]),]
    DF            <- DF[order(DF[,c(1)]),]
    DF            <- as.data.frame(DF)
    
    DF[is.na(DF)] <- 0
    return(DF)
    
  }
  
########## READING IN CAMPBELL .DAT FILES #######################  

  # Rob Rain
    good_CS1 <- Campbell_Cleaner("O:/departments/Water Quality/Equipment/Rain_Gauges/Rob_Rain_Gauge/RainContinuous.dat")  
  # Hydro UFF-EMC
    #good_CS2 <- Campbell_Cleaner("O:/proj/Y2022/22-07782-000/Campbell/Hydro_Hydro.dat")  
  # AquaShield Aqua-Ponic (ASAP)
    good_CS3 <- Campbell_Cleaner("O:/proj/Y2022/22-07790-000/Campbell/AquaShield_Hydro.dat")
  # ADS EcoStream
    #good_CS4 <- Campbell_Cleaner("O:/proj/Y2020/20-07440-000/Campbell/Data/ADS-cell_Hydro.dat")
  # Park Place IN
    good_CS5 <- Campbell_Cleaner("O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place IN_Hydro.dat")
  # Park Place OUT
    good_CS6 <- Campbell_Cleaner("O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place OUT_Hydro.dat")
    
    good_CS_PPSonTek <- Campbell_Cleaner("O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place IN_SonTek_Test.dat")
  # MWR 
    #good_CS7 <- Campbell_Cleaner("O:/proj/Y2018/18-06894-000/Campbell/MWS_3_cell_Hydro.dat")
  # Geneva IN (AS-IN)
    good_CS8 <- Campbell_Cleaner("O:/proj/Y2021/21-07565-001/Campbell/AS-IN_Hydro.dat")
  # Geneva OUT (AS-OUT)  
    good_CS9 <- Campbell_Cleaner("O:/proj/Y2021/21-07565-001/Campbell/AS-OUT_Hydro.dat")
    
########## RE-WRITING RUNNING .CSV #######################  
    
  write.csv(good_CS1, "O:/departments/Water Quality/Equipment/Rain_Gauges/Rob_Rain_Gauge/RainContRunning.csv", row.names = F)
  #write.csv(good_CS2, "O:/proj/Y2022/22-07782-000/Campbell/HydroRunning.csv", row.names = F)
  write.csv(good_CS3, "O:/proj/Y2022/22-07790-000/Campbell/ASAPHydroRunning.csv", row.names = F)
  #write.csv(good_CS4, "O:/proj/Y2022/22-07987-000/Campbell/ADSHydroRunning.csv", row.names = F)
  write.csv(good_CS5, "O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place IN_Running.csv", row.names = F)
  write.csv(good_CS6, "O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place OUT_Running.csv", row.names = F)
  write.csv(good_CS_PPSonTek, "O:/proj/Y2016/16-06417-000/Campbell/Data/Park Place IN_SonTek_Test.csv", row.names = F)
  #write.csv(good_CS7, "O:/proj/Y2018/18-06894-000/Campbell/MWRHydroRunning.csv", row.names = F)
  write.csv(good_CS8, "O:/proj/Y2021/21-07565-001/Campbell/ASINRunning.csv", row.names = F)
  write.csv(good_CS9, "O:/proj/Y2021/21-07565-001/Campbell/ASOUTRunning.csv", row.names = F)
  