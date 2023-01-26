# array() : N차원 배열, matrix() : 2차원 배열
# 동일한 자료형
# x = array(data=1:20,dim=c(4,5))
x = array(1:20, dim=c(4,5))
x

y = matrix(1:20,4,5)
y

# 4행 5열짜리 배열에 2만 넣어라
z = matrix(2,4,5)
z

z = matrix(c(1,2,3,4,5,6),nrow=2, ncol=3, byrow=T)
z

# 배열명 [행, 열]
z[2,3]

y= matrix(1:20,4,5)
y

# 2행, 4행의 모든 요소를 추출
y[c(2,4),]
# 1행, 2행의 모든 요소 추출
y[1:2,]

# 배열명[행,열]
x = 1:4
y = 5:8

cbind(x,y) # 열방향으로 결합 (행 개수 일치)
rbind(x,y) # 행방향으로 결합 (열 개수 일치)

a = matrix(0,4,5)
cbind(a,1:4)

A = matrix(1:20,4,5)
B = matrix(1:20,4,5)

C = cbind(A,B)
C

# 행렬의 연산 : 벡터화 연산
# 같은 위치에 있는 것끼리 연산이 이루어진다.

A + B
A * B
A/B

# matrix는 재사용 규칙이 없음 so, error발생
matrix(1:20,4,5) + matrix(1:10,2,5)

# t() 함수 : 전치행렬
t(A)
# 행렬곱 : %*%
A
#row의 개수 구하는 함수
nrow(A)
#col의 개수 구하는 함수
ncol(A)

# 열 이름 만들기
colnames(A)=c("alpha","beta","gamma","delta","etc")
A
rownames(A)=c("a","b","c","d")
A





























