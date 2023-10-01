//
//  DataPersistanceManager.swift
//  StudyProj2
//
//  Created by Pratap Eknath Abhang on 19/09/23.
//

import Foundation
import UIKit
import CoreData


class DataPersistanceManager {
    
    enum DatabaseError: Error {
        case failedToSave
        case failedToFetchData
        case failedToDelete
    }
    
    
    static let shared = DataPersistanceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.id = Int64(model.id)
        item.media_type = model.media_type
        item.original_name = model.original_name
        item.original_title = model.original_title
        item.poster_path = model.poster_path
        item.overview = model.overview
        item.vote_count = Int64(model.vote_count)
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        
        do{
            try context.save()
            completion(.success(()))
        } catch {
            print(error.localizedDescription)
            completion(.failure(DatabaseError.failedToSave))
        }
    }
    
    func fetchingTitlesFromDatabase(completion: @escaping (Result<[TitleItem], Error>) -> Void){
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
            print(DatabaseError.failedToFetchData)
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(DatabaseError.failedToDelete)
            completion(.failure(DatabaseError.failedToDelete))
        }
        
    }
}
