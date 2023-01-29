# cars : 자동차의 속도와 제동거리를 가지고 있는 데이터 셋
plot(cars, col="green", pch="$")
lm(cars$speed~cars$dist)
summary(lm(cars$speed~cars$dist))

# r에서 lm함수는 linear regression의 핵심으로, 회귀분석, 단일계층분석, 공분산 
# 분석에 이용할 수 있다.
# linear regression : 종속 변수 y와 한 개 이상의 독립 변수 (또는 설명 변수) X와의 선형 상관 관계를 모델링하는 회귀분석 기법이다. 
#  상관계수란 변수들 간의 통계적 관계 표현을 위해 특정한 상관관계의 정도를 수치적으로 나타낸 계수로, 공분산을 표준화한 것이다.
# 값은 -1 ~ 1 사이이고 -1 혹은 +1에 가까울수록 상관관계가 높다고 판단할 수 있다.
# 상관계수를 구하는 방법에는 여러가지가 있는데 그 중 하나가 cor()을 이용하는 것이다. 
# cars$speed=cars$dist*x +b
# 상관관계로는 인과관계를 알 수 없음
# 인과관계 : 원인과 결과의 관계, 한 변수가 다른 변수에 영향을 주는 것
# 영향을 주는 변수 : 독립변수(independent variable)
# 영향을 받는 변수 : 종속변수(dependent variable)
# 회귀분석이란 독립변수와 종속변수 간의 인과관계를 분석하는 통계적 방법
# 독립변수가 1개면 단순회귀분석, 2개 이상이면 다중회귀분석
# coefficient : 계수, 변수에 묶여있는 수
# 독립 변수가 0일 때 종속 변수의 값을 확인하려면 INTERCEPT 함수를 사용



















# 건전지의 수명이 1000시간이라고 홍보
# 고객의 이의 제기
x <- c(980,1008,968,1032,
       1012,1002,996,1017,1009)

# 귀무가설 : 건전지의 수명시간은 1000시간이다 귀무 : A-B = 0
# 대립가설: 건전지의 수명시간은 1000시간이 아니다 A-B != 0

# 데이터의 개수가 적을 땐 정규분포 확인
# : Shapiro-wilk 검정
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.

shapiro.test(x)
# p-value == 0.8002
# 0.05보다 크므로 귀무가설을 채택한다.
# 따라서 정규분포이다. 
# 단일검정 t검정이 가능하다.
t.test(x,mu=1000,alternative="two.sided")
# two.sided 단순 크기 비교
# 샘플명, 비교옵션 1000시간, 
# 검정 통계량(Test Statistic)이란? 검정 통계량은 가설 검정에서 사용된 샘플 데이터로부터 계산된 랜덤 변수이다. 


# Question 어떤 학급의 수학 평균성적은 55점이다.
# 0교시 수업을 시행하고 나서 학생들의 시험
# 성적은 다음과 같다.
# 귀무가설: 우리가 증명하고자 하는 가설의 반대되는 가설, 효과와 차이가 없는 가설을 의미하며 우리가 증명 또는 입증하고자 하는 가설, 효과와 차이가 있는 가설을 대립가설이라고 한다.

score <- c(58,49,39,99,32,88,62,30,55,65,44,55,57,53,88,42,39)

# 0교시 수업을 시행한 후 학생들의 성적을 올랐다고 할 수 있을까?


# A학원은 성적향상에 도움이 될까?
shapiro.test(score)
# 귀무가설: 성적이 오르지 않았다.
# 대립가설: 성적이 올랐다.
# => 귀무가설 채택
# 시나리오 :A 학원은 성적 향상에 도움이 될 까?
t.test(score,mu=55,alternative="greater")
summary(score)






# A학원은 성적향상에 도움이 될까?
jumsu <- read.csv('C:\\k_digital\\source\\r_source\\score.csv',header=F)
jumsu
# 학원을 다니기 전의 성적
before<-jumsu$V1
after<-jumsu$V2
# Shapiro-Wilk
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.

#boxplot
boxplot(before,after,names=c("수강전","수강후"))

mean(before)
mean(after)

# 정규분포여부 검정
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.
shapiro.test(before)
shapiro.test(after)
# 둘다 0.05이상이라 귀무가설채택



# t.test(x,y,paired=TRUE, var.equal=T,
# alternative = "two.sided")
# paired : TRUE | FALSE
# TRUE : 대응표본 - 한 집단으로 부터 두번
# 반복해서 샘플을 추출, 데이터 수 동인
# FALSE : 독립표본 - 서로 독립된 두 집단으로 # 부터 샘플을 추출, 데이터 수 동일x 됨
# var.equal = TRUE | FALSE
# TRUE : 두 집단의 분산이 같다.
# FALSE : 두 집단의 분산이 다르다.
t.test(before, after , paired = T, alternative = "less")

# 분산이 같은지 아닌지 확인하려면 var.test
# 해봐라
var.test(before,after)
# 귀무가설 : 분산이 같다
# 대립가설 : 분산이 다르다

# alternative : 양측검정과 단측검정을 설정하는 옵션
# 양측검정 : 단순히 두 집단이 다르다라는 것만 확인하는 것 two.sided
# 단측검정 : 큰지 작은지까지 확인하는 것
# less, greater

# 평균이랑시각화하고도 구체적인 것을 알기위해
# t.test하는 것


# 일원분산분석(one-way ANOVA) == 분산분석
# 3개 이상의 집단간의 차이를 검정하는 분석기법
# 단, t-검정과 달리 anova 검정은 집단간의 차이가 존재하는지에 대한 여부만을 확인
# 귀무가설 : 3개의 집단의 평균이 같다.
# 대립가설 : 3개의 집단의 평균이 다르다.
# 귀무가설이 기각이 될때 사후검정함



# 설치된 패키지 정보 확인
library(help=MASS)
library(MASS)
?anorexia

# 거식증 환자의 몸무게 변화 평균값이
# 세가지 치료 방법 (cont, cbt,ft)에 상관
# 없이 동일한지 검정

# aov(종속변수~독립변수(그룹변수),dataset이름)
# 분산분석시 독립변수를 factor형으로 변환
# 해야 한다.



View(anorexia)
attach(anorexia)
change <- Postwt-Prewt # 종속변수
aov_result <- aov(change~Treat)
aov_result
summary(aov_result)

boxplot(change~Treat,col=rainbow(3))

# 사후감정 : 다중비교방식 (TukeyHSD)
TukeyHSD(aov_result)

plot(TukeyHSD(aov_result))

















