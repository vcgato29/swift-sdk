/**
 * Copyright IBM Corporation 2018
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/** TrainingExampleList. */
public struct TrainingExampleList {

    public var examples: [TrainingExample]?

    /**
     Initialize a `TrainingExampleList` with member variables.

     - parameter examples:

     - returns: An initialized `TrainingExampleList`.
    */
    public init(examples: [TrainingExample]? = nil) {
        self.examples = examples
    }
}

extension TrainingExampleList: Codable {

    private enum CodingKeys: String, CodingKey {
        case examples = "examples"
        static let allValues = [examples]
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        examples = try container.decodeIfPresent([TrainingExample].self, forKey: .examples)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(examples, forKey: .examples)
    }

}
