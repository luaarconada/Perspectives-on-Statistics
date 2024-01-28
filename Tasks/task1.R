df = read.table('bioage.csv', header=T, sep=';', fill=T)
df=df[,-1]
df$sick=factor(df$sick)

model=lm(age~weight+sick+weight:sick, df)

summary(model)

model2=lm(predict(model)~df$age)

summary(model2)

predict(model) + (df$age- mean(df$age))*(1-model2$coefficients[2])

