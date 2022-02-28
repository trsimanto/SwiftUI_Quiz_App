import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home ()
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
var oldAng : Double = 0.0
     var newAng : Double = 0.0

struct Home : View {
    var width = UIScreen.main.bounds.width
    var hight = UIScreen.main.bounds.height
    var data = [
    DataModel(name: "Quran", content: "0/100", image: "book" ),
    DataModel(name: "Hadis", content: "0/80", image: "book.closed"),
    DataModel(name: "Zihad", content: "0/90", image: "flame" ),
    DataModel(name: "Sahaba", content: "0/70", image: "person.3.sequence"),
    DataModel(name: "History", content: "0/30", image: "note" ),
    DataModel(name: "Iman", content: "0/50", image: "sparkles"),
    ]
 
    
    @State var ang : Double = 0.0
    
    
    var body: some View {
        ZStack{
            Color("color1")
            //            Text("QUIZ")
            //                .fontWeight(.black)
            //                .font(.custom("QUIZ", fixedSize: 50.0))
            Circle()
                .foregroundColor(Color("color2"))
                .gesture(
                DragGesture()
                    .onChanged { gesture in
                       // self.ang = 20
                        let dx = 0 - gesture.translation.width
                        let dy = 0 - gesture.translation.height
                        self.ang = atan2(dy, dx)
                        newAng = atan2(dy, dx)
                        oldAng = newAng
                        
                        print("a \(self.ang)")
                    }
                    .onEnded { _ in
                        
                    }
            )
            
            VStack(spacing: 20){
                HStack(spacing: 0){
                    CircleComponent(datamodel: self.data[0])
                        .rotationEffect(.radians(-self.ang))
                    CircleComponent(datamodel: self.data[1])
                        .rotationEffect(.radians(-self.ang))
                        .offset( y: -(width/3)/2 )
                    CircleComponent(datamodel: self.data[2])
                        .rotationEffect(.radians(-self.ang))
                }
                
                HStack(spacing: 0){
                    CircleComponent(datamodel: self.data[3])
                        .rotationEffect(.radians(-self.ang))
                    CircleComponent(datamodel: self.data[4])
                        .rotationEffect(.radians(-self.ang))
                        .offset( y: (width/3)/2 )
                    CircleComponent(datamodel: self.data[5])
                        .rotationEffect(.radians(-self.ang))
                }
                
            }
            .rotationEffect(.radians(self.ang))
            
            VStack{
                Spacer()
                HStack{
                    VStack{
                        Image(systemName: "house")
                            .renderingMode(.original)
                        Text("Home")
                    }.frame(width: 60, height: 60).background(Color.purple).clipShape(RoundedRectangle(cornerSize: CGSize.init()))
                }.background(Color("color4"))
            }
            
        }.ignoresSafeArea()
    }
   
}
struct CircleComponent : View{
    var width = UIScreen.main.bounds.width
    var hight = UIScreen.main.bounds.height
    var datamodel : DataModel
    
    var body: some View{
        ZStack{
            VStack( spacing: 2 ){
                Text(datamodel.name).font(.title3).fontWeight(.semibold)
                Text(datamodel.content).font(.body)
                Image(systemName: datamodel.image).font(.title3)
                
            }
            
        }
        .frame(width: (width/3 - 20), height: (width/3 - 20))
        .background(Color("color3"))
        .clipShape(Circle())
        .overlay(Circle().stroke(Color("color4"),lineWidth: 3))
    }
   }
struct DataModel{
    var name : String
    var content : String
    var image : String
}


