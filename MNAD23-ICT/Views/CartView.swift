//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    
    // declare your properties here
    @Binding var quantityValue : Int
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if quantityValue > 0{
                    VStack(alignment: .leading){
                        Section("Purchased items"){
                            List{
                                HStack{
                                    Text("Item")
                                    Spacer()
                                    Text("Price")
                                }
                            }.listStyle(.plain)
                        }
                        Section("Payment detials"){
                            List{
                                HStack{
                                    Text("Net Amount")
                                    Spacer()
                                    Text("Amount")
                                }
                            }.listStyle(.plain)
                        }
                    }.padding()
                }
                else {
                    Text("Your cart is empty")
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("My cart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func calculatePurchasedItems(item: ShopItem) -> Double {
        
        return 0.0
    }
    
    private func calculateTotal() {
     
    }
}

#Preview {
    CartView(quantityValue: .constant(1))
}
