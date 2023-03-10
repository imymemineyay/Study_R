# 제어문 : 조건문과 반복문
# 조건문 : []조건식, if, if~else, 삼항연산자
# 삼항연산자 : ifelse(조건항,참,거짓), 거짓일때 
# ifelse반복해서 사용할 수 있음
# 반복문 : for문, while문, repeat(무한루프를 위해 만듦)
# repeat는 반복문을 벗어나는 문장을 가지고 있음

# 1. 조건문
# runif() : 난수 생성, 0~1사이 하나의 난수 생성
x <- runif(1)
print(x)
# x가 0보다 크면 절대값을 출력
# if(조건식)
if(x>0)print(abs(x))
# x가 0.5보다 작으면 1-x를 출력, 아니면 x출력
if(x<0.5) print(1-x) else print(x)
# 한줄로 쓰는 게 좋음 
# 삼항연산자 ifelse
ifelse(x<0.5,1-x,x)
# R자체는 print문 안써도 됨
# 하나의 숫자를 받아 짝수인지 홀수인지 판단하는 문
check = -9
if(check %% 2 == 0){
  print(check)
  print("짝수입니다.")
  print(abs(check))
}else{
  print(check)
  print("홀수입니다.")
  print(abs(check))
}

# switch 
point = 95
if(point>=90){
  print("A grade")
}else if(point>=80){
  print("B grade")
}else if(point>=70){
  print("C grade")
}else if(point >=60){
  print("D grade")
}else{
  print("F grade")
}

# as.character() : 숫자를 문자로 바꿀 때 
# as.numeric(): 로직,문자를 숫자로 바꿀때
# as.logical(): 논리값으로 바꿀 때
# as.data.frame(): 데이터 프레임으로 바꿀때
point = 95
grade = point %/% 10
switch(as.character(grade),
       "10" = print("A grade"),
       "9" = print("A grade"),
       "8" = print("B grade"),
       "7" = print("C grade"),
       "6" = print("D grade"),
       print("F grade")
       )


# 2. 반복문 : for, while, repeat
sum = 0
# 1부터 10까지 1씩 증가해서 누적합을 출력
for(i in seq(1,10,by=1))sum = sum+i
sum
  
# 구구단 3단 출력하기 3 * 1
dan = 3
for(i in 1:9){
  paste(dan,"x",i,"=",dan*i)
  cat(paste(dan,"x",i,"=",dan*i))
  cat(paste(dan,"x",i,"=",dan*i,'\n'))
  cat(dan,"x",i,"=",dan*i)
  cat(dan,"x",i,"=",dan*i,'\n')
}


# 구구단 출력
for(i in seq(2,9)){
  cat(paste("\n====",i,"단 ====\n"))
  for(j in seq(1,9)){
    cat(paste(i,'x',j,'=',i*j,'\n'))
  }
}


# while 
sum=0
i=0
while(i<10){
  i=i+1
  sum=sum+i
}
sum


# repeat :탈출조건을 직접 작성해야한다.
sum1=0
i=1
repeat{ # while(1)==while(T)
  sum1=sum1+i
  i=i+1
  if(i>10)break
}
sum1

# 1부터 10까지의 자연수 중 짝수만 출력하는 프로그램
for (i in 1:10){
  if(i%%2==0) print(i)
}

# 1부터10까지의 자연수 중 소수만 출력하는 프로그램
for (i in 1:10){
  check = 0
  for(j in 1:i){
    if(i%%j==0){
      check=check+1
    }
  }
  # 소수인지 판단하여 출력
  if(check==2)print(i)
}








