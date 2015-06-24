# Extracting variables from first colomn 'SampleID'
# This variable 'SampleID' holds information on new variabels: 'VolunteerID', 'SampleTime', 'ProtocolID'
# Via the script below we will extract the new variables from the 'SampleID' and convert the factor variables 
# 'VolunteerID' and 'ProtocolID' into factorVariables.  

# NOTE - Using the grep function here, but could have used the str_detect function as well.



#Change variable type of SampleID to character to extract information

AA_analysis.report_CSV$SampleID <- as.character(AA_analysis.report_CSV$SampleID)

#Check change
str(AA_analysis.report_CSV)
  
#Check the type of the other variables, change if neccessary
#Changing $asp to numerical (was factor)

AA_analysis.report_CSV$asp <- as.numeric(AA_analysis.report_CSV$asp)

#Check change
str(AA_analysis.report_CSV)

#Extracting the 'VolunteerID' from the SampleID and changing the VolunteerID to factor variable


  extractVolunteerID <- function(SampleID) {
    
    
    if (length(grep("01", SampleID)) > 0) {
      return ("1")
      
    } else if (length(grep("02", SampleID)) > 0) {
      return ("2")
      
    } else if (length(grep("03", SampleID)) > 0) {
      return ("3")
      
    } else if (length(grep("04", SampleID)) > 0) {
      return ("4")
      
    } else if (length(grep("05", SampleID)) > 0) {
      return ("5")
      
    } else if (length(grep("06", SampleID)) > 0) {
      return ("6")
      
    } else if (length(grep("07", SampleID)) > 0) {
      return ("7")
      
    } else if (length(grep("08", SampleID)) > 0) {
      return ("8")
      
    } else if (length(grep("09", SampleID)) > 0) {
      return ("9")
      
    } else if (length(grep("10", SampleID)) > 0) {
      return ("10")
      
    } else if (length(grep("11", SampleID)) > 0) {
      return ("11")
      
    } else if (length(grep("12", SampleID)) > 0) {
      return ("12")
      
    } else if (length(grep("13", SampleID)) > 0) {
      return ("13")
      
    } else if (length(grep("14", SampleID)) > 0) {
        return ("14")
        
    }  else if (length(grep("15", SampleID)) > 0) {
          return ("15")
          
    }   else if (length(grep("16", SampleID)) > 0) {
            return ("16")
            
    }    else if (length(grep("17", SampleID)) > 0) {
              return ("17")
      
    }    else if (length(grep("18", SampleID)) > 0) {
      return ("18")
      
      
      
    } else {
      return ("Other")
    }
  }
  
  
  
  
  


VolunteerID <- NULL
  for (i in 1:nrow(AA_analysis.report_CSV)) {
    VolunteerID <- c(VolunteerID, extractVolunteerID(AA_analysis.report_CSV[i,"SampleID"]))
  }
  
  

AA_analysis.report_CSV$VolunteerID <- as.factor(VolunteerID)
                                                
                                                

write.csv(AA_analysis.report_CSV, file = "new_AAreport.csv")


#Extracting the 'SampleTime' from the SampleID and changing the 'SampleTime' to factor variable


extractSampleTime <- function(SampleID) {
  
  
  if (length(grep("B", SampleID)) > 0) {
    return ("0")
    
  } else if (length(grep("T30", SampleID)) > 0) {
    return ("0.5")
    
  } else if (length(grep("T60", SampleID)) > 0) {
    return ("1.0")
    
  } else if (length(grep("T90", SampleID)) > 0) {
    return ("1.5")
    
  } else if (length(grep("T120", SampleID)) > 0) {
    return ("2.0")
    
  } else if (length(grep("T180", SampleID)) > 0) {
    return ("3")
    
  } else if (length(grep("T360", SampleID)) > 0) {
    return ("6")
    
  } else if (length(grep("T24h", SampleID)) > 0) {
    return ("24.0")
    
  } else {
    return ("Other")
  }
}







SampleTime <- NULL
for (i in 1:nrow(AA_analysis.report_CSV)) {
  SampleTime <- c(SampleTime, extractSampleTime(AA_analysis.report_CSV[i,"SampleID"]))
}



AA_analysis.report_CSV$SampleTime <- as.factor(SampleTime)




write.csv(AA_analysis.report_CSV, file = "new_AAreport2.csv")




#Extracting the 'ProtocolID' from the SampleID and changing the 'ProtocolID' to factor variable


extractProtocolID <- function(SampleID) {
  
  
  if (length(grep("P1", SampleID)) > 0) {
    return ("1")
    
  } else if (length(grep("P2", SampleID)) > 0) {
    return ("2")
    
  } else if (length(grep("P3", SampleID)) > 0) {
    return ("3")
    
  } else if (length(grep("P4", SampleID)) > 0) {
    return ("4")
    
  } else if (length(grep("P5", SampleID)) > 0) {
    return ("5")
    
  
    
  } else {
    return ("Other")
  }
}







ProtocolID <- NULL
for (i in 1:nrow(AA_analysis.report_CSV)) {
  ProtocolID <- c(ProtocolID, extractProtocolID(AA_analysis.report_CSV[i,"SampleID"]))
}



AA_analysis.report_CSV$ProtocolID <- as.factor(ProtocolID)




write.csv(AA_analysis.report_CSV, file = "new_AAreport3.csv")

str(Data.figures_ALL.DATA)




# rename programmatically 
library(reshape)


# you can re-enter all the variable names in order
# changing the ones you need to change.the limitation
# is that you need to enter all of them!

#Changing names of variables from "V1" - "V"..  to "Study" ....
names(Data.figures_ALL.DATA) <- c("Study", "Laboratory", "Class",	"ChemicalName",	"ChemicalID",	"IFMaxP53",	"CYTOTOX_MEC", "S9MIX")


#change variable type of Class to factor
Data.figures_ALL.DATA$Class <- as.factor(Data.figures_ALL.DATA$Class)


#change variable type of ChemicalID to factor
Data.figures_ALL.DATA$ChemicalID <- as.factor(Data.figures_ALL.DATA$ChemicalID)

#change variable type of ChemicalID to factor
Data.figures_ALL.DATA$ChemicalID <- as.factor(Data.figures_ALL.DATA$ChemicalID)

#change variable type of S9MIX to factor

Data.figures_ALL.DATA$S9MIX <- as.factor(Data.figures_ALL.DATA$S9MIX)

#change variable type of ChemicalID to integer


Data.figures_ALL.DATA$ChemicalID <- as.integer(Data.figures_ALL.DATA$ChemicalID)


#change variable type
data$ChemicalID <- as.integer(data$ChemicalID)


install.packages(ggplot2)

require(ggplot2)

str(Data.figures_ALL.DATA)

data <- AA_Complete

#change variable type
data$asp <- as.numeric(data$asp)

data$SampleID <- as.character(data$SampleID)

data$VolunteerID <- as.factor(data$VolunteerID)

data$ProtocolID <- as.factor(data$ProtocolID)

data$SampleTime <- as.factor(data$SampleTime)

str(data)  



#Creating several plots and graphs using ggplot2, with function "qplot"


library(ggplot2)


#Plotting Volunteers vs. asp, in time and over protocols

qplot(asp, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(glu, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(asn, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

warnings(TRUE)


qplot(gln, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(his, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(gly, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(thre, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(citrul, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(arg, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(ala, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(tau, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(tyr, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(val, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(meth, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(trp, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(pheala, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(ile, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(leu, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

qplot(lys, VolunteerID, data = data, facets = ProtocolID ~ SampleTime, binwidth = 2)

















