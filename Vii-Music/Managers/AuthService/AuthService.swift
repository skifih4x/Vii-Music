//
//  AuthService.swift
//  Vii-Music
//
//  Created by Sergio on 12.01.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {

    public static let shared = AuthService()
    private init() {}

    /// A method to register the user
    /// - Parameters:
    ///   - userRequest: the users information
    ///   - completion: A completion with two values...
    ///   - Bool: wasRegistered - Determines if the users was registered and saved in the database correctly
    ///   - Error?: An optional error if firebase provides once
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let userName = userRequest.userName
        let email = userRequest.email
        let password = userRequest.password

        Auth.auth().createUser(withEmail: email, password: password) { result,
            error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, error)
                return
            }

            let db = Firestore.firestore()

            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "userName": userName,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }

    public func singIn(with userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(
            withEmail: userRequest.email,
            password: userRequest.password
        ) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }

    public func singOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }

    public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }

    public func fetchUser(completion: @escaping (User?, Error?) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()

        db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }

                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let userName = snapshotData["userName"] as? String,
                   let email = snapshotData["email"] as? String {
                    let user = User(userName: userName, email: email, userUID: userUID)
                    completion(user, nil)
                }

            }
    }
}
