//
//  DataPersistenceManager.swift
//  Vii-Music
//
//  Created by Sergio on 17.01.23.
//

import UIKit
import CoreData

final class DataPersistenceManager {

    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    // MARK: - Properties

    static let shared = DataPersistenceManager()

    // MARK: - Setups

    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()

        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }

    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>)-> Void) {

            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }

            let context = appDelegate.persistentContainer.viewContext
            context.delete(model)

            do {
                try context.save()
                completion(.success(()))
            } catch {
                completion(.failure(DatabasError.failedToDeleteData))
            }
        }
}
