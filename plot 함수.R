# plot() : 산점도(scatter plot)
?plot
x <- 1:10
y <- x^2
plot(x,y)
plot(x,y, col="orange",pch=18)
# xlab, ylab : x와 y의 축 제목
# main : 차트제목
# pch : 점의 종류, 숫자나 문자로 지정 가능
# cex : 점의 크기
# col : 색상
# xlim, ylim : x, y 축의 값 범위
# type : 그래프 유형
# lty : line style , 선의 유형


# 축 이름과 차트 제목 달기
plot(x,y, xlab="x축 이름",ylab="y축 이름",
     main="차트 제목")






# 점의 종류
example(points)
?pch




# 점의 크기 
x = rep(1:5,rep(5,5))
x
y = rep(5:1,5)
plot(x,y,cex=0.5)
plot(x,y,cex=0.5,col="red")

a <- 1:10
b <- a^2

# 차트를 부각시키고자 할때 사용하는 범위 설정
# plot(a,b,xlim=c(하한,상한),ylim=c(하한,상한))
plot(a,b,xlim=c(4,6),ylim=c(20,40))

# type : 그래프 유형
# par(mfrow) : 그래프 배열, 행렬
par(mfrow = c(2,3))
x = 1:10
y = x^2
plot(x,y, type = 'l',main="lines")
plot(x,y, type = 'h',main="histogram")
plot(x,y, type = 'n',main="no plotting")
plot(x,y, type = 'b',main="both points and lines")
plot(x,y, type = 's',main="stair steps")
plot(x,y, main="default:points")

# cars :자동차의 속도와 제동거리의 관계
# layout() 
# border : 테두리 
m = matrix(c(1,1,2,3),ncol=2, byrow=T)
m
layout(mat=m)
plot(cars, main="scatter plot of cars data")
hist(cars$speed,col="lightblue",border="white")
hist(cars$dist,col="orange",border="white")

# points() : 점을 그리는 함수
# 기본 plot() 함수 아래에 기존에 그려진 그래프에
# 점을 추가할 때

plot(iris$Sepal.Length, iris$Sepal.Width, 
     cex=0.5,pch=20, xlab="length",
     ylab="width", main="iris")

points(iris$Petal.Length,iris$Petal.Width,
       cex=0.5, pch="+",col="green")

# lines():꺾은선 그래프를 그리는 함수
# plot 함수와 함께 사용하여 꺽은 선을 추가할 때
# 사용
# 시계열 데이터 : 시간의 흐름을 측정한 데이터
x = seq(0,2*pi,0.1)
y = sin(x)
plot(x,y,type="n")
lines(x,y,lty=3) # lty 3은 dotted와 같음

# abline() : 직선을 그리는 함수
plot(x,y)
abline(v=3,lty=2)
abline(h=0,lty=3)

#lty = 'blank' == lty=0
# lty = "solid" == lty =1
# lty = "dashed" == lty = 2
# lty = "dotted" == lty = 3
# lty = "dotdash" == lty = 4
# lty = "longdash" == lty = 5

abline(v=3,lty=2)
abline(h=0,lty=3)
abline(a=-1,b=1,col="red") # y=x-1
abline(a=1,b=-1,col="blue")

# curve() : 곡선을 그리는 함수
curve(expr = sin,from = 0,to = 2*pi)

# text(x좌표, y좌표, labels='표시할 문자', adj = NULL) : 차트에 문자열을 표시하는 함수
# adj : text의 위치를 지정하는 옵션
# (0,0) 우측상단, (0,1) 우측하단, (1,0) 좌측상단,
# (1,1) 좌측하단,
?text

plot(4:6,4:6, type="n")
text(5,5,"X")
text(5,5,"천재",adj=c (0,1))

# polygon() : 다각형을 그리는 함수
# 신뢰구간 같은 범위 값을 표현할 때 유용
data = seq(-pi,pi,length.out=12)
x = cos(data)
y = sin(data)
plot(1:6, type="n",main="polygon", axes =F)
x1 = x+2
y2= y+4.5
polygon(x1,y2)
text(2,5.7,adj=0.5,"default")

x2 = x+2
y1= y+2
polygon(x2,y1,col="gold")
text(2,5.7,adj=0.5,"gold")

# legend(x좌표값, y좌표값, 표시할 범례)
# 좌표값 대신 left , right , top, buttom,
# topleft, buttomright 문자를 이용해서 표시



# boxplot : 상자수염그래프, 데이터의 분포를 
# 보여주는 그래프
# 기초통계량 (최대,최소,사분위수)
# 이상치를 확인할 때 많이 씀
#  plotting없이 단독적으로 사용함
# 박스의 넓이 : irq : 3사분위수에서 1사분위수를 
# 뺀 값
#  실제 통계에서 이상치 계산할 때 irq사용


boxplot(iris$Sepal.Width)
# 이상치(outlier) 값을 판단할 수 있다.
# 이상치 : 정상범위를 벗어난 값
# IQR : Q3 - Q1
# 정상범위 기준 : IQR(Interquartile Range) *1.5
# 최대 이상치 = 3Q + IQR*1.5 
# 최소 이상치 = 1Q - IQR*1.5


# $stats : 기초통계치 (min,1Q,median,3Q,max)
boxplot(iris$Sepal.Width)$stats

# $n : 통계량
boxplot(iris$Sepal.Width)$n

# 이상치에 있는 이상점 반환
# $out : 이상점
boxplot(iris$Sepal.Width)$out

# hist() : 히스토그램, 
# : 데이터 분포를 보여주는 그래프

hist(iris$Sepal.Width)

# table() : 범주형 데이터의 건수
table(iris$Sepal.Width)


