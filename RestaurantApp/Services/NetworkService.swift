//Ashley Herbert 2019C capstone

import Foundation
import Moya

//client id for making the api key with yelp just in case: 6tzMREZhq54Yg3i00txJHg
private let apiKey = "lvH40TxhMVMSEY0K1E3h0ytb_P6o72ZosE0TLn4KM5etH0mzkx8E1dA0z2B0zvCttO1GKiA3YbWgIzBfjdw3LUG-n_1twZkWimuhh1uhctb0eb37PATxFARQbCPPXXYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }

        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
            }
        }

        var method: Moya.Method {
            return .get
        }

        var sampleData: Data {
            return Data()
        }

        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
            
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
