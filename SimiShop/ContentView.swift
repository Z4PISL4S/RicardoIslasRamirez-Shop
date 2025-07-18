//
//  RicardoIslasExtraMacOSApp.swift
//  RicardoIslasExtraMacOS
//
//  Created by Zap Islas on 16/07/25.
//

import SwiftUI
import SwiftData // Aunque SwiftData no se usa en este fragmento, se mantiene si es parte de tu proyecto.

@main
struct ExtraordinarioApp: App {
    var body: some Scene {
        WindowGroup {
            // La aplicación inicia con DashboardView
            DashboardView()
        }
    }
}

// MARK: - DashboardView

struct DashboardView: View {
    var body: some View {
        // Usamos NavigationSplitView para la barra lateral y contenido principal.
        NavigationSplitView {
            // Sidebar (Barra Lateral)
            SidebarView()
                .frame(minWidth: 200) // Ajusta el ancho mínimo de la barra lateral
        } detail: {
            // Contenido principal del Dashboard
            DashboardContentView()
        }
        .frame(minWidth: 900, minHeight: 600) // Tamaño mínimo para la ventana de la aplicación
    }
}

// MARK: - SidebarView

struct SidebarView: View {
    // Estado para controlar la selección de la barra lateral
    @State private var selectedTab: String? = "Dashboard"

    var body: some View {
        VStack(alignment: .leading) {
            // Logo "Sími Shop"
            HStack {
                Image(systemName: "s.circle.fill") // Placeholder for Sími Shop logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Un verde oscuro
                Text("Sími Shop")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2))
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            List {
                // Sección de navegación principal
                // Botón Dashboard con estilo de la imagen
                NavigationLink(destination: DashboardContentView(), tag: "Dashboard", selection: $selectedTab) {
                    Label("Dashboard", systemImage: "house.fill")
                        .font(.headline)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(selectedTab == "Dashboard" ? Color.green.opacity(0.8) : Color.clear)
                        // Cambiado el color del texto a verde oscuro cuando no está seleccionado
                        .foregroundColor(selectedTab == "Dashboard" ? .white : Color(red: 0.1, green: 0.6, blue: 0.2))
                        .cornerRadius(8)
                }
                .listRowBackground(Color.clear) // Asegura que el fondo de la fila sea transparente
                
                NavigationLink(destination: Text("Categories View"), tag: "Categories", selection: $selectedTab) {
                    Label("Categories", systemImage: "square.grid.2x2.fill")
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
                NavigationLink(destination: Text("Favorites View"), tag: "Favorites", selection: $selectedTab) {
                    Label("Favourite", systemImage: "heart.fill") // Cambiado a "Favourite" según la imagen
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
                NavigationLink(destination: Text("Orders View"), tag: "Orders", selection: $selectedTab) {
                    Label("Orders", systemImage: "bag.fill")
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
                NavigationLink(destination: Text("Messages View"), tag: "Messages", selection: $selectedTab) {
                    Label("Messages", systemImage: "message.fill")
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
                NavigationLink(destination: Text("Top Deals View"), tag: "Top Deals", selection: $selectedTab) {
                    Label("Top Deals", systemImage: "star.fill")
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
                
                Spacer() // Empuja los elementos de abajo hacia el final de la lista
                
                // Sección de configuración
                NavigationLink(destination: Text("Settings View"), tag: "Settings", selection: $selectedTab) {
                    Label("Settings", systemImage: "gearshape.fill")
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.2)) // Color verde oscuro
                }
            }
            .listStyle(.sidebar) // Estilo específico para barras laterales
            .navigationTitle("") // Oculta el título de navegación por defecto de la lista
        }
        // Color de fondo de la barra lateral, si es necesario
        .background(Color.white)
    }
}

// MARK: - DashboardContentView (Contenido principal del Dashboard)

struct DashboardContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Barra de búsqueda y elementos de la parte superior
                HStack {
                    SearchBar()
                    Spacer()
                    // Íconos de acciones adicionales en la esquina superior derecha
                    Button(action: {}) {
                        Image(systemName: "calendar") // Icono de calendario
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Button(action: {}) {
                        Image(systemName: "message.badge") // Icono de mensajes
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Button(action: {}) {
                        Image(systemName: "bell.badge") // Icono de notificaciones
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Button(action: {}) {
                        Image(systemName: "person.circle.fill") // Icono de usuario
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10) // Espacio superior para la barra de búsqueda
                // Fondo para la barra superior, haciéndola más "grande" visualmente
                .background(Color.white.opacity(0.9)) // Fondo blanco semitransparente
                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1) // Sombra sutil
                .padding(.bottom, 10) // Espacio debajo de la barra superior

                // Categories
                VStack(alignment: .leading) {
                    HStack {
                        Text("Categories")
                            .font(.headline)
                            .foregroundColor(.black) // Color de texto negro
                        Spacer()
                        // Botón de filtro y flechas para Categories
                        Button(action: {}) {
                            Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                                .font(.subheadline)
                                .foregroundColor(Color.green.opacity(0.8))
                        }
                        Button(action: {}) {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.title3)
                                .foregroundColor(Color.green.opacity(0.8))
                        }
                        Button(action: {}) {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title3)
                                .foregroundColor(Color.green.opacity(0.8))
                        }
                    }
                    .padding(.horizontal)
                    CategoryScrollView()
                }

                // Popular Products
                VStack(alignment: .leading) {
                    HStack {
                        Text("Popular Products")
                            .font(.headline)
                            .foregroundColor(.black) // Color de texto negro
                        Spacer()
                        Button("View More") {
                            // Acción para ver más productos
                        }
                        .font(.subheadline)
                        .foregroundColor(Color.black) // Verde más oscuro
                    }
                    .padding(.horizontal)

                    // Usamos LazyVGrid para hacer los cards responsivos en su línea si el ancho lo permite
                    // Aunque la imagen sugiere ScrollView horizontal, esto permite un layout más flexible
                    // Si se desea un scroll horizontal estricto, se mantendría el ScrollView con HStack como antes.
                    // Para 5 cards responsivos en una línea, se puede usar un GridItem flexible.
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 5), spacing: 15) {
                        ForEach(popularProducts) { product in
                            ProductCard(product: product)
                        }
                    }
                    .padding(.horizontal)
                }

                // Contenedor para Discount Shop y Last Order
                HStack(alignment: .top, spacing: 20) { // Alineación superior y espaciado
                    // Discount Shop
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Discount Shop")
                                .font(.headline)
                                .foregroundColor(.black) // Color de texto negro
                            Spacer()
                            Button("View More") {
                                // Acción para ver más descuentos
                            }
                            .font(.subheadline)
                            .foregroundColor(Color.black) // Verde más oscuro
                        }
                        .padding(.horizontal)
                        DiscountShopView()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Ocupa el espacio disponible

                    // Last Order
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Last Order")
                                .font(.headline)
                                .foregroundColor(.black) // Color de texto negro
                            Spacer()
                            Button("View More") { // Añadido botón "View More" para Last Order
                                // Acción para ver más pedidos
                            }
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                        }
                        .padding(.horizontal)
                        LastOrderView() // Nueva vista para los últimos pedidos
                    }
                    .frame(width: 300, alignment: .leading) // Ancho fijo para la sección de últimos pedidos
                }
                .padding(.horizontal) // Padding para el HStack que contiene ambas secciones
                .padding(.bottom) // Añadir padding al final del ScrollView

                Spacer() // Empuja el contenido hacia arriba
            }
        }
        // Fondo general del dashboard, un gris muy claro
        .background(Color(red: 0.96, green: 0.96, blue: 0.98))
        .navigationTitle("") // Oculta el título de navegación por defecto del detalle
    }
}


// MARK: - SearchBar

struct SearchBar: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search your grocery products...", text: $searchText)
                .textFieldStyle(.plain) // Estilo simple para macOS
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(8)
        .frame(maxWidth: 300) // Limita el ancho de la barra de búsqueda
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1) // Sombra sutil
    }
}

// MARK: - CategoryScrollView

struct CategoryScrollView: View {
    let categories: [Category] = [
        Category(name: "Fruits", imageName: "1"),
        Category(name: "Bread", imageName: "2"),
        Category(name: "Vegetable", imageName: "3"),
        Category(name: "Fish", imageName: "4"),
        Category(name: "Meat", imageName: "5"),
        Category(name: "Drinks", imageName: "6"),
        Category(name: "Sea Food", imageName: "7"),
        Category(name: "Ice Cream", imageName: "8"),
        Category(name: "Juice", imageName: "9"),
        Category(name: "Jam", imageName: "10")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories) { category in
                    CategoryButton(category: category)
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - CategoryButton

struct CategoryButton: View {
    var category: Category
    
    // Función para obtener un color aleatorio o predefinido para el fondo del icono
    private func iconBackgroundColor() -> Color {
        // En la imagen, los colores de fondo de los iconos de categoría son variados.
        // Aquí se puede usar un array de colores o generar aleatoriamente.
        let colors: [Color] = [
            Color.red.opacity(0.1),
            Color.orange.opacity(0.1),
            Color.blue.opacity(0.1),
            Color.purple.opacity(0.1),
            Color.yellow.opacity(0.1),
            Color.pink.opacity(0.1),
            Color.cyan.opacity(0.1)
        ]
        return colors.randomElement() ?? Color.green.opacity(0.1)
    }
    
    var body: some View {
        VStack {
            // Usar Image para cargar desde Assets locales
            Image(category.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(10)
                .background(iconBackgroundColor()) // Fondo de color aleatorio
                .cornerRadius(25) // Para hacerlo circular
            
            Text(category.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .frame(width: 70) // Ancho fijo para cada botón de categoría
    }
}

// MARK: - ProductCard

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) { // Para el icono de corazón
                // Usar Image para cargar desde Assets locales
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 100) // Ajustar tamaño de la imagen
                    .clipped() // Recortar si la imagen es más grande
                    .cornerRadius(10)
                
                // Icono de corazón
                Button(action: {
                    print("Toggle favorite for \(product.name)")
                }) {
                    Image(systemName: "heart.fill")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.red.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(5) // Padding para separar del borde de la imagen
            }
            
            Text(product.name)
                .font(.headline)
                .lineLimit(1) // Evita que el texto se corte si es muy largo
            
            // Precio y botón "+"
            HStack {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    // Acción para añadir producto al carrito
                    print("Añadir \(product.name) al carrito")
                }) {
                    Image(systemName: "plus") // Usar SF Symbol para el "+"
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .clipShape(Circle()) // Hacer el botón circular
                }
            }
        }
        .frame(width: 160) // Ancho fijo para la tarjeta
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - DiscountShopView

struct DiscountShopView: View {
    let discounts: [Discount] = [
        Discount(percentage: "35% Discount", description: "Order any food from app and get the discount", imageName: "16"),
        Discount(percentage: "20% Discount", description: "Order any food from app and get the discount", imageName: "17"),
        Discount(percentage: "20% Discount", description: "Order any food from app and get the discount", imageName: "18"),
        Discount(percentage: "10% Discount", description: "Order any food from app and get the discount", imageName: "19")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(discounts) { discount in
                    DiscountCard(discount: discount)
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - DiscountCard

struct DiscountCard: View {
    let discount: Discount
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(discount.percentage)
                .font(.headline)
                .foregroundColor(.white)
            Text(discount.description)
                .font(.caption2)
                .foregroundColor(.white)
                .lineLimit(2)
            
            Spacer() // Empuja el botón hacia abajo
            
            Button("Shop Now") {
                // Acción para navegar a la tienda de descuentos
                print("Ir a la tienda de descuentos")
            }
            .font(.caption)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color.white) // Botón blanco sobre fondo de descuento
            .cornerRadius(5)
            .foregroundColor(Color.green.opacity(0.8)) // Texto verde más oscuro
        }
        .padding(10)
        .frame(width: 150, height: 120) // Ajustar tamaño de la tarjeta de descuento
        .background(
            // Usar Image para cargar desde Assets locales como fondo
            Image(discount.imageName)
                .resizable()
                .scaledToFill()
                .clipped()
                .overlay(Color.green.opacity(0.7)) // Superposición verde para el texto
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// MARK: - LastOrderView

struct LastOrderView: View {
    let lastOrders: [Order] = [
        Order(productName: "Red Saffron", price: 150.00, quantity: "500 gm", imageName: "20"),
        Order(productName: "Fresh Apple", price: 120.00, quantity: "2 kg", imageName: "15"),
        Order(productName: "Big Fish", price: 300.00, quantity: "6 kg", imageName: "21")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(lastOrders) { order in
                HStack {
                    // Usar Image para cargar desde Assets locales
                    Image(order.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                    
                    VStack(alignment: .leading) {
                        Text(order.productName)
                            .font(.subheadline)
                            .fontWeight(.medium)
                        HStack { // Para el texto de cantidad y el icono
                            Text(order.quantity)
                                .font(.caption)
                                .foregroundColor(.gray)
                            // Aquí se podría añadir un icono "x1" o "x6" si se maneja la cantidad de ítems
                            // Por ahora, solo se muestra la cantidad en texto.
                        }
                    }
                    Spacer()
                    Text("$\(order.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
            }
        }
        .padding(.horizontal)
    }
}


// MARK: - Modelos de Datos (Structs)
// Se cambió 'imageUrl' a 'imageName' en todas las structs

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String // Ahora es el nombre del asset local
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String // Ahora es el nombre del asset local
}

struct Discount: Identifiable {
    let id = UUID()
    let percentage: String
    let description: String
    let imageName: String // Ahora es el nombre del asset local
}

struct Order: Identifiable {
    let id = UUID()
    let productName: String
    let price: Double
    let quantity: String
    let imageName: String // Ahora es el nombre del asset local
}

let popularProducts = [
    Product(name: "Strawberry", price: 20.10, imageName: "11"),
    Product(name: "Cabbage", price: 15.10, imageName: "12"),
    Product(name: "Broccoli", price: 25.10, imageName: "13"),
    Product(name: "Orange", price: 12.10, imageName: "14"),
    Product(name: "Fresh Apple", price: 18.10, imageName: "15")
]


// MARK: - DashboardView_Previews

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        // Asegúrate de que el preview sea de DashboardView
        DashboardView()
            .frame(minWidth: 800, minHeight: 600) // Tamaño adecuado para macOS preview
    }
}
