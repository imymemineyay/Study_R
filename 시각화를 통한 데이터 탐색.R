# 데이터 탐색
# 기술통계량 : 데이터를 요약해서 대표값을 만들어 내는 것

# 식당의 배달시간을 측정한 값을 이용해서 기초통계확인

storeA = c(20,21,23,22,26,28,35,35,41,42,
           43,45,44,45,46,47,47,46,47,58,
           58,59,60,56,57,57,80) 
storeB = c(5,6,11,13,15,16,20,20,21,23,22,
           27,27,30,30,36,37,37,40,40,
           43,44,45,51,54,70,600)
storeC = c(5,5,5,12,10,11,20,20,20,20,20,21,
           20,30,32,31,31,31,36,40,40,51,61,
           51,61,61,70)
length(storeA)
length(storeB)
length(storeC)
# 평균 : 산술 평균 => 대표값
# A,B,C 식당의 평균 배달시간 산출
# 해석 : 평균적으로 ??분정도에 배달이 도착한다.
# 평균과 중앙값으로 분포를 알아낼 수 있다.
# 평균 == 중앙값 : 정규분포
#  한쪽으로 치우쳐질수도 있다.
mean(storeA)
mean(storeB)
mean(storeC)
# storeB 600분을 빼고 평균
storeB[storeB<600]
mean(storeB[storeB<600])
# 평균은 이상치에 민감한 대표값
# 그래서 조금 더 객관적인 지표로 삼을 수 있는
# 중앙값이 필요

median(storeA)
median(storeB)
# 해석 : A식당의 배달시간이 45분 이하인 경우가 50%
# B식당의 배달시간이 30분 이하인 경우가 50%

# 4분위수 : quantile()
# A식당 과 B식당의 사분위수 산출
quantile(storeA)
# 75% 가 56분 내에 배달됨
quantile(storeB)
# 75%가 41분 내에 배달됨

#시각화가 더 이해가 잘되니까 boxplot해줌

# fivenum():다섯개의 수치 요약을 추출
fivenum(storeA)
# 기초통계를 한눈에 볼 수 있는 함수, 가장 많이 씀
# summary()
summary(storeA)

boxplot(storeA)
boxplot(storeB,main="storeB")
# 600때문에 박스플랏 보기 불편, so 600제외
boxplot(storeB[storeB<600],main="storeB")

# A식당과 B식당의 배달 시간
boxplot(storeA,storeB[storeB<600],storeC, names=c('storeA','storeB','storeC'))
points(c(mean(storeA),mean(storeB[storeB<600]),mean(storeC)), col="red",pch=16,cex=2)

summary(storeB[storeB<600])
summary(storeC)

boxplot(storeB[storeB<600],storeC, names=c('storeB','storeC'))
points(c(mean(storeB[storeB<600]),mean(storeC)), col="red",pch=16,cex=2)

# 쌤 풀이
storeB = storeB[storeB<600]
mean(storeB)
quantile(storeB)
storeC
mean(storeC)
quantile(storeC)
boxplot(storeB,storeC,names=c("storeB","storeC"))

# 히스토그램 (막대그래프 비슷)
# : 연속된 수를 그래프로 표현할 때 구간을 나누고
# 그 구간의 빈도수를 파악하기 위해 사용하는 
# 그래프
# 막대그래프 : 이산형 데이터 barplot()
# 히스토그램 : 연속형 데이터 hist()

hist(storeB,main='B식당 배달시간 분포',
     xlab="배달 시간 구간", ylab = "건수")
hist(storeC,main='C식당 배달시간 분포',
     xlab="배달 시간 구간", ylab = "건수")
# B식당이 평균에 밀접해서 훨씬 안정적이다라고 
# 할 수 있음 배달시간 안정적 
# C식당은 들쑥날쑥해서 불안정적이다. 


# scatter plot : 산점도(산포도)

plot(cars$speed,cars$dist,type='p',ann=T)





























