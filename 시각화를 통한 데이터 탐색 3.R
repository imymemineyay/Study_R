x<-1:10
x
x>5
x[x>5]


m1 <- matrix(1:9,nrow=3,byrow=T,
             dimnames = list(c("행1","행2","행3"), c("열1","열2","열3")))
m1

# m1 행렬의 요소의 값이 4이상인 것만 추출하시오
m1[m1>=4]

# m1행렬의 두번째 열 요소의 값이 4이상인 것만 추출
m1[m1[,2]>=4,]
m1[,2]>=4
m1[,2]>4
m1[c(2,3),]
m1[2:3,]



array(1:27,
      dim=c(3,3,3),
          dimnames=list(c("행1","행2","행3"),
                        c("열1","열2","열3"),
                        c("면1","면2","면3"))) -> a1
a1      
a1[3,3,1]
a1[,,2]
a1[,,c(1,3)]

# a1배열에 모든 페이지의 1행들만 추출
a1[1,,]
a1[,2,]

# 행렬의 연산 1*3,3*3 곱
x <- 1:3
y <-matrix(1:9,nrow=3)
x
y
x*y

# 행렬곱 %*%
x%*%y

y*x
y%*%x

y
rowMeans(y)

m2 <- matrix(1:12,nrow=4)
m2
# 행렬 구조를 확인 리스트형태로 반환
attributes(m2)
dim(m2)

yyx <- list('kookmin','hong',1:5)
yyx
yyx[[3]][2:3]

x <- list(1:3,2:5,c('a','b','k'))
x

## x의 첫번째 리스트 객체 추출
x[[1]]
## x의 첫번째 리스트의 값 중 3번째 요소
x[[1]][3]
## x의 두번째 리스트의 값 중 2~4번째 요소
x[[2]][2:4]
## x 의 두번째 리스트의 첫번째리스트 값에 4번째 요소
x[[2]][c(1,4)]
x[2][[1]][4]

x<-list(no=1:3,ban=2:5,name=c('a','b','k'))
x
x$no
x$ban

name<-c("alice","kylie","kortney")
age<-c(40,26,35)
gender <-factor("f")
blood<-factor(c("A","AB","O"))
df <-data.frame(name,age,gender,blood)
df

# 데이터프레임 요소에  접근
# 속성값을 출력하는 $이용
# 배열요소의 접근에 사용할 수 있음 [행인덱스, 열인덱스]
# [조건식]


library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg

## 간단한 그래프를 빠르게 그리기 위해 ggplot 패키지
##에서 제공하는 qplot
상자 히스토 
선, 막대 항목
차트 제이터 구성 비율
산점도 데이터의 변화추세 연관성

str(mpg)
summary(mpg)
# 1개럴 당 몇 마일을 가는지?
# hwy 자동차가 고속도로에서 1개럴당 몇 마일을 가는지 
# 가지고 있다.
qplot(data=mpg,x=hwy)
qplot(data=mpg,x=cty)
qplot(data=mpg,x=drv,y=hwy, geom='line')
qplot(data=mpg,x=drv,y=hwy, geom='boxplot')
qplot(data=mpg,x=drv,y=hwy,geom="boxplot",colour=drv)
#color==colour

summary(mpg)

# 복사본 만들어서 사용해야함
raw<-mpg
str(raw)

# cty => city, hwy=>highway

library(dplyr)
raw <- rename(raw,city=cty,highway=hwy)
names(raw)

# 파생변수 : 기존의 변수를 변형해서 만드는 함수
# 통합연비 = (도시연비 + 고속도로연비) / 2 
raw$total <- (raw$city+raw$highway)/2

head(raw)

# 통합연비를 갖지고 ,합격불합격
summary(raw$total)
hist(raw$total)

# 통합연비의 값이 20을 넘기면 '합격', 그렇지 않으면 
#  그렇지 않으면' 불합격'
raw$text <- ifelse(raw$total>=20,'pass','fail')
raw$text
head(raw)
table(raw$text)
ggplot(raw$text)
barplot(table(raw$text))


# 연지에 따른 자동차의 등급을 부여하는 작업
# grade : A,B,C,D
# 30이상이면, A, 20이상이면 B, 그외엔 C
# 빈도표 - 등급에 따른

raw$grade <- ifelse(raw$total>=30,"A",
                    ifelse(raw$total>=20,"B","C"))
raw

# 빈도표
table(raw$grade)
qplot(raw$grade)


## ggplot2::midwest
##미국 동부 중부 437개 지역의 인구 통계 정보를 가지고 있는 
# 데이터 셋

# q1. poptotal(전체인구) 변수를 total로 popasian(아시아인구)
# 변수를 asian으로 변경하시오.
midwest <- as.data.frame(ggplot2::midwest)
midwest
raw <- midwest
raw <- rename(raw,total=poptotal, asian=popasian)
names(raw)

# q2. total, asian 변수를 이용해 '전체 인구 대비 아시아
# 인구 백분율' 파생변수를 만들고, 히스토그램을 통해 
# 도시들이 어떻게 분포되어 있는지 분석하시오

raw$percentage = (raw$asian/raw$total)*100
raw$percentage
qplot(raw$percentage)
hist(raw$percentage)
qplot(raw$state,raw$percentage,geom="boxplot")

# q3. 아시아 인구 백분율 전체 평균을 구하고, 평균을 
# 초과하면 'large', 그외에는 'small'로 부여하는 
#파생변수를 생성하시오.

a= mean(raw$percentage)
raw$qm <- ifelse(raw$percentage>a,"large","small")
raw$qm


# q4. 'large'와 'small'에 해당하는 지역이 얼마나 되는 
# 지 빈도표와 빈도 막대그래프를 만들어 분석하시오.

qplot(raw$qm,fill=raw$state)
raw %>% ggplot() + geom_bar(aes(raw$qm,fill=state),position="dodge")




