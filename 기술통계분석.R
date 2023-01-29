# 데이터 생성
set.seed(1) # 난수를 일시적으로 고정시키는 것
?set.seed
data = rnorm(100,170,5)
# (갯수, 평균, 표준편차)
hist(data)

# 시각화 결과를 별도의 창으로 표시 :windows()
windows()

# 수치데이터 요약보고서(기술통계분석)
summary(data)

x <- hist(data,breaks=seq(150,190,by=2),
          col="pink",
          main="my histogram",
          xlab="height(cm)",
          axes=T)

x

# 계급 구간 지정(사용자가 지정한값으로 안될수도 있음), x 데이터의 특성을 반영하므로 보조적을 쓰는것을 추천.
# axes : TRUE시 축 그림 생성(디폴트)












# y축의 최대값
max(x$counts)

# 축 설정
## x축의 눈금 설정
x_axis_tick <- seq(150,190,by=2)
axis(side=1, at=x_axis_tick)

## y축 눈금 설정
y_axis_tick <- seq(0,max(x$counts),2)
axis(side=2,at=y_axis_tick)

# 범례 설정
legend("topright","height", fill="skyblue")
?rnorm








# 질적 자료(범주형 데이터)를 요약하는 시각화
# barchart : barplot()
# beer preference
beer <- c(3,4,1,1,3,4,3,3,1,3,2,1,2,1,2,3,2,3,1,1,1,1,4,3,1)

# (1) Domestic can (2) Domenstic bottle
# (3) Microbrew (4) Import
windows()

# 범주형 데이터의 건수(도수분포표)
table(beer)
barplot(beer)











barplot(table(beer))
table(beer)/length(beer)
















# 상대도수: 각 변량의 도수의 총 도수에 대한 비율
barplot(table(beer)/length(beer),
        col=c("lightblue","mistyrose",
              "lightcyan","lavender"),
        names.arg=c("Domestic\n can",
                    "Domestic\n bottle",
                    "Microbrew\n",
                    "Import\n"),
        ylab = "Relative frequency",
        main = "Beer Preference Survey")



















# pie chart = pie()
beer.counts <- table(beer)
pie(beer.counts)

names(beer.counts) <-c("Domestic\n can",
                       "Domestic\n bottle",
                       "Microbrew\n",
                       "Import\n")

pie(beer.counts)

?pie
















# 패키지 설치
install.packages("plotrix")
library(plotrix)
# 3차원 pie chart
pie3D(beer.counts,
      labels= names(beer.counts),
      labelcex = 1,
      explode = 0.2,
      col=c("brown","red","green","blue"),
      main="beer preference survey")










# 양적 자료를 요약할 때 사용하는 시각화
# stem()
data <- c(2,3,16,23,14,12,4,13,
          2,0,0,0,6,28,31,14,4,8)
stem(data)

# 히스토그램
hist(rnorm(1000), xlab="data")

# 히스토그램의 밀도함수 표현
x <- rnorm(1000)

windows()
hist(x,probability = T, xlab="data",
     col="lightblue",border="blue")









# 밀도 함수릂 표현하는 곡선
z <- seq(from=-3, to =3, by = 0.01)
lines(z,dnorm(z),col="orange")
# 추정선 붙이기
# dnorm : x가 주어졌을 때 f의 값을 구하는 것





















# 산점도(산포도) : scatter plot : plot()
plot(cars$speed,cars$dist,col="green",
     pch="@", ylab="제동거리", xlab="속도",
     ylim = c(-20,140))














attach(cars)


# with() : cars$를 사용하지 않도록 하는 함수

with(cars,plot(speed,dist,col="blue",
               pch="&",ylab="dist",
               xlab="speed",
               ylim=c(-20,140)))

detach(cars)

# fivenum과 summary의 결과는 데이터가 
# 홀수개일때 동일, 짝수개일때 다른 결과
fivenum(1:11)
summary(1:11)
fivenum(1:10)
summary(1:10)

# 1Q = 1 + (4-1) * (1/4)
# 3Q = 1 + (4-1) * (3/4) => summary
# fivenum은 두 수의 평균을 구해서 1,3 분위수 만든 것 

quantile(1:10)
# quantile 데이터 셋주고 백분율 담으면 
# 백분율에 해당하는 것만 추출

# IQR : 3사분위수 - 1사분위수
IQR(1:10)

# range() : min, max
# 범위 diff(range())
range(1:10)
diff(range(1:10))

# 범주형 데이터 : 파이차트, 막대그래프
# 최빈값(mode) - R에서는 mode함수 존재 X
# table(범주형 데이터) 
# 젤 건수가 많은 것은 mode
# which.max(table()) 젤 클값의 인덱스 

bloodType = c("A","B","O","AB","A","O","B","A","O","O","B","O","A","AB","B","O",
              "A","A","B")
bloodType




# 범주형 데이터의 건수
table(bloodType)

# 데이터셋에서 위치값을 반환하는 함수
# which, which.max,which.min
which.max(table(bloodType))

# 위에서 얻은 인덱스를 이용해서 이름 추출
names(table(bloodType)[1])

# 혈액형 데이터의 수
length(bloodType)

result <- table(bloodType)
result

names(result)
sum(result)




# addmargins() : 합계를 붙여서 표시하는 기능
addmargins(result)




















