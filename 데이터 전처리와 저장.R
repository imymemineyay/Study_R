# 실습데이터 : Titanic
# 데이터 로딩
titanic <- read.csv("titanic.csv")
titanic
str(titanic)
View(titanic)
summary(titanic)
head(titanic)

names(titanic)
# 필요한 컬럼만 뽑아서 새로운 데이터 프레임 생성
df <- titanic[,c("X","pclass","survived","sex","age","sibsp","parch","embarked")]
str(df)
table(is.na(df$embarked))
df$embarked <- ifelse(is.na(df$embarked)==T,'Southampton', df$embarked)
table(is.na(df$embarked))
# factor 형 변환
df$pclass <- as.factor(df$pclass)
summary(titanic)
df$survived <- as.factor(df$survived)
df$sex <-as.factor(df$sex)
df$embarked <-as.factor(df$embarked)

# embarked의 na는 기타로 가면 됨 최빈값으로 보내주기
# 수치데이터는 평균이나 중앙값으로 채우기

df$age <- ifelse(is.na(df$age)==T,28,df$age)

summary(df)
# pclass별 생존 및 사망비율을 시각화
# 객실 등급별 생존율
library(dplyr)
library(ggplot2)
qplot(survived,data=df,fill=sex)
qplot(survived,data=df,fill=pclass)
qplot(survived,data=df,fill=embarked)
qplot(age,data=df)
boxplot(df$age)
df %>% group_by(pclass) %>% summarize()
# 범주형 데이터의 건수

# system.time() : 처리속도를 보여주는 함수
df <- data.frame(x=runif(2.6e+07),
                 y=rep(letters,each=10000))
system.time(x<-df[df$y=='C',])
library(data.table)
DT <- as.data.table(df)
titanic[,1]
titanic_df <- as.data.table(titanic)
class(titanic)
titanic[,1,with=f]
titanic_df[,1]
titanic_df[pclass=="1st"]
titanic_df[pclass == "1st"]

titanic_df[,c('sex','pclass')]

setkeyv(titanic_df,c("sex","pclass"))
tables()
setkey(titanic_df,pclass)
tables()


key <- 'pclass'
setkeyv(titanic_df,key)
tables()
titanic_df[J('1st'),mean(survived)]

# apply함수 : 특정 행이나 열을 대상으로 함수를 적용

# apply, lapply, sapply
# 형식 : apply(행렬,1/2 방향, 함수)
?apply

sum(1:10) # 1~10까지의 벡터값값

# 행렬만드는 법
# matrix(data요소의 값, dimension| nrow=,ncol=)
m <- matrix(1:12,nrow=3,dimnames=list(c("one","two","three"),c("일","이","삼","사")))
m
?matrix
apply(m,1,sum) # rowSums(), rowMeans()
apply(m,2,mean) # colSums(), colMeans()
apply(m,2,median)

x <- lapply(1:3,function(a){a*2})
x
x[1] # 리스트의 첫번째 객체
x[[1]]
x[[2]] <- c(1,2,3,4,5)
x
x[[2]][3]

# 리스트를 벡터로 바꾸는 함수 
# unlist()

x <- list(a = 1:3,
          b= "aaa",
          c = 100)
x
x$c
x$a
x$a[2]
# 리스트는 벡터처럼쓸 수도 있고 데이터프레임처럼 쓸 수 있음
# 리스트를 일차원 배열로 
# 리스트를 이차원 배열로 쓸 수 있음
