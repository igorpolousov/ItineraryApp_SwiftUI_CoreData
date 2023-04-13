#  SwiftUI + CoreData

  ##Плюсы использования SwiftUI: 
  Это абсолютно другой фреймворк, при работе с которым, после UIKit не обнаружилось моментальных каких-то плюшек или ускорения работы.
  
   ##Минусы:
  - Реализация многих вещей отличается от UIKit и поэтому нужно изучать с SwiftUI с нуля!
  - Из-за особенностей struct добавлено некороет количество модификаторов("properties wrappers) которые дополняют совйства типов данных и которые нужно знать дополнительно.
  - Есть вещи, которые нужно писать в пределах одной struct, из-за которого размер кода превращается в ту же проблему, что и Massive View Controller  
  
  - Большое количество особеннойстей, которые надо знать! Ниже особенности, которые удалось найти. 
  
 - @Enviroment работает только для child view
 - Image.clipped - обрезает только видмую часть картинки при этом сохраняет оригинальный размер картинки, что при использовании в верхнем слое ZStack, может сделать недоступным нижние view, потому что картинка будет накрывать их
 - List view works only with @Published objects to automatically update data
 - Absence of cool features that presented in UIKit. To use features of UIKit need to create separate view with coordinator class
 - Picker doesn't work with optional values. safe unwrap values before use in Picker
 - There is no inbox implementation in List to move row between sections, drag and drop also. Only between views. if needed sections Use another type of view instead of Section()
  

