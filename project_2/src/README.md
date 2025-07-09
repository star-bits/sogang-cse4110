# MySQL Workbench 로컬 설정 + 실행 방법

### 1. 로컬 MySQL 연결 만들기

MySQL Workbench에서 새 연결 생성 → 아래 값 입력:

| 항목           | 값                                     |
| ------------ | ------------------------------------- |
| **Hostname** | `127.0.0.1`                           |
| **Port**     | `3306`                                |
| **Username** | `root`                                |
| **Password** | "Store in Keychain..." 클릭하고 `1234` 입력 |

### 2. 스키마 실행

1. 메뉴에서 `File → Open SQL Script`
2. `schema.sql` 파일 열기
3. 상단 번개 아이콘(⚡) 클릭 → 실행
4. 데이터베이스랑 테이블 생성됐다는 메시지 확인

### 3. 샘플 데이터 로딩

1. 다시 `File → Open SQL Script`
2. `sample_data.sql` 열기
3. 번개 아이콘(⚡) 눌러 실행
4. 테이블에 데이터 들어간 것 확인

### 4. 제대로 세팅됐는지 확인

1. 좌측 Navigator에서 SCHEMAS 옆에 있는 새로고침 아이콘 클릭
2. `convenience`라는 DB 보이면 OK
3. `STORE`, `PRODUCT`, `CUSTOMER` 같은 테이블 확인
4. 테이블 우클릭 → "Select Rows" 해서 데이터 있는지 보기

#### DB 비밀번호를 재설정 해야 할 때

MySQL Workbench에서 새 쿼리를 만들어 아래 SQL 명령어 실행:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;
```

### 5. MySQL에 연동할 C++ 코드 컴파일

```bash
g++ -std=c++11 main.cpp \
  -I[MySQL_설치경로]/include \
  -L[MySQL_설치경로]/lib \
  -Wl,-rpath,[MySQL_설치경로]/lib \
  -lmysqlclient -o main && ./main
```

예시:

```bash
g++ -std=c++11 main.cpp \
  -I/usr/local/mysql-8.0.42-macos15-x86_64/include \
  -L/usr/local/mysql-8.0.42-macos15-x86_64/lib \
  -Wl,-rpath,/usr/local/mysql-8.0.42-macos15-x86_64/lib \
  -lmysqlclient -o main && ./main
```

#### 라이브러리 경로 찾는 법

```bash
find /usr/local -name "libmysqlclient*" 2>/dev/null
```
