library(ggplot2)

data <- read.csv("./Final Proj/WineQT.csv")



summary(data)

ggplot(data, aes(x=quality)) + geom_histogram()

ggplot(data, aes(x = quality , y =  volatile.acidity)) + geom_jitter(aes(color = pH))

ggplot(data, aes(x = free.sulfur.dioxide , y = total.sulfur.dioxide)) + geom_point(aes(colour = factor(quality)))
 
ggplot(data, aes(x = volatile.acidity , y = total.sulfur.dioxide)) + geom_point(aes(colour = factor(quality)))

ggplot(data, aes(x=quality, group=cut, fill=cut)) +
  geom_density(adjust=1.5) +
  facet_wrap(~cut) +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    axis.ticks.x=element_blank()
  )
