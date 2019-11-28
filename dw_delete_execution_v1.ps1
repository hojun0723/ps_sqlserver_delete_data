#===================================================
#
# DW 테이블 특점시점에 특정데이터 삭제하기
# - 해당 스크립트를 작업 스케줄러에 등록
#
#===================================================

"********************* DB Connecting"
Get-Date -format "yyyy-MM-dd HH:mm:ss"

####################################### db 접속
$DBServer = "123.123.123.123"    #"(localdb)\v11.0"
$DBName = "database"
$uid = "userid"
$pwd = "password"
$sqlConnection = New-Object System.Data.SqlClient.SqlConnection
$sqlConnection.ConnectionString = "Server=$DBServer;Database=$DBName;Integrated Security=True;User ID = $uid; Password = $pwd;"     #"Server=$DBServer;Database=$DBName;Integrated Security=True;"
$sqlConnection.Open()
$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.connection = $sqlConnection

"********************* DB Connection Success"
Get-Date -format "yyyy-MM-dd HH:mm:ss"

####################################### 대상 테이블명
$table = 'TOSMM042'
$condition = 'BA_PLANT = ''2150'''

"********************* Data Processing"
Get-Date -format "yyyy-MM-dd HH:mm:ss"
# 파일별로 sql 테이블 INSERT
$sql = ""
$sql = $sql + "DELETE FROM "
$sql = $sql +  $table
$sql = $sql + " WHERE "
$sql = $sql + $condition

#$sql

$cmd.commandtext = $sql
$cmd.executenonquery()
$sqlConnection.Close()

"********************* Data Process Complete"
Get-Date -format "yyyy-MM-dd HH:mm:ss"