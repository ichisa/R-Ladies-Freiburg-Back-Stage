
str(Divya_s_sim_data)
summary(Divya_s_sim_data)

# Find first fixation on Target word, after fixation onset
AllFixTarget<-Divya_s_sim_data[Divya_s_sim_data$AOI.Name == "Target Word" & Divya_s_sim_data$Event.Start.Trial.Time >1700,]
FirstFixTarget<-aggregate(Event.Start.Trial.Time ~ Participant+Trial+, AllFixTarget, min)

# Find mean duration in Grid
AllFixGrid<-Divya_s_sim_data[Divya_s_sim_data$AOI.Name == "Grid" & Divya_s_sim_data$Event.Start.Trial.Time >1700,]
MeanTimeinGrid<-aggregate(Event.Start.Trial.Time~ Participant+Trial, AllFixGrid, mean)

# Are there any outliers? Remove them

# Find difference between first fixation on target/grid and end of trial
FirstFixTarget$StartTrial<-9000-FirstFixTarget$Event.Start.Trial.Time

library(ggplot2)
theme_set(theme_classic(base_size = 18))

a1<-ggplot(MeanTimeinGrid, aes(x=Event.Start.Trial.Time)) + ggtitle("Mean Time Searching") +
  geom_density(size=1.25) + 
  #scale_y_continuous(labels = function(x) format(x, scientific = FALSE))
  #scale_x_continuous(labels = scales::comma)+
  #scale_y_continuous(labels = points)+
  labs(y="Density", x="Mean Time")
options(scipen=999)
a1
