# 상관분석
# 변수 간의 관련성을 분석하는 방법으로 하나의 변수가 다른 변수와 관련성이 있는지 분석하는 법
# 회귀분석전에 변수간에 관련성을 분석하는 용도로 사용됨
# 가설검정전에 수행한다.
# 상관계수 : 피어슨 상관계수(일반적으로 많이
# 사용됨) 와 스피어맨 상관계수
# 상관계수 r의 변하는 정도를 -1~1사이의 값으로 나타낸다.

# 산점도(scatter plot)
# 두 양적 자료 간에 관계를 살펴보기 위한 시각화
windows()
plot(cars$speed,cars$dist, pch="*", col="red")

# 상관계수 구하기
# 상관계수를 구할때 모수적 방법인 Pearson이 있고 (양적자료형),비모수적인 방법으로 Kendall, Spearman (질적자료형)이 있다.
# 모수적인 방법 : 모집단이 정규분포를 갖는다는 가정하에 분석하는 방법
# 비모수적인 방법 : 모집단 분포에 대한 가정없이 분석 

cor(cars$speed,cars$dist,method="pearson")
# => 매우 높은 상관관계를 가지고 있다. 
# 절대값 1은 매우 강한 상관관계를 의미하기 때문

# 상관분석
# 두 양적 자료 간의 관련성(직선의 관계 = 선형의 관계)이 있는지를 검정하는 통계분석 방법
# 귀무가설 : 관련성 없다.
# 대립가설 : 관련성 있다.

cor.test(cars$speed,cars$dist,method = "pearson")

# 산점행렬도 : pairs(데이터프레임형태의 자료형)
str(iris)

plot(iris[,-5])
pairs(iris[,-5])

# 상관계수 행렬
# 여러개의 양적 자료간의 상관계수를 구하는 것
cor(iris[,-5])

# rcorr() : 여러 개의 양적 자료에 대한 상관계수와 유의 확률을 한번에구해주는 함수. 단, 데이터의 형태는 행렬(matrix)여야 한다.

install.packages("Hmisc")
library(Hmisc)

Hmisc :: rcorr(as.matrix(iris[,1:4]),type = "pearson")

# 상관계수의 시각화
result = cor(iris[,1:4])
# 패키지 설치
install.packages("corrplot")
library(corrplot)
corrplot(result,method="pie")
?corrplot
corrplot(result,type = "upper")

# 단순회귀분석
result <- lm(cars$dist~cars$speed,data=cars)
# 회귀분석의 결과 확인
summary(result)
# 종속 ~ 독립

#회귀방정식
# dist(제동거리) = 3.9324* speed(a) + (-17.5791)
# adjusted R-squared : 정확도
# = multiple R-squared