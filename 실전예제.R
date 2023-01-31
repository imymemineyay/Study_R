# 한국인의 생활실태를 담은 데이터 셋
## 데이터불러오기
# 1. 필요 패키지 설치 및 불러오기
# SPSS,SAS,STATA
# foreign 패키지
install.packages("https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-71.tar.gz", repos = NULL, type="source")
library('foreign')
library(dplyr)
library(ggplot2)
install.packages("readxl")
library(readxl)

# 데이터 불러오기
raw <- read.spss("Koweps_hpc10_2015_beta1.sav",to.data.frame=T)
raw
df <- raw
df
str(df)

# 내용 확인
head(df)

# 차원 확인
dim(df)

# 수치형 데이터의 기초 통계량 확인
summary(df)

# 4. 데이터 변형 - 변수 이름 변경
# 형식 : rename(data,new = old,new=old)

df <-rename(df,
            gender = h10_g3,
            birth = h10_g4,
            marriage = h10_g10,
            religion = h10_g11,
            code_job = h10_eco9,
            income = p1002_8aq1,
            code_region=h10_reg7
            )
df
names(df)

# 5. 탐색적 데이터 분석
# 변수를 검토하고 분석하기 좋은 형태로 전처리
# -> 성별, 생일, 혼인여부, 종교, 직업, 급여,지역
# 분석에 사용할 변수들의 전처리

# 변수의 특성을 파악하고 이상치를 정제하고 필요에 따라 파생변수 생성
# 변수 간 관계 분석
# 분석에 사용할 변수들 간에 관계가 있는지 관계를 파악
# 가설을 세우고 분석한 결과를 시각화 작업

welfare <- df[,c('gender','birth','marriage','religion','code_job','income','code_region')]
names(welfare)

## 성별 전처리 필요여부 확인
table(welfare$gender)
class(welfare$gender)
## 성별이 무응답일 경우 9로 되어 있고, 이것을 이상치로 보고 NA로 변경하는 작업
welfare$gender <- ifelse(welfare$gender==9,NA,welfare$gender)

#결측치 여부 확인
table(welfare$gender)
table(is.na(welfare$gender))
## 성별데이터가 1일 경우 male, 2일 경우 female
welfare$gender <- ifelse(welfare$gender==1,"male","female")
table(welfare$gender)
welfare$gender <- as.factor(welfare$gender)
class(welfare$gender)
qplot(welfare$gender)



# 6. 가설
# 성별과 급여에 관련성이 있는지
# 성별에 따른 급여의 차이는 얼마나 될까?
class(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(0,1000)

# 월급 전처리
#  0.0이거나 9999일 경우 결측 처리한다.
welfare$income<-ifelse(welfare$income %in%  c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

# 성별에 따른 급여 평균을 요약
x <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(mean_income = mean(income))

x

# geom_col:
# geom_bar:

ggplot(x,aes(x=gender,y=mean_income)) + geom_col()


# 나이에 따른 급여의 관계를 분석하자
## 몇살때 급여를 가장 많이 받을까?
## 사용될 변수 : 나이, 급여
# 나이 = 2015 - 출생년도 + 1
class(welfare$birth)
summary(welfare$birth)
table(is.na(welfare$birth))

welfare$age <-2015-welfare$birth + 1

# 나이만 가지고 통계량 보기
summary(welfare$age)

qplot(welfare$age)

# 성별과 급여의 차이가 연령대별로 얼마나 다를까?
# 나이와 월급을 가지고 요약하기
data <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarize(mean_income = mean(income))
  

head(data,7)


# 시간에 따라 시각화할 때 선그래프 그림
ggplot(data,aes(x=age,y=mean_income)) +geom_line()


## 연령대별 급여의 차이
# 청년층(you), 중장년층(mid), 노년층(old)
## mutate()
welfare <- welfare %>% mutate(ageGroup = ifelse(age<=34,"you",ifelse(age<=65,"mid","old")))
table(welfare$ageGroup)
qplot(welfare$ageGroup)
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(ageGroup) %>%
  summarize(mean_income = mean(income))
data
ggplot(data, aes(x=ageGroup, y = mean_income)) + geom_col() + 
  scale_x_discrete(limits = c("you","mid","old")) 

## 연령대와 성별에 따른 급여의 차이를 요약
data <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageGroup,gender) %>%
  summarise(mean_income = mean(income))
data

data
ggplot(data, aes(x=ageGroup, y = mean_income, fill = gender)) + geom_col(position = "dodge") + 
  scale_x_discrete(limits = c("you","mid","old"))  

# 성별과 나이에 따른 급여 요약
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(age,gender) %>%
  summarise(mean_age=mean(income))
data

ggplot(data,aes(x=age,y=mean_age,col=gender)) + geom_line()

ggplot(data,aes(x=age,y=mean_age,color=gender)) + geom_line() + scale_color_manual(values=c('red', 'blue'))


ggplot(data,aes(x=age, y=mean_age, color=gender)) + geom_line() + scale_fill_manual(values=c('red', 'blue'))



# dodge : 막대기 분리하는 의미
# 직업별 급여의 차이가 날까?
class(welfare$code_job)
table(welfare$code_job)

list_job <- read_excel('Koweps_Codebook.xlsx',sheet = 2, col_names=T)
list_job

welfare <- left_join(welfare,list_job,id='code_job')
head(welfare,10)

# 직업별 급여의 차이를 분석하고 시각화시키는

job_data <- welfare %>% 
  filter(!is.na(income) & !is.na(job)) %>%
  group_by(job) %>%
  summarize(mean_income = mean(income))
job_data
head(job_data)

# 급여가 많은 직업군 10개를 추출
top10 <- job_data %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10

ggplot(top10,aes(x=mean_income,y=job)) + geom_col()

# 정렬한 후 
ggplot(top10,aes(x=reorder(job,mean_income),y=mean_income))+geom_col() + coord_flip()


under10 <- job_data %>% 
  arrange(mean_income) %>% 
  head(10)

under10

ggplot(under10,aes(x=reorder(job,-mean_income),y=mean_income))+geom_col() + coord_flip() + ylim(0,800)

# 성별에 따른 직업 선호도
job_cnt <- welfare %>% 
  filter(!is.na(job) & gender == "male") %>%
  group_by(job) %>%
  summarise(cnt=n()) %>%
  arrange(desc(cnt)) %>%
  head(10)

job_cnt

job_cnt1 <- welfare %>% 
  filter(!is.na(job) & gender == "female") %>%
  group_by(job) %>%
  summarise(cnt=n()) %>%
  arrange(desc(cnt)) %>%
  head(10)

job_cnt1

ggplot(job_cnt,aes(x=reorder(job,cnt),y=cnt))+geom_col(fill="light blue") + coord_flip() ->aa

ggplot(job_cnt1,aes(x=reorder(job,cnt),y=cnt))+geom_col(fill="pink") + coord_flip() ->bb

# ggplot 그래프 여러개 띄우기 : gridExtra 패키지 활용
library(gridExtra)
grid.arrange(aa, bb, nrow= 1, ncol = 2)


# 종교 유무에 따른 이혼율?
# 종교가 있는 사람이 이혼을 덜 할까?
# 필요한 변수 : 종교, 혼인상태
# 있음 1 없음 2
table(welfare$religion)
welfare$religion <- ifelse(welfare$religion ==1, "yes","no")
welfare$religion <- as.factor(welfare$religion)
qplot(welfare$religion)

# 1 결혼 3 이혼 나머진 NA
# 파생변수 : 이혼유무
welfare$md <-ifelse(welfare$marriage==1,"married",ifelse(welfare$marriage==3,"divorce",NA))
table(welfare$md)
table(is.na(welfare$md))
qplot(welfare$md)

xx <- welfare %>% 
  filter(!is.na(welfare$md)) %>%
  group_by(religion,md) %>%
  summarize(n = n()) %>%
  mutate(tot = sum(n),
         pct= round(n/tot * 100,1))

xx

# mutate는 변수를 만드는 함수
## dplyr 패키지가 가지고 있는 함수
## count() : 집단별 빈도를 구하는 함수
# count 함수를 구형하면 mutate함수에서 하나로 통합해서 처리가능

yy <- welfare %>% 
  filter(!is.na(md)) %>%
  count(religion,md) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100,1))
yy

# 이혼추출
divorce <- yy %>% 
  filter(md == "divorce") %>%
  select(religion,pct)

divorce

ggplot(divorce,aes(x=religion,y=pct)) + geom_col()


# 노년층이 가장 많은 층은 어디일까?


# 남녀중 결혼 비율이 많은 건 어디일까?




