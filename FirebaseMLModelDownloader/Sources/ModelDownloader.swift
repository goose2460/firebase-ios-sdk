// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/// Possible errors with  model downloading.
public enum DownloadError : Error {
  case deadlineExceeded // request time out
  case notFound // no model with this name found on server
  case permissionDenied // caller does not have permissions for this operation
  case unavailable // service unavailable
  case resourceExhausted // server limit reached
  case failedPrecondition // conditions not met to perform download
  case notEnoughSpace // not enough space on device
  case unauthenticated // request does not have valid credentials
  case unimplemented // unsupported operation
  case invalidArgument // malformed model name or path
  case canceled // operation was canceled
  case aborted // operation was aborted, ex: connection dropped
  case dataLoss // unrecoverable data loss or corruption
  case outOfRange // operation past valid input/output range
  case internalError // generic errors

}

/// Possible errors with locating model on device.
public enum DownloadedModelError : Error {
  case fileIOError // file system error
  case notFound // model not found on device
}

/// Possible ways to get a custom model.
public enum ModelDownloadType {
  case localModel
  case localModelUpdateInBackground
  case latestModel
}

/// Downloader to manage custom model downloads.
public struct ModelDownloader {

  /// Downloads a custom model to device or gets a custom model already on device, w/ optional handler for progress.
  public func getModel(name modelName: String, downloadType: ModelDownloadType,
                       conditions: ModelDownloadConditions,
                       progressHandler: ((Float) -> Void)? = nil,
                       completion: @escaping (Result<CustomModel, DownloadError>) -> Void) {
    // TODO: Model download
    let modelSize = Int()
    let modelPath = String()
    let modelHash = String()

    let customModel = CustomModel(name: modelName, size: modelSize, path: modelPath, hash: modelHash)
    completion(.success(customModel))
    completion(.failure(.notFound))
  }

  /// Gets all downloaded models.
  public func listDownloadedModels(completion: @escaping (Result<Set<CustomModel>, DownloadedModelError>) -> Void) {
    let customModels = Set<CustomModel>()
    // TODO: List downloaded models
    completion(.success(customModels))
    completion(.failure(.notFound))
  }

  /// Deletes a custom model from device.
  public func deleteDownloadedModel(name modelName: String,
                                    completion: @escaping (Result<Void, DownloadedModelError>) -> Void) {
    // TODO: Delete previously downloaded model
    completion(.success(()))
    completion(.failure(.notFound))
  }
}