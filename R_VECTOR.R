# 할당 : 변수를 저장한다. 
# (=) 좌변에 우변의 값을 대입한다. 할당한다.
a = 2
print(a) # print()함수는 생략가능

# == : 같다는 논리연산자
# 논리연산자는 불값으로 출력된다.
a == 2
# > TRUE
a != 2
# > FALSE

# R은 하나이상의 값을 c()함수에 담아줘야 한다.
b = c(1,2,3,4,5)
b

# seq(from=시작숫자, to=마지막숫자, by=증가치)
# 순서대로 쓸 때는 = 생략가능
x = seq(1,5,2)
x
y = seq(1,10, by=2)
y
z=seq(10,1)
z


z1 = seq(10,1,-5)
z1

# start:end
x3 = 1:10
x3
x4=10:1
x4

# rep(반복할 값, 반복횟수) times, each
y1 = rep(1,10) # 1을 10번 반복해라
y1

y2=rep(c(1,10),2) # times생략하면 times로 간주주
y2

y3=rep(c(1,10),each=2)
y3

# 자동으로 실수화됨 (데이터자료형이 같아야하니까)
x <- c(1,2.5,3.2) # double
# L붙여야 정수형이됨
y <- c(1L,2L,3L) # integer
z <- c('KTX','SRT','BUS') # string
w <- c(TRUE,FALSE,FALSE,TRUE) #logical 대문자로 써야함

# indexing : []
# x벡터의 3번째 요소
x[3]
# x벡터의 1,3번째 요소
x[c(1,3)]

# 데이터 요소에 이름 붙이는 법 
# 이름의 개수와 데이터 개수가 같아야함
# names: 이름알아내거나 부여
fruit <- c(5,3,2)
names(fruit) <-c("딸기","오렌지","수박")
fruit
# 딸기와 수박을 가져오는 법
fruit[c('딸기','수박')]
# 이름을 한꺼번에 줄수있음
fruit <-setNames(c(5,3,2),c('딸기','오렌지','수박'))

# str() : 데이터구조, 자료형, 크기
# typeof() or mode() : 단순히 자료형을 알아내는 함수

typeof(x)

# is.datatype() : 형 확인
is.double(x)

# as.datatype() : 형 변환
mode(y)
as.double(y)

# numeric : 수치형 데이터(정수, 실수, 복소수)
typeof(y)
is.numeric(y)

typeof(w)
mode(w)
# bool값 수치화 가능
as.numeric(w)

length(x)

# typeof() : 벡터를 구성하고 있는 요소의 타입을
# 알려주는 함수
# is.double(): 실수인지 논리값으로 알려주는 함수
# as.double(): 실수 벡터로 변환하는 함수
# is.numeric(): 숫자 벡터인지 알려주는 함수
# as.numeric(): 숫자 벡터로 변환하는 함수
# length(): 벡터의 길이를 반환하는 함수

xx = c(1,2,3)
xy = c(1L,2L,3L)
typeof(xx)
typeof(xy)
as.integer(xx)
# 저장을 안해서 is.integer => false로 나옴
is.integer(xx)

xx <- as.integer(xx)
is.integer(xx)

# 새로운 벡터를 생성할때 주로 사용하는 함수 c()
a = c(1,2,3)
b = c(5,6)

#  a와 b사이에 숫자 4 집어넣기
x = c(a,4,b)
x

# 벡터의 인덱스 범위를 벗어나는 위치에 값을 할당하면
# 빈자리는 결측치 처리

a[7]=2
a

# append(): 기존의 벡터에 새로운 값을 추가해 새로운
# 벡터를 생성
# x벡터의 3번째 위치 다음에 99를 집어넣어라
append(x,99,after=3)
# x벡터의 1번째 위치에 -99를 집어넣어라
append(x,-99,after=0)

x = seq(from=0,to=1,by=0.1)
y = seq(from=1,to=1,length=11)
z=1:10
5:-5
x = 1:3; y=c(2,2,2); 
x+y
x-y
x*y
x/y
x^y

z = rep(2,5)
x + z # 1 2 3 1 2 + 2 2 2 2 2 출력은 되지만 경고 뜸

# 벡터와 스칼라(하나의 값)의 연산
# y -3 == y - rep(3, length(y))

x = 1:10; y=rep(5,10)
z = x<5
sum(z)

z = x<=5
sum(z)


x == 5
x != 5

(x>5)&(y<2) # and 연산
(x>5)|(y<2) # or 연산

# R은 다양한 수학/통계함수를 제공한다.
# rnorm() : 정규분포를 따르는 난수를 발생시키는 함수
# 정규분포 : 대칭을 이루는 것
# random == r
x = rnorm(10)
x
# 엔터 칠 때마다 값이 바뀜
#  시간을 고정시키는 것 씨드 함수
max(x) # 최댓값 구하는 함수
min(x) # 최소값 구하는 함수
sum(x) 
prod(x) # 모든 요소의 곱
mean(x)
median(x)
range(x) # 범위 - 최소값과 최대값
quantile(x) # 4분위 수
quantile(x,probs=c(0.2,0.7)) # 확률로 0.2와 0.7 
var(x) # 분산 - 평균에서 얼마나 벌어져있는지
sd(x) # 표준편차차


x;y
cov(x,y) # 공분산
cor(x,y) # 상관계수 0.7이상 강한 상관관계
sort(x) # 기본적으로 오름차순
rank(x) # 순위구하는 함수
order(x) # 
x[order(x)] # sort(x)

cumsum(x) # 누적합
cumprod(x) # 누적곱

cummax(x) # 누적최대값
cummin(x) # 누적최소값

# 성분별 최대값
pmax(x,y,z)
# 성분별 최소값
pmin(x,y,z)

# 결측값 NA

x = c(1,2,3, NA, 5)
# 결측값으로는 더할 수 없음
sum(x)
# 결측값 확인이 중요함
# is.na()함수 : 결측치 여부를 논리값으로 알려주는 함수
is.na(x)
# NA를 제외하고 결과값을 내고 싶다 na.rm=T(True)
sum(x,na.rm = T)

x=-10:10
x
x[3]
x[1:3]
x[c(1,3,5)]
# 1번째 요소를 제외하고 추출
x[-1]
# 1,3,5번째 요소를 제외하고 추출
x[-c(1,3,5)]

y=x[x<0]
y


# 보강법 : 결측값을 다른 값으로 대체하는 방법
x = c(1,2,3,NA,5)
# 결측값을 제외하고 추출
# 논리의 not == !
x[!is.na(x)]
# 결측값을 4로 대체
x[is.na(x)]=4
x






























