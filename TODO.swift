//
//  TODO.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//



/*
 MARK: TO_DO
 
 - how to remove alert in "ViewTransitionExtension"?
 - сдeлать возможность изменять размер картинки в Image Picker? " Is it possible in SwiftUI?
 - how to refactor static funcs in "TripFunctions" to make its accesseble from @Enviroment
 - how to customize delete and edit functions in List(https://stackoverflow.com/questions/57112426/swiftui-custom-swipe-actions-in-list)
 
 
 */


/*
 MARK: Remarks
 - @Enviroment работает только для child view
 - Image.clipped - обрезает только видмую часть картинки при этом сохраняет оригинальный размер картинки, что при использовании в верхнем слое ZStack, может сделать недоступным нижние view, потому что картинка будет накрывать их
 - List view works only with @Published objects to automatically update data
 */


/*
 MARK: Crutches(Костыли)
 - For online updating data in List view was created @Published property in TripsData. Property is a copy of static property.
 */
