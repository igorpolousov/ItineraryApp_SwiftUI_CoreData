//
//  TODO.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 08.02.2023.
//



/*
 MARK: TO_DO
 
- picker issue: doesn't pick value

 */


/*
 MARK: Remarks
 - @Enviroment работает только для child view
 - Image.clipped - обрезает только видмую часть картинки при этом сохраняет оригинальный размер картинки, что при использовании в верхнем слое ZStack, может сделать недоступным нижние view, потому что картинка будет накрывать их
 - List view works only with @Published objects to automatically update data
 - Absence of cool features that presented in UIKit. To use features of UIKit need to create separate view with coordinator class
 - Picker doesn't work with optional values. safe unwrap values before use in Picker
 */


/*
 MARK: Crutches(Костыли)
 - For online updating data in List view was created @Published property in TripsData. Property is a copy of static property.
 */
