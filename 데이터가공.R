# 데이터 탐색
# View() : 데이터 프레임 형태로 데이터를
# 조회하고 정렬 및 조건 검색
View(iris)
# subset() : 특정 조건에 만족하는 데이터 추출
# subset(x,condition,column selected)

# 별도의 $ 표시 없이 컬럼명(열이름)으로만
# 접근할 수 있는 함수
# attach(데이터프레임)
# <-> 해지하고 싶을 때, detach(데이터프레임)

# 미국 경제지표 데이터셋 longley
# 위 데이터프레임 구조 확인
str(longley)
longley

# [행,열]
# 컬럼명 확인필요
colnames(longley)
longley[longley$GNP>200 & longley$Population>=109 & longley$Year>1960,]
# $표시하기 싫을때 attach사용
attach(longley)
sum(GNP+GNP.deflator+Unemployed+Population)
# 메모리에서 지워줘야함 그리고 나서 다시
# attach하면 오류떠야함
detach(longley)
# 정렬 : order
# 그룹함수 or 집계함수 : aggregate()

# apply함수들
# apply():행렬의 행 또는 열방향으로 특정 함수를 적용하는데 사용하는 함수
# apply(행렬,방향,함수)
# 방향 == 축 : (1=>행,2=>열)

sum(1:10)
?apply
a = matrix(1:9,ncol=3)
a

b =matrix(1:9,ncol=3,byrow=T)
b

# a행렬의 행단위 합계
apply(a,1,sum)
# a행렬의 열단위 평균
apply(a,2,mean)

# iris 데이터 각 컬럼의 합을 계산하시오
iris
apply(iris[,1:4],2,sum)

# colSums() : 열의 합계
colSums(iris[,1:4])
# rowSums() : 행의 합계
# colMeans() : 열의 평균
# rowMeans() : 행의 평균

# lapply(data,함수): data-벡터,리스트
# 결과값도 리스트로 반환

## 숫자벡터 (1,2,3)의 각 요소를 2배한 
# 결과를 추출
result=lapply(1:3,function(x){x*2})
result

result[[1]]

# 리스트를 벡터로 변환하는 함수
# 다른 타입의 데이터를 가지면 번거로운
# 작업이 추가된다
# 벡터는 같은 종류의 타입만 가질 수 있기 때문
# unlist(result)
unlist(result)
x = list(a=1:3,b=4:6)
x

lapply(x,mean)

# 데이터프레임도 적용가능
str(iris)
lapply(iris[,1:4],mean)

colMeans(iris[,1:4])

# 데이터프레임을 처리한 결과를 리스트로
# 얻게되면, 그 리스트를 다시
# 데이터프레임으로 변환하는 
# 과정을 거쳐야한다.
# 순서 : unlist() -> matrix()벡터를
# 행렬로 바꿈 -> as.data.frame()를 통해
# 행렬을 데이터프레임으로 변환
# 컬럼명을 사라지니 주의 바람
# names()를 사용해서 list로 부터 변수명
# 을 얻어와서 생성된 데이터프레임에
# 열이름으로 부여해야 한다.

# step 1. 
lapply(iris[,1:4],mean)
# step 2. list -> vector
unlist(lapply(iris[,1:4],mean))
# step3. vector -> matrix
matrix(unlist(lapply(iris[,1:4],mean)),
       ncol=4,byrow = T)
# step4. matrix -> data.frame
as.data.frame(matrix(unlist(lapply(iris[,1:4],mean)),ncol=4,byrow = T))

# step5. data.frame -> variables
df = as.data.frame(matrix(unlist(lapply(iris[,1:4],mean)),ncol=4,byrow = T))
df
# step6. name column
names(df)=names(iris[,1:4])
df


# unlist()함수를 통해
# 데이터 손실이 발생할 수 있다.
# 이 문제를 해결하기 위한 함수
# do.call(호출할 함수, 파라미터)
# 리스트로 나온 결과를 다시 데이터
# 프레임으로 변환하는 함수

xx = data.frame(do.call(cbind,lapply(iris[,1:4],mean)))
xx
xx = data.frame(do.call(rbind,lapply(iris[,1:4],mean)))
xx


# sapply() : lapply()와 유사하지만 리스트
# 대신 행렬, 벡터 등으로 결과 반환
lapply(iris[,1:4],mean)
sapply(iris[,1:4],mean)



# 데이터프레임으로 변환 : 
# 행렬 -> 데이터프레임
# t(): 전치 행렬
as.data.frame(sapply(iris[,1:4],mean))
as.data.frame(t(sapply(iris[,1:4],mean)))
# data.frame 행렬이 아님 , 행렬보다 큰개념
# t()는 전치 행렬이라 matrix , vector
# sapply() : 벡터, 행렬로 변환

str(iris)
sapply(iris,class) # 자료형을 알려줌 쉬움

# iris 데이터셋 중 각 값이 3보다 큰지
# 를 판단
y = sapply(iris[,1:4],function(x){x>3})
y
head(y)
class(y)

install.packages("gapminder")
library(gapminder)
# 전체 데이터프레임을 화면에 표시
View(gapminder)

str(gapminder)

# 분석을 효율적으로 수행하기 위해서
# 데이터프레임으로 변환

gapminder = as.data.frame(gapminder)
gapminder

is.data.frame(gapminder)
str(gapminder)

# 샘플과 속성 추출
# 각 나라의 기대 수명을 확인
# 데이터프레임에서 샘플은 행으로 
# 속성은 열로 표현
gapminder[,c('country','lifeExp')]

# 각 나라의 기대수명을 추출하되, 분석년
#도도 함께 추출
gapminder[,c('country',"lifeExp","year")]

# 샘플추출
gapminder[1:15,]

# Croatia에 대한 정보만 추출
gapminder[gapminder$country=='Croatia',]

# Croatia 데이터 중 인구만 추출
gapminder[gapminder$country=='Croatia','pop']

# Croatia 데이터 중 인구와 기대수명
gapminder[gapminder$country=='Croatia',c('pop','lifeExp')]

# 다양한 조건을 이용해서 추출
# 크로아티아의 1990년 이후의 기대수명과
#인구 추출

gapminder[gapminder$country=='Croatia' & gapminder$year>=1990,
          c("lifeExp",'pop')]


# 크로아티아의 인구와 기대 수명의 평균
# 을 추출하시오

gapminder[gapminder$country=="Croatia",mean(c("pop","lifeExp"))]
# 오답노트 : 추출은 apply사용해야함 mean으로 원하는 값을 바로 추출불가
# apply 계열 함수는 주어진 함수 연산을 특정 단위로 쉽게 할 수 있도록 지원하는 
# 함수 군이다


apply(gapminder[gapminder$country=="Croatia",c("pop","lifeExp")],2,mean)


# 대한민국 인구의 최대값과 해당 연도를 
# 추출하시오
a=max(gapminder[gapminder$country=='Korea, Rep.','pop'])
gapminder[gapminder$pop== a,c('year','pop')]
a

y=gapminder %>% filter(country=="Korea, Rep.") %>% select(pop)%>% max()
y
# %>% = attach + return
# max(select pop from gapminder where country=="Korea,Rep.")

# 2007년도 아시아 대륙의 인구 총합을 추출하시오.

sum(gapminder[gapminder$continent=='Asia'&
                gapminder$year==2007,
              'pop'])

gapminder %>% filter(country=="Korea, Rep.") %>% filter(pop==y)

gapminder %>% filter(year==2007 & continent == 'Asia') %>% select(pop)%>% sum()

install.packages("dplyr")
library(dplyr)
# 열단위 select(데이터,컬럼 나열)
select(gapminder,country,year,lifeExp)
# 행단위 filter(데이커, 조건)
filter(gapminder,country=='Croatia')

# 행/열 단위 연산, summarize()
summarize(gapminder,avg_pop = mean(pop))

# 대륙별 인구의 평균추출, group_by()
summarize(group_by(gapminder,continent),pop_avg=mean(pop))

# 대륙와 나라별 인구의 평균 추출
summarize(group_by(gapminder,continent,country),pop_avg=mean(pop))

# 파이프연산자, %>%
gapminder %>% group_by(continent,country) %>% summarize(pop_avg=mean(pop))
gapminder %>% group_by(continent,country) %>% summarize(pop_avg=mean(pop))

gapminder %>% group_by(continent,country) %>% mean(pop)
View(gapminder)
gapminder

# 크로아티아의 기대수명의 평균
gapminder %>% filter(country == "Croatia") %>% select(lifeExp) %>% summarize(life_mean=mean(lifeExp))

temp1=filter(gapminder,country=="Croatia")
temp2=select(temp1,lifeExp)
temp3=apply(temp2,2,mean)
temp

# 대한민국, 중국, 일본 세 나라의 1인당
# 국내총생산과 기대 수명을 추출하시오.
gapminder %>% filter(country=="Korea, Rep."|country=="China"|country==
"Japan") %>% select(gdpPercap,lifeExp)


# 아프리카 대륙의 총인구가 유럽의
# 총인구보다 많았던 해를 추출하시오.
a = gapminder %>% filter(continent=="Europe") %>% select(pop)

b = gapminder %>% filter(continent=="Africa") %>% select(pop)
b

?apply

z = summarize(gapminder,max_compare=max(a,b))

gapminder[gapminder$pop==z,year]



## 정답지
gapminder %>%  filter(country=="Korea, Rep.") %>% select(gdpPercap,lifeExp)
gapminder %>%  filter(country=="China") %>% select(gdpPercap,lifeExp)
gapminder %>%  filter(country=="Japan") %>% select(gdpPercap,lifeExp)


## 같은 해의 인구를 묶은 것 그래서 group_by사용하는 것 
gapminder %>% filter(continent=="Africa") %>% group_by(year) %>% summarize(s= sum(pop)) -> s1

gapminder %>% filter(continent=="Europe") %>% group_by(year) %>% summarize(s= sum(pop)) -> s2

s1$s>s2$s

s1[s1$s>s2$s,'year']



# 패키지 설치 : install.packages("패키지명")
# 패키지로딩 : library(패키지명)
# 패키지제거 : remove.packages("패키지명")

# 데이터 정제 : 결측값과 이상치값 처리
# 결측값 : 통계에서 누락된 값
# 보간법 : 결측값을 다른 값으로 대체하거나 삭제하는 것
# is.na()로 결측값 찾기
# na.omit(): NA 포함된 행 다 제거
# 함수의 속성값 : na.rm =T, 계산시에 
# na를 제외하라는 것 
str(airquality)
head(is.na(airquality))
# 범주형 데이터의 건수를 확인하는 함수
table(is.na(airquality))
table(is.na(airquality$Temp))
# TEMP평균
mean(airquality$Temp)
table(is.na(airquality$Ozone))
mean(airquality$Ozone)
mean(airquality$Ozone,rm.na=T)
# Ozone에서 결측값이 없는 값만 추출
# sample은 행에다 추출 열은 안담아도됨
air_narm = airquality[!is.na(airquality$Ozone),]
air_narm
table(is.na(airquality$Solar.R))

# 결측값을 뺀 데이터셋을 이용하여 Ozone의
# 평균
mean(air_narm$Ozone)

# na.omit(): 결측값제거
air_narm2 = na.omit(airquality)
air_narm2
mean(air_narm2$Ozone)
# 함수 속성 na.rm
mean(airquality$Ozone,na.rm = T)


# 이상치값 : 일반적인 범주에서 벗어난 값
# 이상값이 많으면 신뢰성 하락

p = data.frame(name=c("aaa","bbb","ccc","ddd","eee"),
               age=c(21,22,25,26,45),
               gender=factor(c("w","f","m","k","w")),
               blood=factor(c("O","x","AB","B","k")))

p

# 성별의 이상값을 제거한 후 새로운 데이터
# 프레임 생성

p1 = p[p$gender=="m"|p$gender=="w",]
p1

# 성별과 혈액형에 이상값을 제거한 후 새로운
# 데이터프레임 생성
# [행조건,열조건],행조건-샘플추출
# [(조건식1)&(조건식2),]
p2= p1[p1$blood=="O"|p1$blood=="AB"|p1$blood=="B",]
p2

p3 = p[(p$gender=="m"|p$gender=="w")&(p$blood=="A"|p$blood=="B"|p$blood=="AB"|p$blood=="O"),]
p3

p4 = data.frame(name=c("aaa","bbb","ccc","ddd","eee"),
               age=c(21,22,25,26,45),
               gender=c(1,2,1,3,2),
               blood=c(1,3,2,4,5))

p4


# p4 데이터셋에 이상치를 찾아 NA로 대체하는 
# 작업을 수행하시오
p4$gender=ifelse((p4$gender<1|p4$gender>2),NA,p4$gender)
p4
p4$blood=ifelse((p4$blood<1|p4$blood>4),NA,p4$blood)
p4


boxplot(airquality[,c(1:4)])
boxplot(airquality[,1])$stats

#  122넘어가는 것들은 이상치