import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result: [Int] = [] // 정답 배열
    var termsDict: [String: Int] = [:] // 딕셔너리
    var today: [Int] = today.components(separatedBy: ".").map { Int($0)! } // 오늘 날짜 배열
    
    for str in terms { // 딕셔너리를 담기 위한 반복문
        let arr = str.components(separatedBy: " ")
        termsDict[arr[0]] = Int(arr[1])!
    }
    
    for (index, privacy) in privacies.enumerated() { // 약관 비교 반복문
        let arr = privacy.components(separatedBy: " ")
        let key = arr[1]
        var date = arr[0].components(separatedBy: ".").map { Int($0)! }
        
        date[1] += termsDict[key]!
        if date[1] > 12 {
            var year = date[1] / 12
            year = date[1] % 12 == 0 ? year - 1 : year
            date[0] += year
            date[1] = date[1] % 12 == 0 ? 12 : date[1] % 12          
        }

        if today[0] >= date[0] {
            if today[0] > date[0] {
                result.append(index + 1)
            } else if today[1] >= date[1] {
                if today[1] > date[1] {
                    result.append(index + 1)
                } else if today[2] >= date[2] {
                    result.append(index + 1)
                }
            }
        }
    }

    return result
}