import Foundation

struct NotificationSettings {
    var frequency: Int = 10 // Varsayılan değer
    var startTime: Date
    var endTime: Date?
    
    init() {
        // Varsayılan başlangıç saati 09:00
        let calendar = Calendar.current
        var components = DateComponents()
        components.hour = 9
        components.minute = 0
        self.startTime = calendar.date(from: components) ?? Date()
        
        // Varsayılan bitiş saati 22:00
        components.hour = 22
        components.minute = 0
        self.endTime = calendar.date(from: components)
    }
    
    var shouldShowEndTime: Bool {
        return frequency > 1
    }
    
    var shouldShowTimeSelection: Bool {
        return frequency > 0
    }
    
    /// Tarihi veritabanına uygun formatta döndürür
    func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Örnek format: 09:00
        return dateFormatter.string(from: date)
    }
    
    /// Veritabanına gönderilecek başlangıç zamanı
    var startTimeString: String {
        return formattedDate(startTime)
    }
    
    /// Veritabanına gönderilecek bitiş zamanı
    var endTimeString: String {
        return formattedDate(endTime)
    }
}
