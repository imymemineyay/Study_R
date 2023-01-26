# R의 자료 구조
# 벡터(vector) : 1차원 배열, 매트릭스(matrix) 2차원 배열, Array() => 같은 타입만
# data.frame() : 여러개의 vector로 이루어짐 , list : 가장 큰 자료형 => 다른타입ok
# 1. 벡터 (vector()) 
# scalar(스칼라) : 크기만 가지고 있는 물리량, 1개의 원소
# R은 벡터를 사용
# vector(벡터) : 크기와 방향, 1개 이상의 원소를 담는 자료형
# 벡터를 생성하는 함수 : c(), start:stop (콜론), seq() 시퀀스, rep
# 벡터의 인덱스는 1부터 시작
# 하나의 벡터에는 하나의 자료형만 담을 수 있다.
# 벡터연산에 주로 사용되는 내장함수 

# 벡터 생성
x <- c(1,2,3,4)
x

# x의 정보확인, 자료구조 확인
str(x)

x<- 10
x

1:7
7:1

y <- c(1, "hi", 2)
# 벡터는 같은 자료타입만 받으니까 숫자는 문자 취급당함
str(y)

# vector(length=n) 요소가 n개인 빈 벡터를 생성
vector(length=5)
# 빈 벡터는 default값으로 false가 들어감

c(1:5)
c(1,2,3,c(4:6))


y = c()
y = c(y,c(1,2,3))
y


# seq : 순열
# seq(from=처음값, to=마지막값, by=증가값)
x = seq(from=1,to=5,by=1)
x

y = seq(1,10,by=2) # 증가값은 by가 필요하다다
y

z=seq(0,1,by=0.1)
z

w = seq(0,1,length.out=11) # length.out : 요소의 개수
w

# rep(벡터자료형, times=반복횟수)
x= rep(c(1:3),times=2)
x

# rep(벡터자료형, each=개별요소반복)
y=rep(c(1:3),each=2)
y

# 벡터 내 특정 요소 선택 : 벡터명[인덱스]

x = 1:10
x

# x의 두번째 요소 접근법
x[2]

# x의 두번째 요소를 제외한 나머지
x[-2]

# x의 세번째 요소의 값을 할당하는 법
(x[3] <- 30)
x

# x의 요소 중에 2~4까지 추출하는 법
(x[2:4])

# append(원본벡터, 추가할 벡터, 추가할 위치) :추가할 위치 뒤에 추가됨
x <- c('A','B','C')
y <- c('D','E')
z <- append(x,y)
z

z <- append(x,y,2) # 두번째 요소뒤에 벡터 y추가
z

# vector연산 : 벡터화 연산
# vector처럼 연산을 수행한다.
# vector의 연산법
# : 같은 위치의 요소끼리 연산을 수행한다.
x <- c(1:4)
y <- c(5:8)
z= x+y
z

z = x-y
z

z= x*y
z

x <- c(1,2,3,4)
y <- c(5,6)

# 배수여야함 1 2 3 4 
#            5 6 5 6 

z <- x+y
z

z <- y+x
z

x<-c(1,2,3,4)
y<-c(4,5,6)
z<-x+y
z

# 배수일땐 경고메세지 안뜸 그렇지 않을땐 뜸

x = c(1:4)
z = x *2
z

# 논리연산 : TRUE, FALSE

x = 1:10
x > 5

# all : 모두
# any : 어느 거 하나라도

all(x>5) # 모든 벡터의 요소가 5보다 큽니까?
any(x>5) # 어느 거 하나라도 5보다 큽니까?

# head(), tail()
# 데이터의 일부분 추출 , R은 6개 추출
x = 1:20
head(x)
tail(x)

# 추출하고 싶은 개수 담을 수 있음
head(x,3)
tail(x,3)

# 집합 : 합집합 (union), 교집합(intersect), 차집합(setdiff),
# 비교(setequal):
x = c(1,2,3)
y = c(3,4,5)
z = c(3,1,2)

union(x,y)
intersect(x,y)
setdiff(x,y)
setequal(x,z)

#베이스 R이 제공하는 기본 데이터 목록을 확인하는 명령
data()

help(iris)

head(iris)
tail(iris)

# 기초통계량
summary(iris)

# 데이터 정보
str(iris)
View(iris)
View(ChickWeight)
help(ChickWeight)

View(women)

val <- c(1,2,3,4,5,6,7,8,9)
val

summary(val)

# 정규분포난수
xy = rnorm(30)
xy

# 원소의 개수
length(val)
mean(val)
var(val)
# 표준편차
sd(val)
range(val)

# 삼각함수
# sin(),cos(),tan()
# abs()
# round()

sin(val)
abs(val)
round(val)

# 데이터 유형 : mode()
# 실수가 정수보다 크기때문에 실수화되어진다
xx = c(0.2, -1.2, 2, -0.5)
xx
mode(xx)
yy=1:9
max(yy)
mean(yy)
median(yy)
length(yy)
xx = 1:10
length(xx)
median(xx)
sum(xx)

#NULL, NA, NaN
sqrt(-3)
x=c(1,3,NA,4,20,7,NA)
x

mean(x)
# NA 포함하기 때문에 계산불가

# 하지만, 옵션이 있음, rm: remove, tap키 누르면 도움말 뜸
mean(x,na.rm = T)

grade = c ('하하','중하','중','중상','상상')
oo = factor(grade,levels=c('하하','중하','중','중상','상상'), ordered = T)
oo



x = array(1:27,dim=c(3,3,3),dimnames=list(c('행1','행2','행3'),c('열1','열2','열3'),c('면1','면2','면3')))
x

















