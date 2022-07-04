## Todo-List ☑

Github Repository Project의 kanban-style로 구성된 Todo-List App입니다.



### 프로젝트 기간 🗓

2022.04.04 ~ 2022.04.15



### Screenshots 👀

| Main                                                         | Add New Card                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![SS 2022-04-13 PM 05 28 34](https://user-images.githubusercontent.com/92504186/163134056-2c18b7d1-635c-4a03-8241-ce81a3975089.jpg) | ![SS 2022-04-13 PM 05 22 26](https://user-images.githubusercontent.com/92504186/163133276-39f90cb3-3dcb-436a-95e2-0e9b26f082b2.jpg) |

| Drag & Drop                                                  | Card Swiped                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![SS 2022-04-13 PM 05 22 47](https://user-images.githubusercontent.com/92504186/163133567-6a05703a-afe1-4d6a-af41-acac46cdcc69.jpg) | ![SS 2022-04-13 PM 05 23 10](https://user-images.githubusercontent.com/92504186/163133753-d72aed81-b9d8-4a6f-a937-effd144ddea6.jpg) |

| Demo                                                         |
| ------------------------------------------------------------ |
| ![SS2022-07-04PM04 41 21](https://user-images.githubusercontent.com/92504186/177106183-2f16cf72-14d1-42b9-a340-4ea946017b03.gif) |

## Touble-Shooting

1. `EditCardViewController`의 **새로운 카드 추가**에 대한 노티를 받기 위해 Observer를 등록하려는 시점에서의 문제 해결

	- 기존에는 3개의 CardListViewController의 `viewDidLoad` 메소드 내에서 새로운 카드 추가의 노티에 대한 Observer를 등록했는데, 

		이로 인해 하나의 CardListViewController에서 새로운 카드를 추가하려고 하더라도, 세 CardListViewController 모두에 카드가 추가되는 문제가 발생했습니다.

	- 이를 해결하기 위해, Observer 등록 시점에 대한 고민을 했고, `add(+)` 버튼이 터치됐을 때 등장할 modal을 저장해놓는 프로퍼티인 `editViewModal` 프로퍼티가 `add(+)` 버튼을 누를 때 마다 변경되도록 하고, 해당 프로퍼티의 `didSet` 구문을 이용해 변경되는 시점에 Observer를 등록하도록 했습니다.

		(`editViewModal` 프로퍼티는, Observer를 등록할 때에 해당 CardListViewController에서 사용할 EditViewController에게만 Observer를 등록하고자 사용했습니다.)

	- 위의 방법대로 수정하니, 원하는 CardListViewController에만 카드가 추가되도록 문제를 해결할 수 있었습니다.