library(dplyr)
library(ggplot2)
library(ggthemes)
library(readxl)

candidatos <- readxls("candidatos.xls")

candidatos %>% 
  gather(var, val, `1`:`43`) %>% 
  mutate(val = ifelse(is.na(val), 0, val),
         `N�mero de posicionamentos` = as.factor(val),
         var = as.numeric(as.character(var))) %>% 
  ggplot(aes(y=reorder(Candidato, desc(Candidato)), x=var, fill=`N�mero de posicionamentos`)) +
  geom_tile(color = "gray") +
  scale_fill_manual(values=c("#d9d9d9", "#d7301f", "#b30000", "#7f0000")) +
  theme_fivethirtyeight() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(axis.title = element_text(), axis.title.y = element_blank()) +
  labs(x="Horas ap�s a primeira not�cia da morte de Marielle", y="Pr�-Candidato", title="Quanto tempo os pr�-Candidatos demoraram para se posicionar sobre Marielle?",
       subtitle="Contando apenas posts no Facebook que fazem refer�ncia direta a Marielle") 