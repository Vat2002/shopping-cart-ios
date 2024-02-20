//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct ContentView: View {
    
    // declare your properties here
    @State var showCartView = false
    @State var quantityValue : Int = 0
    @AppStorage("PreviousDeal") var previousDeal : Double = 0.00
    @State var priceItem : Double = 0.00
    @State var dealValue : Double = 0.00
    @State var item : String = ""
    
    @State private var value = 0
        let colors: [Color] = [.orange, .red, .gray, .blue,
                               .green, .purple, .pink]
    
        let step = 1
        let range = 1...50
    
    @State var shopItems = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0,image:"Broccoli"),
        ShopItem(name: "Banana", price: 8.00, quantity: 0,image:"Banana"),
        ShopItem(name: "Avocado", price: 10.00, quantity: 0,image:"Avocado"),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0,image: "Chicken"),
        ShopItem(name: "Water", price: 2.00, quantity: 0,image: "Water"),
        // complete remaining data
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                HStack{
                    Text("Buy Fresh Grocery")
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                }
                VStack{
                    List(content: {
                        ForEach(shopItems.indices,id:\.self){ index in
                            HStack{
                                Image(shopItems[index].image)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .scaledToFit()
                                    .ignoresSafeArea()
                                
                                VStack(alignment: .leading){
                                    Text(shopItems[index].name)
                                    Text("$\(String(shopItems[index].price))")
                                }
                                
                                Spacer()
                                HStack{
                                    Stepper {} onIncrement: {
                                               increaseQuantity()
                                            } onDecrement: {
                                                decreaseQuantity()
                                            }
                                }.foregroundColor(.gray)
                                
                                Text("\(quantityValue)")
                                
                            }
                            .padding()
                        }
                    }).listStyle(.plain)
                }
                Spacer()
                
                Button(action: {
                    showCartView = true
                }, label: {
                    Text("Checkout")
                }).buttonStyle(.bordered)
                    .tint(Color.green)
                
                Text("Your previous deal with us was \(String(format: "%.2f", dealValue))")
            }
            .padding()
            .navigationDestination(isPresented: $showCartView) {
                CartView(quantityValue: $quantityValue)
            }
            .onAppear{
                dealValue = previousDeal
            }
        }
    }
    
    func increaseQuantity(){
       quantityValue = quantityValue + 1
        print(quantityValue)
    }
    
    func decreaseQuantity(){
        quantityValue = quantityValue - 1
    }
    
}

#Preview {
    ContentView()
}
