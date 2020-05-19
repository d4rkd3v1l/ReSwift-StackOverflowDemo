import ReSwift

// MARK: - Global

let store = Store<AppState>(reducer: appReducer, state: nil, middleware: [middleware1(),
                                                                          middleware2(),
                                                                          middleware3(),
                                                                          middleware4(),
                                                                          middleware5()])

struct AppState: StateType {
    var subState1: SubState1
    var subState2: SubState2
}

func appReducer(_ action: Action, _ state: AppState?) -> AppState {
    return AppState(
        subState1: reducer1(action: action, state: state?.subState1),
        subState2: reducer2(action: action, state: state?.subState2)
    )
}

// MARK: - States

struct SubState1 {
    var data: Data
}

struct SubState2 {}

// MARK: - Actions

struct Action1: Action {}

struct Action2: Action {}

struct Action3: Action {}

struct Action4: Action {}

// MARK: - Reducers

func reducer1(action: Action, state: SubState1?) -> SubState1 {
    return SubState1(data: Data())
}

func reducer2(action: Action, state: SubState2?) -> SubState2 {
    return SubState2()
}

// MARK: - Middlewares

func middleware1() -> Middleware<AppState> {
    return { dispatch, getState in
        return { next in
            return { action in
                print("\(type(of: action)) \(MemoryLayout.size(ofValue: getState()))")

                switch action {
                case is ReSwiftInit:
                    dispatch(Action1())

                default:
                    break
                }

                next(action)
            }
        }
    }
}

func middleware2() -> Middleware<AppState> {
    return { dispatch, getState in
        return { next in
            return { action in
                switch action {
                case is ReSwiftInit:
                    dispatch(Action3())

                default:
                    break
                }

                next(action)
            }
        }
    }
}

func middleware3() -> Middleware<AppState> {
    return { dispatch, getState in
        return { next in
            return { action in
                switch action {
                case _ as Action3:
                    dispatch(Action4())

                default:
                    break
                }

                next(action)
            }
        }
    }
}

func middleware4() -> Middleware<AppState> {
    return { dispatch, getState in
        return { next in
            return { action in
                next(action)
            }
        }
    }
}

func middleware5() -> Middleware<AppState> {
    return { dispatch, getState in
        return { next in
            return { action in
                switch action {
                case _ as Action1:
                    dispatch(Action2())

                default:
                    break
                }

                next(action)
            }
        }
    }
}

// MARK: - Dummy data

struct Data {
    var dummyData = Dummy()
}

struct Dummy {
    var subDummy1 = SubDummy()
    var subDummy2 = SubDummy()
    var subDummy3 = SubDummy()
    var subDummy4 = SubDummy()
    var subDummy5 = SubDummy()
    var subDummy6 = SubDummy()
    var subDummy7 = SubDummy()
    var subDummy8 = SubDummy()
    var subDummy9 = SubDummy()
    var subDummy10 = SubDummy()
}

struct SubDummy {
    var subSubDummy1 = SubSubDummy()
    var subSubDummy2 = SubSubDummy()
    var subSubDummy3 = SubSubDummy()
    var subSubDummy4 = SubSubDummy()
    var subSubDummy5 = SubSubDummy()
    var subSubDummy6 = SubSubDummy()
    var subSubDummy7 = SubSubDummy()
    var subSubDummy8 = SubSubDummy()
    var subSubDummy9 = SubSubDummy()
    var subSubDummy10 = SubSubDummy()
}

struct SubSubDummy {
    var subSubSubDummy1 = SubSubSubDummy()
    var subSubSubDummy2 = SubSubSubDummy()
    var subSubSubDummy3 = SubSubSubDummy()
    var subSubSubDummy4 = SubSubSubDummy()
    var subSubSubDummy5 = SubSubSubDummy()
    var subSubSubDummy6 = SubSubSubDummy()
    var subSubSubDummy7 = SubSubSubDummy()
    var subSubSubDummy8 = SubSubSubDummy()
    var subSubSubDummy9 = SubSubSubDummy()
    var subSubSubDummy10 = SubSubSubDummy()
}

struct SubSubSubDummy {
    var property1: Int = 1337
    var property2: Int = 1337
    var property3: Int = 1337
    var property4: Int = 1337
    var property5: Int = 1337
//    var property6: Int = 1337
//    var property7: Int = 1337
//    var property8: Int = 1337
//    var property9: Int = 1337
//    var property10: Int = 1337
}
