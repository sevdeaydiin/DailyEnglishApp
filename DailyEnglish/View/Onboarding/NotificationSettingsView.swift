import SwiftUI

struct NotificationSettingsView: View {
    @Binding var settings: NotificationSettings
    
    var body: some View {
        VStack(spacing: 24) {
            // Frequency Selector
            HStack(spacing: 20) {
                Text("How many")
                    .foregroundColor(.text)
                    .font(.system(size: 17))
                
                Button(action: { decreaseFrequency() }) {
                    Image(systemName: "minus")
                        .foregroundColor(settings.frequency <= 0 ? .gray : .text)
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                }
                .disabled(settings.frequency <= 0)
                
                Text("\(settings.frequency)x")
                    .foregroundColor(.text)
                    .font(.system(size: 17))
                    .frame(minWidth: 40)
                
                Button(action: { increaseFrequency() }) {
                    Image(systemName: "plus")
                        .foregroundColor(settings.frequency >= 20 ? .gray : .text)
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                }
                .disabled(settings.frequency >= 20)
            }
            .padding(.horizontal)
            
            if settings.shouldShowTimeSelection {
                // Time Selection
                VStack(spacing: 16) {
                    HStack {
                        Text("Start at")
                            .foregroundColor(.text)
                            .font(.system(size: 17))
                        Spacer()
                        DatePicker("", selection: $settings.startTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    if settings.shouldShowEndTime {
                        HStack {
                            Text("End at")
                                .foregroundColor(.text)
                                .font(.system(size: 17))
                            Spacer()
                            DatePicker("", selection: Binding(
                                get: { settings.endTime ?? settings.startTime },
                                set: { settings.endTime = $0 }
                            ), displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func increaseFrequency() {
        if settings.frequency < 20 {
            settings.frequency += 1
        }
    }
    
    private func decreaseFrequency() {
        if settings.frequency > 0 {
            settings.frequency -= 1
            if settings.frequency <= 1 {
                settings.endTime = nil
            }
        }
    }
} 
