# Git Convention

## 브랜치 전략

기본 브랜치는 `main`을 사용합니다.

`main` 브랜치에는 실행 가능한 상태의 코드만 유지합니다. 새로운 기능이나 수정 작업은 별도 브랜치에서 진행한 뒤 병합하는 것을 권장합니다.

## 브랜치 이름

브랜치 이름은 다음 형식을 사용합니다.

```text
<type>/<description>
```

주요 타입은 다음과 같습니다.

```text
feature  새로운 기능 개발
fix      버그 수정
docs     문서 작성 또는 수정
design   UI, 화면 구성, 디자인 관련 변경
asset    이미지, 아이콘, 폰트 등 리소스 변경
refactor 코드 구조 개선
test     테스트 추가 또는 수정
chore    설정, 빌드, 기타 작업
```

예시는 다음과 같습니다.

```text
feature/goal-editor
feature/skill-list
fix/todo-completion-state
docs/project-overview
design/home-view
asset/character-images
refactor/mvvm-structure
chore/update-gitignore
```

## 커밋 메시지

커밋 메시지는 Conventional Commits 형식을 기본으로 사용합니다.

```text
<type>: <summary>
```

예시는 다음과 같습니다.

```text
feat: add goal editor screen
fix: resolve todo completion state issue
docs: add project overview
design: update home screen layout
asset: add character images
refactor: separate goal model
test: add goal view model tests
chore: configure gitignore
```

## 커밋 타입

```text
feat      새로운 기능 추가
fix       버그 수정
docs      문서 작성 또는 수정
style     코드 포맷팅, 공백, 세미콜론 등 기능 변화 없는 수정
design    UI 디자인 또는 화면 구성 변경
asset     이미지, 아이콘, 폰트 등 리소스 추가 또는 수정
refactor  기능 변화 없는 코드 구조 개선
test      테스트 추가 또는 수정
chore     빌드 설정, 프로젝트 설정, 기타 관리 작업
```

## 커밋 단위 원칙

- 하나의 커밋은 하나의 목적만 갖습니다.
- 기능 추가와 리팩토링은 가능하면 분리합니다.
- 문서 변경은 `docs:` 타입으로 분리합니다.
- 이미지, 아이콘, 폰트 변경은 `asset:` 타입을 사용합니다.
- UI 화면 구성이나 스타일 변경은 `design:` 타입을 사용합니다.
- 작업 중인 코드가 실행되지 않는 상태라면 `main`에 직접 push하지 않습니다.

## Pull Request 기준

협업이 시작되면 작업 브랜치에서 Pull Request를 생성해 `main`으로 병합합니다.

Pull Request에는 다음 내용을 포함합니다.

```text
## 작업 내용

- 변경한 내용을 요약합니다.

## 확인한 내용

- 실행 또는 테스트한 내용을 적습니다.

## 참고

- 리뷰어가 알아야 할 사항을 적습니다.
```

## 기본 작업 흐름

```bash
git checkout main
git pull origin main
git checkout -b feature/example

# 작업 후
git add .
git commit -m "feat: add example feature"
git push origin feature/example
```

## 초기 설정 기록

현재 프로젝트는 다음 원격 저장소와 연결되어 있습니다.

```bash
git remote add origin https://github.com/im-siu/MyLv.git
git branch -M main
git push -u origin main
```

