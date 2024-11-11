import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var instructions: [String]
    var servings: Int
    var prepTime: String
    var cookTime: String
    var imageName: String
}

struct RecipeListView: View {
    let recipes: [Recipe] = [
        // Add your sample recipes here
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            Image(recipe.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            Text(recipe.name)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)

                Text("Ingredients:")
                    .font(.headline)
                    .padding(.bottom)

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• \(ingredient)")
                        .padding(.bottom, 5)
                }

                Text("Instructions:")
                    .font(.headline)
                    .padding(.bottom)

                ForEach(recipe.instructions, id: \.self) { instruction in
                    Text("\(instruction)")
                        .padding(.bottom, 5)
                }

                HStack {
                    Text("Servings: \(recipe.servings)")
                    Spacer()
                    Text("Prep Time: \(recipe.prepTime)")
                    Spacer()
                    Text("Cook Time: \(recipe.cookTime)")
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}