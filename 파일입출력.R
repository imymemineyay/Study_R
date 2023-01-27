# 파일 입출력
# R에서 사용 중인 데이터의 저장 및 불러오기
no = c(1,2,3,4)
name=c('apple','banana','orange','pear')
price=c(900,2000,1500,1800)
qty=c(5,2,4,7)

fruit=data.frame(No=no,Name=name,Price=price,Qty=qty)
fruit

# 현재 선언된 변수 목록 확인
ls()

# test.dat 파일에 저장
# \를 /로 바꿔야함
save(no,name,fruit,file="C:/k_digital/source/data/test.dat")

# 현재 작업 중인 변수 삭제
rm(no,name,fruit)
ls()

name
no
fruit


# 저장된 데이터를 로딩
load("C:/k_digital/source/data/test.dat")
ls()
fruit

# 텍스트파일 저장 및 불러오기
# 데이터를 배열 형태로 읽어들인다.
# 공백문자, 탭, 줄바꿈 등을 기준으로 단어 단위로 배열 저장
#  what = "(다양한 자료형이 섞여 있을 경우
# 비워둔다)"
data = scan("C:/k_digital/source/data/text.txt", what="")
data
data[4]
str(data)

# 배열이 아닌 데이터프레임 형식으로 읽어오기
row = read.table("C:/k_digital/source/data/text.txt", header = TRUE , sep="\t")
row

?read.table
# R 내장 파이썬 사용


















