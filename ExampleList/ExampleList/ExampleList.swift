//
//  ExampleList.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI

struct ExampleList: View {
    private var list: [String] = ["FourOperations", "DivideOranges", "ThrowHundred", "SeatOne", "Average", "DivideSeconds", "HourlyRate", "OddEven", "SubSmall", "NumberOfBox", "Variousfunction", "UIPractice", "Counter", "Arrangement", "AsyncPractice", "WithTaskGroup", "Lifecycle", "Observable", "StorageView", "SortExampleOne", "SortExampleTwo", "SortExampleThree", "SortExampleFour", "SortExampleFive", "SortExampleSix", "SortExampleSeven", "ListPractice", "DivSection", "NaviFirst", "ListNavi", "NaviSplit", "NaviSplitOne", "NaviSplitTwo", "NaviSplitThree", "OutLineGroupView", "OLGSettings", "GroupPractice"]
    private let layouts : [GridItem] = [GridItem(.flexible()) ,GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("실습 예제")
                    Spacer()
                }
                .modifier(StandardCustomFontTitle())
                .padding(.horizontal, 20)
                .padding(.top, 50)

                ScrollView {
                    VStack {
                        LazyVGrid(columns: layouts, spacing: 10, pinnedViews: [.sectionHeaders]){
                            ForEach(0..<1) { _ in
                                Section(header: Header()){
                                    if self.list.isEmpty {
                                        Button(action: {}, label: {
                                            VStack {
                                                Image(systemName: "folder.fill")
                                                    .font(.system(size: 80))
                                                    .opacity(0.5)
                                                    .foregroundColor(.red)
                                                Text("폴더가 없음..")
                                                    .lineLimit(1)
                                                    .padding(.bottom, 5)
                                            }
                                        })
                                    } else {
                                        ForEach(0..<self.list.count) { i in
                                            NavigationLink(destination: selectDestination(ChangeStringToFileName(rawValue: self.list[i])!), label: {
                                                VStack {
                                                    Image(systemName: "folder.fill")
                                                        .font(.system(size: 80))
                                                        .opacity(0.5)
                                                        .foregroundColor(.blue)
                                                    Text(self.list[i])
                                                        .lineLimit(1)
                                                        .padding(.bottom, 5)
                                                }
                                            })
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .modifier(StandardCustomFontText())
                    .background(.white)
                }
            }
        }
    }
}


//MARK: LazyVGridView
//LazyVGridHeader
struct Header: View {
    var body: some View {
        VStack {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: 3)
                .padding(1)
                .background(.gray)
                .border(.gray, width: 1)
                .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
        .background(.white)
    }
}

enum ChangeStringToFileName: String {
    case FourBasicOperations = "FourOperations"
    case DivideOranges = "DivideOranges"
    case ThrowHundred = "ThrowHundred"
    case SeatOne = "SeatOne"
    case Average = "Average"
    case DivideSeconds = "DivideSeconds"
    case HourlyRate = "HourlyRate"
    case OddEven = "OddEven"
    case SubSmall = "SubSmall"
    case NumberOfBox = "NumberOfBox"
    case Variousfunction = "Variousfunction"
    case UIPractice = "UIPractice"
    case Counter = "Counter"
    case Arrangement = "Arrangement"
    case AsyncPractice = "AsyncPractice"
    case WithTaskGroup = "WithTaskGroup"
    case Lifecycle = "Lifecycle"
    case Observable = "Observable"
    case StorageView = "StorageView"
    case SortExampleOne = "SortExampleOne"
    case SortExampleTwo = "SortExampleTwo"
    case SortExampleThree = "SortExampleThree"
    case SortExampleFour = "SortExampleFour"
    case SortExampleFive = "SortExampleFive"
    case SortExampleSix = "SortExampleSix"
    case SortExampleSeven = "SortExampleSeven"
    case ListPractice = "ListPractice"
    case DivSection = "DivSection"
    case NaviFirst = "NaviFirst"
    case ListNavi = "ListNavi"
    case NaviSplit = "NaviSplit"
    case NaviSplitOne = "NaviSplitOne"
    case NaviSplitTwo = "NaviSplitTwo"
    case NaviSplitThree = "NaviSplitThree"
    case OutLineGroupView = "OutLineGroupView"
    case OLGSettings = "OLGSettings"
    case GroupPractice = "GroupPractice"
}

//MARK: ExampleList View 함수
extension ExampleList {
    @ViewBuilder
    func selectDestination(_ fileName: ChangeStringToFileName) -> some View {
        switch fileName {
        case .FourBasicOperations:
            FourBasicOperations()
        case .DivideOranges:
            DivideOranges()
        case .ThrowHundred:
            ThrowHundred()
        case .SeatOne:
            SeatOne()
        case .Average:
            Average()
        case .DivideSeconds:
            DivideSeconds()
        case .HourlyRate:
            HourlyRate()
        case .OddEven:
            OddEven()
        case .SubSmall:
            SubSmall()
        case .NumberOfBox:
            NumberOfBox()
        case .Variousfunction:
            Variousfunction()
        case .UIPractice:
            UIPractice()
        case .Counter:
            Counter()
        case .Arrangement:
            Arrangement()
        case .AsyncPractice:
            AsyncPractice()
        case .WithTaskGroup:
            WithTaskGroup()
        case .Lifecycle:
            Lifecycle()
        case .Observable:
            Observable()
        case .StorageView:
            StorageView()
        case .SortExampleOne:
            SortExampleOne()
        case .SortExampleTwo:
            SortExampleTwo()
        case .SortExampleThree:
            SortExampleThree()
        case .SortExampleFour:
            SortExampleFour()
        case .SortExampleFive:
            SortExampleFive()
        case .SortExampleSix:
            SortExampleSix()
        case .SortExampleSeven:
            SortExampleSeven()
        case .ListPractice:
            ListPractice()
        case .DivSection:
            DivSection()
        case .NaviFirst:
            NaviFirst()
        case .ListNavi:
            ListNavi()
        case .NaviSplit:
            NaviSplit()
        case .NaviSplitOne:
            NaviSplitOne()
        case .NaviSplitTwo:
            NaviSplitTwo()
        case .NaviSplitThree:
            NaviSplitThree()
        case .OutLineGroupView:
            OutLineGroupView()
        case .OLGSettings:
            OLGSettings()
        case .GroupPractice:
            GroupPractice()
        }
    }
}

#Preview {
    ExampleList()
}
