## R 자료구조
# R이 제공하고 있는 자료형 : 수치형, 문자형, 논리형, 복소수형
# R의 자료구조 : 변수 => 벡터(vector) => 행렬(matrix) => 
# 데이터 프레임 => 리스트
# 변수 할당 방법 : 변수명 <- 값 (이 형태 권장)
# R은 변수를 객체로 취급한다.
# 값 -> 변수명, 변수명 = 값 
# 팩터(factor) : 범주형 데이터 생성시 사용
# 범주형 데이터 : 서열형, 명목형
# 팩터를 만드는 함수 : factor(벡터자료, levels, ordered=F)
# 외부데이터를 가져와서 csv 문자형 데이터가 r로 넘어올때 
# 벡터형으로 바껴져서 올때 많음 그래서 문자형으로 바껴야함
# R의 기본 자료형은 vector이다.
# vector : 값들의 집합 ,1개 이상의 데이터를 담고 있는 자료구조
# 1차원 배열 : 가변길이 배열 (데이터 크기 정해져있지 않음)
# vector 를 만드는 함수 : c(), start:end , seq(from, to, by), 
# rep(times/each) 
# length()함수, max(), min(), mean(), range(), rank(), sort()
# sum(), median(), sd() ...



# 배열(행렬,matrix) : 2차원 배열, 행(관측값)과 열(속성, 변수)로 이루어짐 ※ 행렬의 크기가 같아야함 
# array(),matrix(),rbind(),cbind()

# R base에서 제공하는 기본 데이터셋 목록을 확인하는 함수
# data()
data()
# women (데이터셋) : 
?women
# cars (데이터셋) :
cars
# 데이터의 구조 확인하는 함수
str(cars)

# iris
str(iris)

# plot(women) x축 y축 값을 만들어줌
plot(women)

# 양의 상관관계: 위로 오르는 선, 음의 상관관계: 아래로 
# 내려가는 선, 상관관계가 없다 : 직선

# 색주기, 한글로 축 제목 변경법, 점 모양 바꾸기
plot(cars,col="orange",xlab="속도",ylab="거리",pch=18)

?plot
help(plot)

# 데이터의 내용확인 : head(), tail()
# iris 데이터의 앞에서 3개의 데이터를 추출하라
head(iris, 3)
tail(iris)

# 데이터요소 추출해서 색바꾸기
plot(iris$Petal.Width,iris$Petal.Length,col=iris$Species)






















