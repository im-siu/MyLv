# Architecture

## 기본 방향

MyLv는 SwiftUI 기반의 성장형 학습 Todo 앱입니다.

앱 구조는 `MVVM + Service + Repository`를 기준으로 구성합니다. 화면은 기능 단위로 묶고, 데이터 모델과 저장/계산 로직은 앱 전역 레이어로 분리합니다.

## 확정 폴더 구조

```text
MyLv/
├── App/
│   ├── MyLvApp.swift
│   └── RootView.swift
│
├── Features/
│   ├── CharacterSelect/
│   │   ├── Views/
│   │   │   └── CharacterSelectView.swift
│   │   └── ViewModels/
│   │       └── CharacterSelectViewModel.swift
│   │
│   ├── GoalSetup/
│   │   ├── Views/
│   │   │   └── GoalSetupView.swift
│   │   └── ViewModels/
│   │       └── GoalSetupViewModel.swift
│   │
│   ├── Home/
│   │   ├── Views/
│   │   │   └── HomeView.swift
│   │   └── ViewModels/
│   │       └── HomeViewModel.swift
│   │
│   ├── Skill/
│   │   ├── Views/
│   │   │   └── SkillView.swift
│   │   └── ViewModels/
│   │       └── SkillViewModel.swift
│   │
│   └── TodoEditor/
│       ├── Views/
│       │   └── TodoEditorView.swift
│       └── ViewModels/
│           └── TodoEditorViewModel.swift
│
├── Models/
│   ├── AppState.swift
│   ├── LearningPlan.swift
│   ├── Skill.swift
│   ├── Todo.swift
│   ├── Completion.swift
│   ├── Character.swift
│   └── CharacterGender.swift
│
├── Repositories/
│   ├── AppStateRepository.swift
│   └── LocalAppStateRepository.swift
│
├── Services/
│   ├── GrowthRuleService.swift
│   └── LearningPlanService.swift
│
└── Resources/
    └── Assets.xcassets
```

## 폴더별 역할

## App

앱 진입점과 최상위 화면 분기 로직을 둡니다.

- `MyLvApp.swift`: 앱 시작 지점
- `RootView.swift`: `AppState`에 따라 온보딩 또는 홈 화면을 선택하는 최상위 View

## Features

사용자가 실제로 보는 화면 기능을 둡니다.

각 기능 폴더는 `Views/`, `ViewModels/`로 한 번 더 구분합니다.

```text
FeatureName/
├── Views/
└── ViewModels/
```

- `Views/`: SwiftUI 화면을 담당합니다.
- `ViewModels/`: 화면에 필요한 상태와 사용자 액션을 담당합니다.

## Models

앱 전체에서 공유되는 데이터 구조를 둡니다.

현재 모델 설계 기준으로 다음 파일을 사용합니다.

- `AppState.swift`: 앱의 현재 상태를 표현합니다.
- `LearningPlan.swift`: 학습 목표, 캐릭터, 스킬, Todo 목록을 묶습니다.
- `Skill.swift`: 사용자가 관리하는 스킬 항목을 표현합니다.
- `Todo.swift`: 사용자가 수행할 작업 항목을 표현합니다.
- `Completion.swift`: Todo 완료 상태를 표현합니다.
- `Character.swift`: 선택한 캐릭터 정보를 표현합니다.
- `CharacterGender.swift`: 선택 가능한 캐릭터 성별을 표현합니다.

## Repositories

데이터 저장과 불러오기를 담당합니다.

현재 MVP는 서버 없이 로컬 저장만 사용하므로, 기능별 Repository를 만들지 않고 앱 상태 전체를 저장/복원하는 Repository를 사용합니다.

- `AppStateRepository.swift`: 앱 상태 저장소의 인터페이스
- `LocalAppStateRepository.swift`: 로컬 저장 방식의 실제 구현체

## Services

앱의 규칙과 계산 로직을 담당합니다.

- `GrowthRuleService.swift`: Todo 완료 보상 EXP, Skill Level, 전체 Level, 캐릭터 성장 단계 계산
- `LearningPlanService.swift`: Skill 생성/삭제, Todo 생성/수정/삭제, Todo 완료/취소 등 `LearningPlan` 변경 규칙

## Resources

앱에서 사용하는 이미지, 컬러, 앱 아이콘 등 리소스를 둡니다.

- `Assets.xcassets`: Xcode Asset Catalog

## 데이터 흐름

Todo 완료 흐름은 다음 순서를 기준으로 합니다.

```text
View
→ ViewModel
→ Service
→ Model 변경
→ Repository 저장
→ View 갱신
```

예시:

```text
1. 사용자가 HomeView에서 Todo 완료 버튼을 누릅니다.
2. HomeViewModel이 Todo 완료 액션을 처리합니다.
3. LearningPlanService가 Todo 완료 상태를 변경합니다.
4. GrowthRuleService가 EXP와 Level을 계산합니다.
5. AppStateRepository가 변경된 AppState를 로컬에 저장합니다.
6. HomeView가 변경된 상태를 다시 표시합니다.
```

## 현재 구조화 원칙

- `Core/` 폴더는 아직 만들지 않습니다.
- 공통 코드가 실제로 필요해지는 시점에만 새 공통 폴더를 추가합니다.
- 기능 화면은 `Features` 아래에 둡니다.
- 기능별 View와 ViewModel은 각각 `Views/`, `ViewModels/` 폴더로 구분합니다.
- 모델은 기능 폴더 안에 두지 않고 `Models/`에 모읍니다.
- Repository는 현재 MVP 기준으로 `AppStateRepository` 중심으로 구성합니다.
- Service는 저장이 아니라 앱 규칙과 계산만 담당합니다.

