library(dplyr)
library(ggplot2)
library(ggthemes)
library(readxl)
libary(tidyr)

candidatos <- readxls("candidatos.xls")

candidatos %>% 
  gather(var, val, `1`:`43`) %>% 
  mutate(val = ifelse(is.na(val), 0, val),
         `Número de posicionamentos` = as.factor(val),
         var = as.numeric(as.character(var))) %>% 
  ggplot(aes(y=reorder(Candidato, desc(Candidato)), x=var, fill=`Número de posicionamentos`)) +
  geom_tile(color = "gray") +
  scale_fill_manual(values=c("#d9d9d9", "#d7301f", "#b30000", "#7f0000")) +
  theme_fivethirtyeight() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(axis.title = element_text(), axis.title.y = element_blank()) +
  labs(x="Horas após a primeira notícia da morte de Marielle", y="Pré-Candidato", title="Quanto tempo os pré-Candidatos demoraram para se posicionar sobre Marielle?",
       subtitle="Contando apenas posts no Facebook que fazem referência direta a Marielle") 
