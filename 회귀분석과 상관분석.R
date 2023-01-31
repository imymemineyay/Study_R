# 가설검정
# 우리가 주장하는 것이 맞는 지 아닌지
# 가설: 귀무가설, 대립가설
# 귀무가설 : 일반적으로 알고 있는 것
# 대립가설 : 기존에 있던 주장의 새로운 주장
# 귀무가설은 영가설, 같다, 차이가 없다
# 대립은 그 반대
# 유의수준, 유의성 : 기준이 되는 값 = 0.05
# 가설을 검정하기 위해 P-VALUE 값을 본다
# 0.05 미만 : 대립가설 채택
# 차이검증 : 단일표본 t검정, 대응표본 t검정, 독립표본 분산분석 ANOVA분석
# 인과관계, 상관분석과 회귀분석
# 회귀분석을 하기위해 상관분석을 하는 것
# 상관계수 : 양적 pearson  질적 kendall,spearson
# -1~1 절대값을 쳐서 1에 가까울 수록 큰 상관계수
# 양의 상관관계 증가할 때 같이 증가
# 음의 상관관계 증가할 때 감소
# 상관관계가 없다. 변화가 없을 때




# csv 는 기본적으로 , 로 구분하는 파일
purifier_df <- read.table(file="C:\\k_digital\\source\\data\\purifier.csv",header=T,sep=",")
# sep을 안주면 공백 열도 포함되기 떄문에 
# read.table은 sep을 지정해주는 것이 좋은 듯 
purifier_df
str(purifier_df)







# 수치데이터로 구성이되어 있으면 기술통계분석
# 을 통해 통계값을 확인한다.
summary(purifier_df)















# as기사 채용 
# as시간이 많이 걸리니까
# as시간 줄이는 법
# 전체 정수기 대여수와 as시간의 관계
# 오래된 정수기 대여수와 as시간의 관계

## 정수기의 총 대여수와 as소요시간의 관계를 분석 -> 상관분석 -> 시각화 -> scatter -> 산점도
# with 는 한정된 부분에서 데이터명을 기억하는 것 그래서 attach가 더 효율적
attach(purifier_df)
windows()
plot(purifier,as_time,xlab="총 정수기 대여수",
     ylab="AS시간",col="blue",pch="*")
# 양의 상관관계 => 총정수기 대여수와 as소요시간은 관계가 있다

# 노후된 정수기 수와 as관련성
windows()
plot(old_purifier,as_time,
     xlab="노후된 정수기 대여수",
     ylab="AS시간",col="red",pch="*")
# => 노후된 정수기 대여수도 as와 관련성 있음
# => 양의 관계 있음
# 어느정도로 관련성 있는지 수치 궁금
# 상관계수 구하기
# 총 정수기 대여수와 AS소요시간과의 상관계수
cor(purifier,as_time,method="pearson")
# 거의 1에 가까움
# 노후된 정수기 대여수와 AS소요시간과의 상관계수
cor(old_purifier,as_time,method="pearson")

# 분석 가설
# 정수기 as기사를 채용하려고 하는데 몇명의 기사를 채용해야 할까?

# 정수기 대여수가 1대 증가할 때마다 as소요시간이 얼마나 늘어날까?

# 노후정수기가 1대 늘어날때마다 as소요시간이 얼마나 늘어날까?

#  정수기 총 대여수와 노후된 정수기 대여수 중 어떤 것이 as소요시간에 더 영향을 주는가?

# 이번 달 정수기의 총 대여수와 노후된 정수기 대여수를 알 수 있을 까? -> 다음달 as소요시간 예측 가능한가?

# 정수기 as기사는 몇명이 적당할까?
# purifier : 전월 정수기 총 대여 수
# old_purifier : 전월 10년 이상 노후 정수기 총 대여수
# as_time : 당월 AS에 소요된 시간

summary(purifier_df)
# 독립변수의 유효성 => 상관성이 있어야함 
# old_purifier %in% purifier 
# 그래서 10년 미만 정수기 대여수 파생변수로 산출
# 전월 정수기 총 대여수와 10년 이상 노후된 정수기의 대여수
cor(purifier_df$purifier,purifier_df$old_purifier)

# 10년 미만 정수기 대여수 <- 총대여수 - 10년 이상 대여수
cor(purifier_df$purifier-purifier_df$old_purifier,purifier_df$old_purifier)

# 파생변수 생성 : 10년 미만 정수기 대여수
purifier_df$new_purifier <- purifier_df$purifier-purifier_df$old_purifie
str(purifier_df)

# 회귀분석
## 독립변수 : 전울 기준 10년 미만 정수기 대여수와 전월 기준 10년 이상 노후 정수기 대여수
## 종속변수 : 당월 기준 AS에 소요된 시간
##
lm_result <- lm(as_time~new_purifier+old_purifier, purifier_df)
lm_result
summary(lm_result)

# 회귀모델 방정식 : as시간 = 0.0881*(10년 미만) + 0.2398 * (10년 이상) + 193.7
# as시간은 10년 미만 정수기는 1대달 0.0881시간이 소요, 10년 이상 정수기 1대당 0.2398시간이 소요되는 것으로 ㅂ인다.
# 예측 : 월말 최종 대여수가 300,000대이고, 그 중 10년 이상 노후 정수기가 70,000로 집계되었다면 
input_predict <-data.frame(new_purifier=230000,old_purifier=70000)
# 예측값 저장, 익월 as시간
predict_astime <- predict(lm_result,input_predict)
predict_astime

# AS기사 1명이 한달간 처리하는 AS시간 = 8시간 * 20일 # 총몇명
predict_astime/160

# 233.7693명 약 234명 as 기사가 필요
#  구간추정/신뢰구간 95%
predict_astime <- predict(lm_result,input_predict,
                          interval= 'confidence',
                          level = 0.95)


predict_astime # 점 추정값

# 회귀분석 
# : 어떤 현상을 발생시키는 원인(독립변수)들이
#결과(종속변수)에 얼마나 영향을 미치는 지를   알아보는 통계 분석 및 예측 기법
# 독립변수 : 설명변수 | 종속변수 : 변화변수 

# y = f(x) + e (error, 오차)
# 과적합 : 데이터 분석시 분석할 데이터를 나눔
# 훈련용 데이터로 
# 머신을 훈련시킨 다음 모델 이런함수 만들어냄
# 결과를 받아서 제대로 값을 뽑아내는지
# 확인
# 트레이닝 데이터에 결과 괜춘 but 테스트데이터에서 결과 안좋음
# 요즘 최종데이터 이렇게 3개로 나누는데 최종데이터는 1번 사용
# 가장간결한 방정식 만들어내야함 => 직선
# 직선 = 회귀선 , 직선이 제대로 된 직선인지 확인해야함, 오차범위 고민해야함
# 오차 크면 신뢰성 낮아짐, 오차를 최소화할 수 있은 직선을 만들어내는 것이 중요
# 경사하강법 : 조금씩 선을 내리는 법
# 내리면서 오차를 계산, 오차가 최소가 되는 값
# 회귀방정, 회귀모델


# 상관분석 : 연관성 | 회귀분석 : 인과관계
# 다중공선성 : 독립변수 결정시 독립변수들간의 관계가 많으면 중복값이 많이 나올 수 있음
# 선형회귀분석
# 종속변수가 수치데이터(연속형) => 선형회귀분석
# 범주형데이터 => 로지스텍회귀분석
# cars
# speed :가속도(ml/h), dist :제동거리 (feet)
str(cars)
# 전체 데이터구조가 뭘로 만들어 졌는지 확인
# 데이터 프레임, 50개, 2개의 열
# 기울기, 절편(intercept) 
# y = 베타0(절편) + 베타1(기울기)x + e(오차)

# lm형식 : lm(fomula,data)
# 자동차의 속도와 제동거리 회귀분석
# fomula : 표현식, 종속변수~독립변수
# 독립변수가 여러개일 수 있음 그럴땐 + 붙임
# 모든 컬럼이 독립변수라면 .을 씀
# 하나의 컬럼을 뺴고 싶을 땐 - 붙이면 됨
# ex) 속도 = 제동거리 - 타이어면적 + 자동차무게
# 선형은 데이터프레임이여야 함

# 내장메모리나 fomula이런애들은 중복의 의미나
# 이러한 이유로 cars$ 안붙여써도 됨

result <- lm(dist~speed, cars)
result

# coefficient : 회귀계수
# 회귀모델 판단법 : 독립변수의 유의성(p_value값보기), 결정계수 r-suqared 0.xx =>xx%로 보면 됨 multiple : 회귀모델의 최적값 xx%의 결정력을 가지고 있다
# adjusted : 여러번의 시도로 얻어진 점수
# f통계량 전체모델에 대한
# residual: 잔차 관측값과 회귀직선의 예측값과의 차이, 실제값과 예측값의 차이 작을수록 좋음

# lm을 좀 더 자세히 보려면 summary() 이용
summary(result)
# dist = -17.579 + 3.932*X

# 회귀모델 방정식의 기울기와 절편조회
coef(result)
# 회귀방정식은 기울기와 절편만 필요해서 이 함수만 써도 됨

# 신뢰구간별 기울기와 절편
confint(result)
# 전체데이터를 100으로 두고 봤을때 기울기와 절편을 보여주는 것

# 잔차제곱합
# 모델평가시 작을수록 좋은 모델
# 학습시킨 데이터에만 최적합, but 새로운거엔 부정확 => 과적합, 
# 과소적합 : 너무 적은 데이터를 가지고 정확도는 좋음 but 트레이닝과 테스트의 결과 차이가 벌어지는 것
# 학습을 많이 시킬수록 정확도가 높은 것은 아님
# 어느 정도가 되면 변화 없음
# 모델모형이 제대로 학습되었는지 봐야함 
# 그 전은 피팅 : 모델 학습시키는 것
# 프레딕 : 예측, 평가

deviance(result)
# 어떤 값이 작은것인가? 현재 이건 비교대상이 없음
# 최적의 잔차의 제곱값의 합이 나온것
# 회귀분석을 통해 사용된 독립변수를 가지고 예측값 출력 (예측:학습)
fitted(result) # 모델을 가지고 예측 및 잔차 확인
# 위의 정수 = 스피드, 아래의 수 : dist
# - 나온건 오차, 오류
# multiple r-squred 랑 adjusted r_squared의 차이가 별로 없어서 학습시킬 필요없음
# 앙상블 : 여러개의 모델,알고리즘을 이용해 학습시키는것 투표를 통해서 정확도 확인하는것

# 실제 종속변수 값과의 차이(잔차)
residuals(result)
# -의 값을 가지고 있는지 확인하기 위해 시각화 과정을 가짐
# 회귀선 집어넣기
# 결과값을 이용한 시각화
windows()
plot(cars$speed,cars$dist,
     main="제동거리와 속도", 
     xlab="speed",
     ylab="dist")
# 회귀선 추가
abline(result,col="green")

# 도출된 회귀모델의 평가를 위한 시각화
#mfrow 행을 우선으로 채운다
windows()
par(mfrow=c(2,2))
plot(result)

# 예측 : 새로운 독립변수를 회귀모델 방정식에 대입해 종속변수를 예측
# 속도가 70일 때, 제동거리는?
X <- 70
dist = -17.579 + 3.932*X
dist

# 프레딕 함수 공식
# predict(결과object,예측할 독립변수를 담은 데이터프레임, interval(간격), level) 
# predict(object,data,interval,level)
# speed < - c(50,60,70,80,90,100)일때 제동거리예측
lm_result <- lm(dist~speed,cars)
speed <- c(50,60,70,80,90,100)
input <- data.frame(speed)
input

# 예측 : 점추정
output <- predict(lm_result,input)
# 결합 : rbind, cbind
cbind(input, output)

# 구간추정 예측
# 모델계수에 불확실성을 감안한 구간추정, 신뢰구간 95%

predict_dist <- predict(lm_result,input,
                        interval= 'confidence',
                        level = 0.95)
predict_dist # 점 추정값
cbind(input,predict_dist)

# 모델계수의 불확실성과 결과값에 대한 오차를 감안한 구간추정 예측/ 신뢰구간 95%
predict_dist <- predict(lm_result,input,
                        interval= 'prediction',
                        level = 0.95)
predict_dist
cbind(input,predict_dist)


# 실습데이터셋 : women
# 미국 30대 여성들의 신장과 체중을 가지고 있는 데이터 셋
# 상관분석과 회귀분석
# 귀무가설 : 미국 성인 여성의 몸무게는 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.

women
str(women)
shapiro.test(women$weight)
# => 귀무가설
shapiro.test(women$height)

plot(x=women$height,y=women$weight,xlab="height",ylab="weight")
















