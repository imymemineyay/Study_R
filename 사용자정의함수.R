# 함수(function):내장함수와 사용자 정의 함수
# 함수명(매개변수 or 인수){}
scores = c(90,76,58,82,66)

check=function(score){
  if(score >= 80){"합격"}
  else{"불합격"}
}

check(77)
check(90)
for(score in scores){
  print(check(score))
}