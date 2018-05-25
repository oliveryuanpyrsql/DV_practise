###############################################################################
# Wake Forest School of Business MSBA program
# Data Visualization
# Instructor: Lauren Rhue
# HW3: "HW3: R and ggplot"
###############################################################################
#
# NAME:
#
###############################################################################
#INSTRUCTIONS**  
#  Following the instructions below to create charts from the *prescriber-info.csv* file used in HW1. Submit the .rmd R notebook on Sakai by the deadline: **Wednesday November 8 at 11:55pm**. 
###############################################################################
# LOAD DATA AND PACKAGES
library(ggplot2)
dat <- read.csv("DV16_Tweets.csv")

# DATA INPUT
library(ggplot2)
library(dplyr)
library(scales)
dat <- read.csv("prescriber-info.csv")

###############################################################################
# HW3 Question 1: Sales by State (Bar Chart)**  
# Recreate the Q3 bar chart from the first homework, HW1, except that FL should be highlighted. Create a bar chart of the sum of the Oxycontin prescriptions by State. The bars should be sorted in descending order, and the State of FL should be highlighted. Only the continental U.S. entities should be included, so you'll need to preprocess the dataset to exclude those values and summarize the data at the appropriate level.(8 points)

#INSERT CODE HERE


###############################################################################
# HW3 Question 2: Oxycontin vs Fentanyl (Bubble Chart)
# Recreate the Q4 scatterplot from the first homework assignment, HW1. Compare the number of prescriptions for Oxycontin and Fentanyl, with Oxycontin on the x-axis and Fentanyl on the y-axis, and the bubble size and color should reflect the sum of Opioid Prescribers. (8 points)

#INSERT CODE HERE

###############################################################################
# HW3 Question 3: Distribution of Oxycontin by Specialty (Boxplot)**  
# Recreate the Q5 boxplot from the first homework HW1, except for the annotations. Each boxplot shows the distribution of the sum of Oxycontin prescriptions by state for each specialty. The specialty should be filtered by the set that made than 2000+ prescriptions. (8 points)

#INSERT CODE HERE

###############################################################################
