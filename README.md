# MC2-TEAM3-TechNoValley

## Fork

원본(메인)레포에서 브랜치를 생성하여 작업을 하는 것이 아니라, 각자 레포를 fork한 후, 본인의(포크한)레포에서 작업을 한 이후 원본(메인)레포에 PR을 요청하는 방식으로 진행하는 방법입니다.

- Fork를 통해 진행하는 이유
    - 이 방식을 사용하는 이유는 다수의 개발자가 동시에 원본 레포에서 작업할 경우, 서로 다른 브랜치에서 작업하는 도중 충돌이 발생할 가능성이 높기 때문입니다.
    - 따라서, 포크한 레포에서 작업을 하여 충돌을 방지한 후, 작업이 완료된 후 원본 레포에 Pull Request를 보내면, 코드 리뷰를 거친 후에 코드가 원본 레포에 merge됩니다.
    - 개인 공간에서 작업하기 때문에, 충돌이 발생할 가능성이 적어집니다.
    - 브랜치가 많아져 전체 흐름을 보기 어려운 것을 방지합니다.

### Fork를 이용해서 협업하기

1. 원본 레포를 fork하여 내 레포에 생성합니다.
2. git clone을 통해 원하는 디렉토리에 파일을 가져와줍니다. 

```
git clone https://github.com/{본인 아이디}/MC2-TEAM3-TechNoValley
```

3. remote 상태를 확인해 봤을 때, 아래의 창이 뜨면 origin과 upstream이 제대로 등록된 것입니다. 

```
git remote -v

/*
origin	https://github.com/ge-um/MC2-TEAM3-TechNoValley/ (fetch)
origin	https://github.com/ge-um/MC2-TEAM3-TechNoValley/ (push)
upstream	https://github.com/DeveloperAcademy-POSTECH/MC2-TEAM3-TechNoValley (fetch)
upstream	https://github.com/DeveloperAcademy-POSTECH/MC2-TEAM3-TechNoValley (push)
*/
```

### upstream에서 pull 받아오고, origin으로 push 날려서 PR 진행하기

- 공동 작업물을 받아와서 내 개인 컴퓨터로 작업을 한 뒤, 공동 작업물에 합칠 수 있도록 진행하는 것입니다.
- origin 브랜치에는 develop이라는 브랜치가 존재하므로, develop 브랜치에 push를 날려 주시면 됩니다.

### 진행 방법

1. 로컬에 브랜치를 생성하고, 해당 브랜치로 이동한 후 작업합니다. 

```
git switch -b {브랜치명}
ex) git switch -b HomeView
```

2. 작업이 끝난 뒤, add와 commit을 진행합니다.

```
git add . //작업 요소 전체를 staging area에 넣어줍니다. 
git commit -m "[Prefix] HomeView 레이아웃 구현" //무엇을 구현했는지 메세지를 작성합니다.
```

3. 내가 작업을 하는 도중에 다른 사람이 작업을 진행하여 원본(메인)레포가 변경되어 있을 수도 있으니, 확인을 위해 pull을 한 번 진행해줍니다.

```
git pull upstream develop //원본(메인)레포의 파일을 불러옵니다. 
```

4. 에러가 나지 않았다면, origin에서 작업한 내용을 push합니다.

```
git push -u origin {브랜치명} //해당 브랜치를 올립니다. 
```

5. PR을 통해 코드 리뷰를 진행한 뒤, approve를 해준다면 merge합니다. 
6. 기본 브랜치로 돌아옵니다.

```
git switch develop(main)
```

7. 1번부터 다시 진행을 하며 작업을 반복하면 됩니다.

## Commit Convention

- 원래 제목, 본문, 꼬리말로 나누는 편인데, 팀에서는 제목만 써도 상관 없을 듯 합니다.
- 커밋 타입
    - [Feat]: 새로운 기능 추가
    - [Setting]: 기초 세팅 관련
    - [Design]: just 화면. 레이아웃 조정
    - [Fix]: 버그, 오류 해결, 코드 수정
    - [Add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
    - [Del]: 쓸모없는 코드, 주석 삭제
    - [Refactor]: 전면 수정이 있을 때 사용합니다
    - [Remove]: 파일 삭제
    - [Chore]: 그 이외의 잡일/ 버전 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경
    - [Docs]: README나 WIKI 등의 문서 개정
    - [Comment]: 필요한 주석 추가 및 변경
- 제목
    - 제목은 최대 50글자가 넘지 않도록 하고 마침표 및 특수기호는 사용하지 않습니다.
    - 영문으로 표기하는 경우 동사(원형)를 가장 앞에 두고 첫 글자는 대문자로 표기합니다. (과거 시제를 사용하지 않습니다.)
    - 제목은 **개조식 구문**으로 작성합니다. --> 완전한 서술형 문장이 아니라, 간결하고 요점적인 서술을 의미합니다.

```
* Fixed --> Fix
* Added --> Add
* Modified --> Modify
```
## Coding Convention

- 아카데미 내부의 코딩 컨벤션 스타일을 참고해 주세요. 

https://github.com/DeveloperAcademy-POSTECH/swift-style-guide

## Member

- Miya, Jigu, Tomato, Hayo, Surgeon, Kori

## PS

하다가 어려운 점이 있으면 말씀해 주세요, 이해가 쉽도록 계속 수정 예정입니다.
