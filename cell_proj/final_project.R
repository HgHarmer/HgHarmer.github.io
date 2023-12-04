library(tidyverse)
library(modelr)
library(SciViews)



row<-rep(c('a','b','c','d','e','f','g','h'),6)
column <- c(rep(1,8),
            rep(2,8),
            rep(3,8),
            rep(4,8),
            rep(5,8),
            rep(6,8))
cells_plated<-c(rep(c(10000, 9000, 8000, 6000,4000, 2000, 1000, 500),3), 
                rep(10000,24))

abs_540 <- c(1.152,0.916,0.758,0.342,0.325,0.196,0.173,0.131,
             1.121,0.762,0.789,0.381,0.479,0.280,0.158,0.117,
             1.174,0.802,0.344,0.705,0.510,0.321,0.186,0.115,
             0.563,0.552,0.749,1.006,1.078,1.241,0.879,0.919,
             0.438,0.585,0.371,0.546,0.586,0.963,0.748,0.913,
             0.326,0.438,0.514,0.702,0.746,0.340,0.915,0.542)
  
	


concentration <- c(rep(NA,24))
c <- 400
for (i in 1:8) {
  c <- c/2
  concentration <- c(concentration,c)
}
concentration <- c(concentration,concentration[25:32])
concentration <- c(concentration,concentration[25:32])
concentration 

# C_2 <- 40
# 
# for (i in 1:8) {
#   C_2 <- C_2/2
#   concentration <- c(concentration,C_2)
# }
# 
# concentration <- c(concentration,concentration[33:40])


dat<-data.frame(row,column,cells_plated,abs_540,concentration) %>% 
  mutate(Treatment=case_when(column==1~'control',
                             column==2~'control',
                             column==3~'control',
                             column==4~'hydroquinone',
                             column==5~'hydroquinone',
                             column==6~'hydroquinone'))%>% 
  mutate(cells_attached=cells_plated/2) %>% 
  mutate(final_cells=case_when(Treatment=='control'~cells_attached*2.66667^2))
##########################################################################
##########################################################################
dat_2 <- dat %>%
  filter(Treatment=='control') %>% 
  group_by(final_cells) %>% 
  summarise(abs_540=mean(abs_540))

mod <- lm(data = dat_2,final_cells~abs_540)
summary(mod)

dat_2 %>%
  ggplot(aes(y=final_cells,x=abs_540))+
  geom_point()+
  geom_smooth(method = 'lm',se=FALSE)+
  labs(title ='cell toxicity assay',y='Cells',x='abs at 540nm' )+
annotate('text',y=40000,x=0.3,
         label='y= 36181.2x-447.8
           r^2=0.9101')

############################################################################
############################################################################


dat_3 <- dat %>%
  filter(Treatment=='hydroquinone') %>% 
  group_by(concentration) %>% 
  summarise(abs_540=mean(abs_540))

preds <- add_predictions(dat_3,model = mod)

c_preds<- preds %>% 
  filter(concentration>5)


non_lin <- glm(data=c_preds,
    pred~I(ln(concentration)))

summary(non_lin)


1 - non_lin$deviance/non_lin$null.deviance
 
concentration <- c(7:250)
test <- data.frame(
  concentration)

test2 <- add_predictions(test,model = non_lin)


c_preds %>% 
  ggplot(aes(x=concentration,y=pred))+ 
  geom_point()+
  geom_line(data=test2,aes(x=concentration,y=pred))+
  labs(x='Concentration of hydroquinone (uM)',
       y='Number of cells',
       title = 'Toxicity Of hydroquinone')

#########################################################
non_lin <- glm(data=c_preds,
               concentration~I(pred))

  summary(non_lin)
pred <-c(14000:30000)

test <- data.frame(
  pred)
test2 <- add_predictions(test,model = non_lin,var ='concentration' )


1 - non_lin$deviance/non_lin$null.deviance

c_preds %>% 
  ggplot(aes(x=concentration,y=pred))+ 
  geom_point()+
  labs(x='Concentration of hydroquinone (uM)',
       y='Number of cells',
       title = 'Toxicity Of hydroquinone')+ 
  geom_line(data =test2,aes(x=concentration,y=pred))


test2 %>% 
  ggplot(aes(x=concentration,y=pred))+ 
  geom_line()+
  labs(x='Concentration of hydroquinone (uM)',
       y='Number of cells',
       title = 'Toxicity Of hydroquinone')

