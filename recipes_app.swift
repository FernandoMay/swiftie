import Foundation
import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var instructions: String
    var servings: Int
    var prepTime: String
    var cookTime: String
    var imageName: String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(SampleData.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    Text(recipe.name)
                }
            }
            .navigationBarTitle("Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    if let uiImage = loadImage(named: recipe.imageName) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .clipped()
                    } else {
                        Color.black
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.4)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                    
                    Text(recipe.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 10)
                }
                
                HStack {
                    Label("\(recipe.servings)", systemImage: "person.2.fill")
                    Spacer()
                    Label("\(recipe.prepTime)", systemImage: "clock")
                    Spacer()
                    Label("\(recipe.cookTime)", systemImage: "flame")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .padding(.vertical, 2)
                    }
                    
                    Text("Instructions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    Text(recipe.instructions)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                .padding()
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .navigationBarTitle(recipe.name, displayMode: .inline)
    }
    
    // Helper function to load images
    func loadImage(named: String) -> UIImage? {
        return UIImage(named: named)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: SampleData.recipes[0])
    }
}

struct SampleData {
    static let recipes = [
        Recipe(name: "Spaghetti Bolognese",
            ingredients: ["Spaghetti", "Ground Beef", "Tomato Sauce", "Onion", "Garlic"],
            instructions: "Cook the spaghetti. In a separate pan, cook the ground beef with onion and garlic. Add tomato sauce and simmer. Combine with spaghetti.",
            servings: 4,
            prepTime: "10 min",
            cookTime: "20 min",
            imageName: "spaghetti-bolognese"),
        Recipe(name: "Chicken Curry",
            ingredients: ["Chicken Breast", "Curry Powder", "Coconut Milk", "Onion", "Garlic", "Ginger"],
            instructions: "Cook the chicken breast with onion, garlic, and ginger. Add curry powder and coconut milk. Simmer until chicken is cooked through.",
            servings: 4,
            prepTime: "15 min",
            cookTime: "25 min",
            imageName: "chicken-curry"),
        Recipe(name: "Beef Stroganoff",
            ingredients: ["Beef", "Mushrooms", "Onion", "Sour Cream", "Garlic", "Paprika"],
            instructions: "Cook the beef with onion and garlic. Add mushrooms and cook until tender. Stir in sour cream and paprika. Serve over egg noodles.",
            servings: 4,
            prepTime: "10 min",
            cookTime: "30 min",
            imageName: "beef-stroganoff"),
        Recipe(name: "Vegetable Stir Fry",
            ingredients: ["Broccoli", "Carrot", "Bell Pepper", "Soy Sauce", "Garlic", "Ginger"],
            instructions: "Stir-fry vegetables with garlic and ginger. Add soy sauce and cook until vegetables are tender. Serve with rice.",
            servings: 4,
            prepTime: "10 min",
            cookTime: "15 min",
            imageName: "vegetable-stir-fry"),
        Recipe(name: "Fish Tacos",
            ingredients: ["Fish Fillets", "Tortillas", "Cabbage", "Lime", "Cilantro", "Sour Cream"],
            instructions: "Cook fish fillets and break into pieces. Assemble tacos with tortillas, fish, cabbage, lime, cilantro, and sour cream.",
            servings: 4,
            prepTime: "10 min",
            cookTime: "10 min",
            imageName: "fish-tacos"),
        Recipe(name: "Caprese Salad",
            ingredients: ["Tomatoes", "Mozzarella", "Basil", "Olive Oil", "Balsamic Vinegar", "Salt"],
            instructions: "Layer tomatoes and mozzarella. Top with basil, olive oil, balsamic vinegar, and salt.",
            servings: 2,
            prepTime: "5 min",
            cookTime: "0 min",
            imageName: "caprese-salad"),
        Recipe(name: "Pancakes",
            ingredients: ["Flour", "Milk", "Eggs", "Baking Powder", "Salt", "Butter"],
            instructions: "Mix ingredients to form batter. Cook pancakes on a griddle until golden brown.",
            servings: 4,
            prepTime: "5 min",
            cookTime: "15 min",
            imageName: "pancakes"),
        Recipe(name: "Caesar Salad",
            ingredients: ["Romaine Lettuce", "Croutons", "Parmesan Cheese", "Caesar Dressing"],
            instructions: "Toss lettuce with croutons, parmesan cheese, and Caesar dressing.",
            servings: 2,
            prepTime: "5 min",
            cookTime: "0 min",
            imageName: "caesar-salad"),
        Recipe(name: "Chicken Alfredo",
            ingredients: ["Chicken Breast", "Fettuccine", "Heavy Cream", "Parmesan Cheese", "Butter", "Garlic"],
            instructions: "Cook chicken and set aside. Prepare Alfredo sauce with heavy cream, parmesan cheese, butter, and garlic. Combine with cooked fettuccine and chicken.",
            servings: 4,
            prepTime: "10 min",
            cookTime: "20 min",
            imageName: "chicken-alfredo"),
        Recipe(name: "Tuna Salad",
            ingredients: ["Tuna", "Mayonnaise", "Celery", "Onion", "Lemon Juice", "Salt"],
            instructions: "Mix all ingredients together. Serve on bread or lettuce.",
            servings: 2,
            prepTime: "10 min",
            cookTime: "0 min",
            imageName: "tuna-salad")
    ]
}