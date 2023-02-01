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
    private var trackData = [TitleItem]()

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = { // persistent container
        let container = NSPersistentContainer(name: "MusicModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () { // context manager
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Setups

    func favoriteTitleWith(model: Tracks) {
        if hasModel(model) {
            return
        }

        let context = persistentContainer.viewContext
        let item = TitleItem(context: context)

        item.trackName = model.trackName
        item.artistName = model.artistName
        item.trackURL = model.previewUrl
        item.imageURL = model.artworkUrl100

        do {
            try context.save()
        } catch {
            print(error)
        }
    }

    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {

        let context = persistentContainer.viewContext
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

            let context = persistentContainer.viewContext
            context.delete(model)

            do {
                try context.save()
                completion(.success(()))
            } catch {
                completion(.failure(DatabasError.failedToDeleteData))
            }
        }

    func hasModel(_ trackModel: Tracks) -> Bool {
        trackData.first(where: {$0.trackURL == trackModel.previewUrl}) != nil
    }
}
