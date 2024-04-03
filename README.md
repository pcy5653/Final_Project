## 🏋️‍♂️ Cloud PT GroupWare (헬스 그룹웨어) 
- [프로젝트 개요](#프로젝트-개요)
- [팀원 소개](#팀원-소개)
- [내 담당 기능](#내-담당-기능)
- [개발환경 및 도구](#개발환경-및-도구)
- [기능 구현](#기능-구현)
    <details><summary>더보기
    </summary>     
       
        1. 접속
            1-1. 로그인
            1-2. 비밀번호 찾기
        
        2. 마이페이지
            2-1. 개인정보 등록
            2-2. 경력&자격증 등록 ('트레이너' 페이지만 해당)
            2-3. 개인정보 수정
            2-4. 비밀번호 변경
        
        3. 직원 
            3-1. 직원 목록
            3-2. 직원 등록, 수정, 퇴사처리, 삭제 ('총괄' 권한)
        
        4. 회원 
            4-1. 회원 목록
            4-2. 회원 등록, 수정, 삭제 ('총괄' 권한)
        
        5. 기구
            3-1. 기구 목록
            3-2. 기구 등록, 삭제 ('시설' 권한)

    </details>

<br>

## 📋프로젝트 개요
<p align="center"><img width="374" alt="헬스" src="https://github.com/koehdcks/Sul/assets/68891642/cfd0f5d0-cdba-45c0-a565-d6e02aa42957"></p>

> **프로젝트** : Cloud PT GroupWare (헬스 그룹웨어)   
> **기획 및 제작** : 김동찬, 박채연, 왕유빈, 윤소영, 이재혁  
> **제작 기간** : 2023.10.06 ~ 2023.11.21  
> **분류** : 팀 프로젝트  
> **사용 기술** : SPRING BOOT
>> **시스템 아키텍처**   
그림 들어간다.

<br>

## 👨‍👩‍👧‍👦팀원 소개
> **팀장** : 이재혁  
>수업캘린더, 식단, 스케쥴캘린더, 락커관리

> 💡**팀원** : **박채연**  
> **로그인, 회원&직원 관리, 마이페이지, 기구관리**

> **팀원** : 김동찬  
>결재, 싸

> **팀원** : 왕유빈  
>근태캘린더, PT등록, 이용권관리

> **팀원** : 윤소영  
>채팅, 공지사항, 메인페이지

<br>

## 🤠내 담당 기능
> #**회원**   
>>a) 1:1 내 문의 목록  
>>b) 1:1 문의 등록 (파일 첨부 및 SMS 수신 동의), 수정, 삭제  
>>c) 페이징 처리 및 검색 기능

> #**관리자**   
>> a) 1:1 전체 문의 목록. 답변 등록, 수정, 삭제  
>> b) FAQ 목록, 등록, 수정, 삭제, 페이징 처리  
>> c) 총괄 페이지 디자인

<br>

## ⚙️개발환경 및 도구 
> ### Framework  :  ![SpringBoot](https://img.shields.io/badge/spring_boot-%236DB33F.svg?style=for-the-badge&logo=springBoot&logoColor=white)  ![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white) <img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=MyBatis&logoColor=white"> 
> ### Design  : ![Adobe Photoshop](https://img.shields.io/badge/adobe%20photoshop-%2331A8FF.svg?style=for-the-badge&logo=adobe%20photoshop&logoColor=white)
> ### Library : ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white) ![SpringSecurity](https://img.shields.io/badge/spring_security-%236DB33F.svg?style=for-the-badge&logo=springsecurity&logoColor=white) ![LomBok](https://img.shields.io/badge/lombok-%23E34F26.svg?style=for-the-badge&logo=lombok&logoColor=white)
> ### IDE  : ![SpringToolSuite4](https://img.shields.io/badge/Spring_Tool_Suite4-6DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![visualstudiocode](https://img.shields.io/badge/visual_studio_code-007ACC.svg?style=for-the-badge&logo=visualstudiocode&logoColor=white) ![dbeaver](https://img.shields.io/badge/dbeaver-382923.svg?style=for-the-badge&logo=dbeaver&logoColor=white) 
> ### Language  : ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javas_cript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![Java](https://img.shields.io/badge/java-FF0000.svg?style=for-the-badge&logo=java&logoColor=white) 
> ### DB : ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)
> ### Server :  ![apachetomcat](https://img.shields.io/badge/apachetomcat-F8DC75.svg?style=for-the-badge&logo=apachetomcat&logoColor=white)
> ### OS  : ![windows](https://img.shields.io/badge/windows-0078D4.svg?style=for-the-badge&logo=windows&logoColor=white)
> ### Hosting : ![AWS](https://img.shields.io/badge/aws-232F3E.svg?style=for-the-badge&logo=amazonaws&logoColor=white)
> ### Other :  ![docker](https://img.shields.io/badge/docker-2496ED.svg?style=for-the-badge&logo=docker&logoColor=white) ![slack](https://img.shields.io/badge/slack-4A154B.svg?style=for-the-badge&logo=slack&logoColor=white) ![github](https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logo=github&logoColor=white) ![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)


<br>

## 🚀기능 구현

