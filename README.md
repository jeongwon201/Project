# project-tactics | 축구 전술 시뮬레이션 커뮤니티
> 축구 전술 시뮬레이션 서비스와 커뮤니티를 결합한 웹 애플리케이션

<div>
  <img src="https://img.shields.io/badge/tactics-1.0 ver-blue"/>
  <img alt="GitHub License" src="https://img.shields.io/github/license/jeongwon201/project-tactics">
</div>
<br />
<br />

<div align="center">
    <image src="readme/images/home-small.png" style="float: left; width: 400px; height: 300px;"/>
    <image src="readme/images/tactics-create-small.gif" style="width: 400px; height: 300px;"/>
</div>
<br />

축구 전술 시뮬레이션 커뮤니티는 열정적인 축구 팬들을 위한 플랫폼으로, 동적인 전술 시뮬레이션을 경험할 수 있는 서비스를 제공합니다. 
실제 경기의 동작과 유사한 다이나믹한 전술 시뮬레이션을 구상하여 애니메이션으로 재생할 수 있습니다. 
사용자들은 팀의 전략을 그려나가는 과정에서 실전과 유사한 상황을 체험하고, 전략을 개발하고 테스트할 수 있는 기회를 갖게 됩니다.  

뿐만 아니라, 이 플랫폼은 전술 시뮬레이션을 공유하고 토론할 수 있는 커뮤니티 게시판을 제공합니다. 
사용자들은 자신의 전략을 공유하고 다른 사용자들의 전술에 대해 토론하며 서로의 아이디어를 공유할 수 있는 공간을 마련하였습니다. 
이를 통해 축구 전술에 관한 창의적인 아이디어와 지식을 교환하고, 커뮤니티 멤버들끼리 협력하여 전략을 더욱 발전시킬 수 있습니다.  

축구 전술 시뮬레이션 커뮤니티는 축구 전술에 관심 있는 사용자들에게 혁신적인 경험과 지식을 제공하며, 전략적인 축구 토론의 장을 열어줍니다.

## 시작하기

### 설치 방법

윈도우:
> Jdk 8 이상, Maven, Oracle Database 가 필요합니다.
1. Git Repository 를 Clone 하세요.  
> ```sh
> git clone https://github.com/jeongwon201/project-tactics.git
> ```
<br />

2. 프로젝트 내부로 이동 후, Maven 을 이용하여 프로젝트를 빌드하세요.  
> ```sh
> cd 경로/tactics
> mvn package
> ```
<br />

3. 오라클에 데이터베이스를 추가하세요.  
> 프로젝트 경로/sql/tactics.sql 파일을 오라클에서 실행하여 데이터베이스를 준비합니다.
<br />

4. Apache Tomcat 을 다운로드하세요.  
> <a href="https://tomcat.apache.org/download-90.cgi">Apache Tomcat Download</a> 에 접속하여 zip 확장자 파일을 다운로드 후 압축을 해제합니다.  
<br />

5. Apahce Tomcat 의 서버 환경을 설정하세요.  
> apache-tomcat-{version}/conf 폴더의 server.xml 을 자신의 환경에 맞게 수정합니다.  
> 
> 해당 부분을 찾아 본인이 원하는 포트 로 변경합니다.
> ```sh
> <Connector port="원하는 포트" protocol="HTTP/1.1"
>                connectionTimeout="20000"
>                redirectPort="8443"
>                maxParameterCount="1000"/>
> ```
> <br />
>
> Host 태그를 찾아 태그 내부에 다음을 추가합니다.  
> ```sh
> <Host ...>
>   ...
>   <Context path="/" docBase="tactics-1.0.0" reloadable="false" />
> </Host>
> ```
<br />

6. WAR 파일을 Apache Tomcat 에 추가하세요.  
> 앞서 2번에서 Maven 을 통해 빌드한 tactics-1.0.0.war 파일을 apache-tomcat-{version}/webapps 폴더 내부에 추가합니다.  
<br />

7. Apache Tomcat 을 실행하여 서버를 오픈하세요.
> apache-tomcat-{version}/bin/startup.bat 을 실행하여 서버를 오픈합니다.  
> apache-tomcat-{version}/bin/shutdown.bat 을 실행하여 서버를 종료합니다.  

### 사용 예제

_더 많은 예제와 사용법은 다음 링크를 참고하세요.

- <a href="https://github.com/jeongwon201/project-tactics/blob/main/readme/usage.md" target="_blank">축구 전술 시뮬레이션 커뮤니티 사용 예제</a>

## 업데이트 내역

* 1.0.0
    * 첫 출시
* 0.0.1
    * 작업 진행 중

## 작성자
- 이정원 - jeongwon201@naver.com

## 라이센스

이 프로젝트는 MIT 라이센스를 준수하며 <a href="https://github.com/jeongwon201/project-stmp/blob/main/LICENSE" target="_blank">LICENSE</a>에서 자세한 정보를 확인할 수 있습니다.

## 기여 방법

1. (<https://github.com/jeongwon201/project-tactics/fork>)을 포크합니다.
2. (`git checkout -b feature/fooBar`) 명령어로 새 브랜치를 만드세요.
3. (`git commit -am 'Add some fooBar'`) 명령어로 커밋하세요.
4. (`git push origin feature/fooBar`) 명령어로 브랜치에 푸시하세요. 
5. 풀리퀘스트를 보내주세요.

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
