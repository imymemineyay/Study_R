# dplyr
# filter() : 행추출, alike with subset()
# select() : 열추출
# arrange(): 정렬 기본은 오름차순, desc() 내림차순
# mutate(): 새로운 열을 생성할 때 사용
# summarize: 통계치 산출
# group_by:
# left_join() : 열단위로 합치는 것
# bind_join() : 행단위로 합치는 것
# %>%, chain() : 체인함수, 파이프 연산자

# 실습용 데이터 불러오기
exam <- read.csv("C:\\k_digital\\source\\data\\csv_exam.csv")
exam
str(exam)
# 1반 학생들의 정보를 추출
exam[exam$class==1,]
exam %>% filter(class==1)

# 2반 학생들의 정보를 추출
exam %>% filter(class==2)


# 1반이 아닌 학생들의 정보를 추출
exam %>% filter(class!=1)

## 수학점수가 50점을 초과하는 데이터만 추출
exam %>% filter(math > 50)

## 1반이면서 수학점수가 50점 이상인 학생 추출
exam %>% filter(class==1 & math >= 50)

## 수학점수가 90점 이상이거나 영어점수가 90점 이상인 
# 데이터 추출
exam %>% filter(math >= 90 | english >=90)


## 1반, 3반, 5반의 학생정보 추출
exam %>% filter(class==1 | class==3 |class==5)
exam %>% filter(class %in% c(1,3,5))

## class1 class2 파생변수 생성
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

## 1반 수학점수 평균
mean(class1$math)
## 2반 수학점수 평균
mean(class2$math)


# mpg 데이터셋 이용
# q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다.
# displ(배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 highway가 
# 평균적으로 더 높은지 분석하시오.

str(mpg)
displ_4 <- mpg %>% filter(displ<=4)
displ_5 <- mpg %>% filter(displ>=5)

displ_4
displ_5
mean(displ_4$hwy)
mean(displ_5$hwy)



# q2. 자동차의 제조회사에 따라 도시 연비가 다른지 알아보려고 한다.
# audi와 toyota중 어느 제조회사의 자동차의 도시연비가 평균적으로 높은지 분석하시오

audi<- mpg %>% filter(manufacturer=="audi")
toyota <- mpg %>% filter(manufacturer=="toyota")

mean(audi$cty)
mean(toyota$cty)

# q3. 'chevrolet','ford','honda' 자동차의 고속도로 연비 평균을 알아보시오.
# 이 회사들의 데이터를 추출한 후 highway 전체 평균을 산출하시오.

cfh<- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))

mean(cfh$hwy)

all_hwy_mean <- mean(mpg$hwy)
all_hwy_mean


# select(): 조건에 만족하는 변수(컬럼,속성)
exam %>% select(english)

# 반, 수학, 영어만 추출
exam %>% select(class,math,english)

# 수학을 제외
exam %>% select(-math)

# 수학과학 제외
exam %>% select(-math,-english)

# filter()와 select() 결합
# class 1 인 데이터에 english 추출
exam %>% 
  filter(class==1) %>% 
  select(english)


# 학번과 수학만 앞에서 6개 추출
exam %>% 
  select(id,math) %>%
  head
# 괄호를 담지 않는다

# 학번과 수학만 앞에서 10개 추출
exam %>% 
  select(id,math) %>%
  head(10)

# Q1. mpg데이터셋에서 자동차 종류, 도시연비 만 앞에서 6개 추출

mpg %>% 
  select(class,cty) %>% 
  head

# q2. 자동차 종류에 따른 도시 연비가 어떤지 분석하려고 한다.
# 이때 자동차 종류가 suv인 자동차와 compact 중 어느 자동차의 도시연비가 높은지 분석하시오

suv = mpg %>% 
  filter(class == "suv")

compact = mpg %>% 
  filter(class == "compact")

summary(suv$cty)
summary(compact$cty)

boxplot(suv$cty,compact$cty,col="pink")


# arrange() : 정렬
# arrange(정렬컬럼)
## 수학 점수 가지고 오름차순
exam %>% arrange(math)
exam %>% arrange(desc(math))


# 반과 수학점수를 가지고 오름차순
exam %>% arrange(class,math)


# Q1. audi에서 생산한 자동차 중에서 
#어떤 자동차의 모델이 고속도로 연비가 높은지
# 알아보려고 한다.
# 이떄 1~5위 해당하는 자동차의 데이터만 추출

mpg %>% filter(manufacturer=="audi") %>%  arrange(desc(hwy)) %>% head(5)


mpg %>% filter(manufacturer=="audi") %>%
  select(manufacturer, hwy) %>%
  arrange(desc(hwy)) %>% 
  head(5)


