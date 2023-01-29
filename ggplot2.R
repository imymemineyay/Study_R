# package설치
install.packages("ggplot2")

# 패키지 로딩
library(ggplot2)

# 그래프를 그릴 공간 설정 : ggplot()
# ggplot(data,aes()) 
?ggplot
# data : 그래프로 사용할 데이터 프레임
# aes() : 시각화할 데이터의 항목, 요소(옵션)
ggplot2:: mpg
# :: => 소유 연산자
# ggplot2에 소유되어 있는 mpg를 가져온다
str(mpg)
mpg=as.data.frame(mpg)
str(mpg)
?mpg
View(mpg)

ggplot(data=mpg)+ geom_point(aes(x=displ,y=hwy))

classDf = data.frame( gender = c("m","f","m","f","m","f","m","f"), blood = c("A","A","AB","AB","B","B","O","O"), freq=c(4,3,1,1,0,5,5,1))
classDf
ggplot(classDf,aes(x=blood,y=freq))+geom_col(aes(fill=gender)) + geom_point(aes(shape=gender),
size=3)

ggplot(classDf,aes(x=blood,y=freq))+
  geom_col(aes(fill=gender))+
  ggtitle("Tiger classroom Blood Type Ratio",
          subtitle = "blood type and gender") +
  labs(x="Blood Type", y = "Number", fill="gender") ->x

x + theme_dark()

# qplot (x축 데이터, y축 데이터, 옵션)
qplot(Sepal.Length,Petal.Length,data=iris)

# 시즌별 티켓 판매량 분석
# 시즌 ("A","B","C","D","E")
abc = c(110,300,150,280,310)
barplot(abc,main="시즌별 판매량",xlab="period",
        ylab="sales",names.arg=c("A","B","C","D","E"),horiz=T,col="orange")

# 스포츠 경기별 판매량 분석
baseball = c(110,300,150,280,310)
soccer = c(180,200,210,190,170)
basketball = c(210,150,260,300,70)

data = matrix(c(baseball,soccer,basketball),5,3)
data

barplot(data,main="경기별 시즌의 판매량",xlab="경기종목",ylab="판매량", names.arg = c("야구","축구","농구"),col=rainbow(5),ylim=c(0,400),beside=T)

legend(14,300,c("야구","축구","농구"),cex=0.8,fill=rainbow(5))

# t()
barplot(t(data),main = "경기별 시즌의 판매량(누적표시형)",xlab="season",ylab="판매량",names.arg = c("A","B","C","D","E"),col=rainbow(3),horiz=T)
legend(4.5,1000,c("야구","축구","농구"),cex=0.8,fill=rainbow(5))

classDf = data.frame( gender = c("m","f","m","f","m","f","m","f"), blood = c("A","A","AB","AB","B","B","O","O"), freq=c(4,3,1,1,0,5,5,1))
classDf

class1=data.frame(blood=c("A","A","AB","AB","B","B","O","O"), freq=c(4,3,1,1,0,5,5,1))
ggplot(class1,aes(x=blood,y=freq)) + geom_col()
blood.Type = c("A","B","A","O","A","AB","B","A","O","O","B","AB","AB","O","A","B","B","O","AB","O")
class(blood.Type)
str(blood.Type)
table(blood.Type)
blood.Type=as.data.frame(blood.Type)
blood.Type
ggplot(blood.Type,aes(x=blood.Type))+geom_bar()

