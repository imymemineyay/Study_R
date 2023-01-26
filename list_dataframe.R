# 리스트(list) : 각 요소의 타입이 일치하지 않은 벡터로
# 구성되어 있음
# 함수: list()
# R이 제공하는 모든 자료구조를 담을 수 있다.
# 파이썬의 자료형인 사전과 같이 변수와 값이 쌍으로 담긴다

jolie=list(kor.name="졸리",
           eng.name="jolie",
           age=50,
           marriage=F,
           num.children=6,
           children.ages=c(2,5,4,15,20,25))
jolie

# jolie의 나이 가져오는 법
jolie$age
jolie$num.children
jolie$children.ages
jolie$children.ages[2]
jolie$marriage
str(jolie)

# 리스트도 벡터의 인덱스를 사용할 수 있지만 대괄호 2개
# 사용 [[]]
# jolie리스트의 영어이름을 추출하는 법
jolie[[2]]

# 홍길동의 인덱스를 이용해서 요소를 가져오는데
# c(1,2)를 썼으면 1번째와 2번째 값을 가져오라는 것
# jolie[c(1,2)] == jolie[[1]] jolie[[2]]
is.list(jolie)

# 지수 구하는 함수 exp()
x = list(a =1:10, 
         b = exp(-3:3),
         logic=c(T,F,F,T))
x

# lapply : 개수에 mean을 다 쓴다
lapply(x,mean)

# 데이터프레임(dataframe)
# 여러 개의 벡터들의 집합
# 데이터 분석에서 가장 널리 사용되는 구조
# 2차원 행렬의 의미를 가지고 있음
# 서로 다른 자료형을 담을 수 있음
# data.frame()
id = c("F1","F2","F3")
name = c("hamilton","louis","robert")
age=c(32,27,25)
blood.type=c("O","A","AB")
df = data.frame(id,name,age,blood.type)
df
str(df)

df2 = data.frame(id,name,age,blood.type,stringsAsFactors = T)

df2
str(df2)

df3=data.frame(names=c("홍길동","장보고"),
               ages=c(25,30))
df3
str(df3)

# 데이터프레임 데이터에 접근
# 데이터프레임[행,열]
df
# 2행 3열 데이터 추출
df[2,3]
# 2행3열, 3행3열
df[c(2,3),3]
# age,blood,type
df[,c(3,4)]
df[,c('age','blood.type')]

df$name
df$age
sum(df$age)
# iris 데이터셋
iris


# 데이터프레임 구조 확인
str(iris)

# 총 행수
nrow(iris)
ncol(iris)
#iris 데이터 셋의 앞 3개 데이터 확인
head(iris,3)
tail(iris,3)
# 기술통계분석(기초통계분석)
summary(iris)
min(iris$Sepal.Width)
max(iris$Sepal.Width)
quantile(iris$Sepal.Length)

# 큰데이터를 한눈에 볼수있게 하는 함수 view()
# 데이터 탐색기능
View(iris)


# dataframe의 일부분만 추출하는 함수
# subset(x,condition,select)
# 열단위로 추출
# 조건에 해당하는 데이터를 추출하는 함수
# x = dataframe condition= 조건식 select =조회할 열
# iris에서 sepal.length가 7보다 큰 데이터를 조회
subset(iris,Sepal.Length>7)
# 여러개의 조건 and 나 or연산자를 사용하면됨
# sepal.length>7 고 petal.length <=6.6 데이터
subset(iris,Sepal.Length>7 &
       Petal.Length <=6.6)

# Sepal.Length > 7.2 고 Petal.Length <=6.5은 
# 요소 중 Sepal.Length, Species만 추출하시오.
# c()쓰는 거 잊지말기
subset(iris,Sepal.Length>7 & Petal.Length<=6.5,
       c(Sepal.Length,Species))
subset(iris,Sepal.Length>7 & Petal.Length<=6.5,
       c(Species,Sepal.Length))

str(iris)
str(subset(iris, Species == "setosa"))
# setosa품종의 관측값의 수
nrow(subset(iris,Species=="setosa"))
# 기본적인 기능을 결합하면 다양한 값을 얻을 수있음

# nrow vs. NROW 
# nrow : 행렬만 가능한 함수
# NROW : 벡터와 행렬 모두 사용 가능

# %in% : 포함여부를 판단하는 연산자
'a' %in% c("a","b","c")

# 집합 : union(합집합), intersect(교집합),
# setdiff(차집합)

# 집합은 중복값을 포함하지 않음
union(c("a","b","c"),c("a","d"))

intersect(c("a","b","c"),c("a","d"))

setdiff(c("a","b","c"),c("a","d"))

# 집합간의 비교연산 세부내용의 같음과 틀림의 여부
setequal(c("a","b","c"),c("a","d"))
setequal(c("a","b","c"),c("a","b","c","c"))


# all, any
x = 1:10
x>5
all(x>5)
any(x>5)

# apply(행렬데이터, 방향, 연산함수)
xx = array(1:12,c(3,4))
xx

# 방향 : 1 => 행단위 계산
# 방향 : 2 => 열단위 계산
apply(xx,1,mean)
apply(xx,2,sum)


# sample(): 벡터나 배열에서 샘플 추출
yy = array(1:12,c(3,4))
yy

# 무작위로 추출
sample(yy) 
# 추출 개수 지정 가능
sample(yy,10)
sample(1:45,6)

# rep = T 반복허용
# rep을 주지 않으면 에러 발생
sample(1:15,20,rep = T)

sample(1:15,20)


# 데이터프레임 생성
a = data.frame(x=c(1,2,3,4,5),y=c(2,4,6,8,10))
a

b = data.frame(x=c(1,2,3,4,5),y=c(2,4,6,8,10),
               z=c("m","f","m","f","m"))
b

# 기존에 데이터프레임에 새로운 열 추가
b$z
b$v=c(3,6,9,12,15)
b

# 예전에 데이터프레임 생성시 문자는 factor, 4.0
# 버전부터 기본형은 문자

df = data.frame(name=c("장보고","이순신",
                       "홍길동"),
                age=c(32,28,19))
df
str(df)


df2=data.frame(name=c("장보고","이순신",
                      "홍길동"),
               age=c(32,28,19),
               blood=c("A","AB","o"))
str(df2)
df2$blood = as.factor(df2$blood)
df2
str(df2)


df2=data.frame(name=c("장보고","이순신",
                      "홍길동"),
               age=c(32,28,19),
               blood=c("A","AB","o"),stringsAsFactors = T)
str(df2)
df2$name=as.character(df2$name)

# 데이터프레임명$변수명
b
b$x
# 데이터프레임에서 하나의 열을 얻어오면
# 벡터타입이 된다.
# drop=False
b[,c('x')]
b[,c('x'),drop=F]
b[1,]

df2$gender = c("m","f","m")
df2

#name만 추출
df2$name

# 2열만 추출
df2[,2]
df2[3,1,drop=F]

# 장보고의 정보만 추출하려면
df2[1,]
df2[df2$name=="장보고",]

# 이순신의 나이와 이름만 추출
df2[df2$name=="이순신",c('name','age')]

# 데이터프레임의 속성명을 변수명으로 변경 : attach
# detach
cars
str(cars)
cars$speed
dist
speed
attach(cars)
speed
dist
detach(cars)
speed
dist

# with() : 데이터프레임에 다양한 함수를 적용할때
mean(cars$speed)
max(cars$speed)
with(cars,mean(speed))

# 속도가 20을 초과하는 데이터만 추출하시오
subset(cars,cars$speed>20)
cars[cars$speed>20,]
subset(cars,speed>20)


# SQL 익숙한 사람들은 sql이용할 수 있다.

install.packages("sqldf")

# 패키지 로딩
library(sqldf)
?longley
# SQL 사용
sqldf("select GNP, Year, Employed from longley where GNP >= 400")

# 정렬 : sort, order()
# order()함수 : order(data, 정렬옵션, na위치)
# TRUE-내림차순, FALSE-오름차순,
# TRUE-맨끝에, FALSE-맨뒤에)

df2$age
order(df2$age)

# 나이를 기준으로 오름차순 정렬
df2[order(df2$age),]
df2[order(df2$age,decreasing=T),]
sort(df2$age)











# 그룹함수 : 특정열을 기준으로 그룹을 묶어 계산
#, 집계함수 
# aggregate(formula,data,function)
# formula : 집계할 열, 종속변수 ~ 
# 집계기준열,독립변수
# cbind(집계할 열1, 집계할 열2... )~ 기준열1+기준열 


emp = data.frame(
  dept=c("개발부","개발부","개발부","개발부",
         "영업부","영업부","영업부","영업부"),
  position=c("과장","과장","차장","차장","과장","과장","차장","차장"),
  name=c("aaa","bbb","ccc","ddd","eee","fff","ggg","hhh"),
  sal=c(5600,5100,7500,7300,4900,5500,6000,6700),
  time=c(15,18,18,12,17,20,8,19)
)
#부서별 급여평균균
aggregate(sal~dept,emp,mean)
# 부서별 급여 및 근무시간의 평균
aggregate(cbind(sal,time)~dept,emp,mean)

# 부서와 직급별로 급여의 평균
aggregate(sal~dept+position,emp,mean)

# na.rm : 옵션
# na.omit(): 데이터프레임에서 결측값제거함수

# airquality 데이터 프레임 
# ozone의 평균을 계산하시오
airquality
str(airquality)
mean(airquality$Ozone,na.rm=T)
# 솔라 결측값때문에 값이 줄어듦
# 결측값있는 건 다 날림
air = na.omit(airquality)
mean(air$Ozone)

# merge: 여러개의 데이터프레임을 병합할때 사용하는 함수

?merge
name = c("홍길동","장보고","이순신")
age = c(22,30,19)
gender = factor(c("M","F","M"))

p1 = data.frame(name,age,gender)
p1
blood.type=factor(c("A","O","B"))
p2 = data.frame(name,blood.type)
p2

p3 = merge(p1,p2, by = "name")
p3

name1 =c("철수","춘향","길동")
name2 = c("민수","춘향","길동")

df1=data.frame(name1,age,gender)
df2=data.frame(name2,blood.type)

df = merge(df1,df2,by.x='name1',by.y='name2')
df
df = merge(df1,df2,by.x='name1',by.y='name2',all=T)
df

# 리스트: 데이터프레임보다 넓은 자료구조
# list(oop1,oop2,...)

x = list(name="foo", height = 70)
x

# 리스트는 객체마다 크기와 타입이 달라고 된다.
x = list(name="foo",height=c(1,3,5))
x

# 리스트안에 리스트를 중첩할 수 있다.
list(a=list(val=c(1,2,3)),b=list(val=c(1,2,3,4)))


x
x$name
x$height
x[[1]]
x[[2]]

x[1]
x[2]


a = c(1,2,3,4,5)
b = c(T,F,T,T,F,T)
c = data.frame(name = c("aaa","bbb","ccc"),
               age = c(23,41,39))
var_list = list(v1=a,v2=b,v3=c)
var_list
names(var_list)
names(var_list)=c("숫자","논리형","이름과 나이")
names(var_list)
names(var_list)[3]="name and age"
names(var_list)

# 리스트의 요소 개수
length(var_list)
str(var_list)



















