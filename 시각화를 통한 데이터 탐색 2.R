# 웹사이트에 공개된 데이터셋을 이용한 분석
tips = read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')

# 데이터 구조
str(tips)

# 속성의 의미 파악
View(tips)

# 데이터의 내용 파악
head(tips, 10)
tail(tips,10)

# 기초 통계 분석 
summary(tips)

# 필요 패키지 로딩
library(dplyr)
library(ggplot2)

# 동석자수(size)분포
tips %>% ggplot(aes(size))+geom_histogram()

# 결제금액과 팁은 관련성이 있을까?
tips %>% ggplot(aes(total_bill,tip)) + geom_point()

# 결제금액과 팁의 관련성을 본 데이터에 요일 추가
tips %>% ggplot(aes(total_bill,tip)) + geom_point(aes(col=day))

# 위의 데이터에 성별에 따라 볼릿기호 변경
tips %>% ggplot(aes(total_bill,tip)) + 
  geom_point(aes(col=day,pch=sex),size=3)

