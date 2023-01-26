# 산술연산 - 계산기처럼 활용 가능
# 연산자 : +, -, *, /(실수의 몫), %/% (정수의 몫), %% (나머지), **(거듭제곱), ^(거듭제곱)
# 비교(관계)연산자 : TRUE (T), FALSE (F) 
# <, <=, >, >=, ==, !=, 
# 논리연산자 :  !(not), |(or, bit연산자), ||, &(and, bit연산자), &&(and) 
# bit연산자 : 0과1로 바꿔서 비교
# R자료형 : 숫자형(int정수, num실수, cpl복소수)
# 문자형 : chr, "" or ''
# 자료형 : 수치형, 비수치형(문자)
# 수치형 : 연속형, 이산형
# 연속형 : 실수형태를 가지고 있는 것
# 이산형 : 숫자와 숫자사이에 또 다른 숫자가 존재하지 않는 것, 정수
# 비수치형 : 서열형, 명목형
# 서열형 : 문자들이 순서가 있는 것
# 명목형 : 순서를 가지고 있지 않고 분류할 목적으로 가지고 있는 것
# 범주형 : factor
# 특수상수(값) : NULL (정의되지 않은 값, 알 수 없는 값), NA(not available, missing value
# 결측값, 누락된 값)
# Inf(인피니트), -Inf(음수의 무한대)
# NaN : Not a Number (숫자가 아녀), 0/0, inf/-inf, 연산이 불가능한 값
# R의 자료형을 확인하는 함수
# class(x) 클래스냐, is.integer(x)정수냐, is.numeric(x)실수냐, is.complex(x), 
# is.character(x)문자냐, is.na(x) 결측값이냐
# R 데이터형을 변환함수 as로 시작
# as.factor(x) x를 범주형으로 바꿔라 as.integer(x) 정수로 바꿔라 
# as.numeric(x) 실수형으로 바꿔라 as.character(x) 문자로 바꿔라 as.matrix(x) 행과 
# 열로바꿔라
# as.array(x) 배열로 바꿔라
# blood.type = factor('A','B','O','AB') 서열을 가지고 있지 않아 명목형이다.
# R은 1이상의 값을 가지고 있으면 VECTOR로 바꿔야 해서 c()함수를 활용해야 함
# blood.type = factor(c('A','B','O','AB'))
# is.integer(1) = FALSE , (안에는 변수가 와야함), 여기서는 실수로 바라봄
# is.integer(숫자L) : 장정수형이 기본형
# is.numeric(1) = TRUE
# is.numeric(1L) = TRUE 
# mode(x) : 자료형타입 구하는 함수

x <- 1 # 자료형이 규정되기 전, 그냥 숫자형인것
# x에 단순히 1을 넣을 경우 x는 숫자형
# 숫자형 - 정수형, 실수형, 복소수
x 
is.integer(x)

x <- 1L 
# L을 추가시켜서 자료형을 정해놓음

is.integer(x)

x = as.integer(1)
# 자료형을 규정함
is.integer(x)

# is.double : 실수형
# is.numeric : 아예 숫자
is.double(1)
is.double(x)
is.numeric(x)

# 사용하고 있는 변수 목록보는 함수 ls()
ls()

# 변수제거
rm(x)
ls()
x




FALSE + TRUE
# FALSE = 0
# TRUE= 1

# 다른 언어들이 배열을 선언할 때  int x[5] 자료형+배열이름+[배열크기]
# R은 인덱스가 1부터 시작함 (1차원 배열) , 같은 타입만 저장가능
# R은 배열의 크기를 저장하지 않아 가변길이배열이라고 불림
# R은 하나이상의 데이터를 저장하려면 vector사용해야함

# 한 줄에 여러 개의 것을 쓰려면 ';'으로 구분함
# c() : combine, vector만드는 함수
# mean() : 내장함수 중 avg를 구하는 함수















