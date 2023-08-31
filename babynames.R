library(tidyverse)

# Read in Social Security data for list of baby names & frequency in the United States of America, 
# specifically the California dataset
babynames <- read.csv("data/CA.TXT", header = FALSE)

# Add column names to the dataframe
colnames(babynames) <- c("state", "gender", "year", "firstname", "count")

# View output
head(babynames)

# Select only rows where the firstname is Julien
juliens <- babynames%>%
  filter(firstname == "Julien")

# Create a variable that is the largest number of babies named Julien in one year (year column not included)
famousJuliens <- max(juliens$count)


# Find the year in which the most babies were named Julien
best_julien <- juliens %>% 
  filter (count == famousJuliens) %>%
  select(year) %>% pull()
best_julien

# After the year 2010, how many babies were named Julien each year? -- returns a row for each year
# show the dataset of babies named Julien and their count after 2010
juliens[juliens$year > 2010,]
