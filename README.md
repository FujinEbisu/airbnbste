Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
# airbnbste

## 🚀 Getting Started

### Prerequisites
- Ruby 3.3.5
- Rails 7.1.5+
- PostgreSQL
- Node.js (for asset compilation)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd airbnbste
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup environment variables**
   Create a `.env` file in the root directory:
   ```env
   CLOUDINARY_URL=your_cloudinary_url
   MAPBOX_API_KEY=your_mapbox_api_key
   API_NINJAS_KEY=your_api_ninjas_key
   ```

4. **Database setup**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the server**
   ```bash
   rails server
   ```

Visit `http://localhost:3000` to access the application.

## 📋 API Keys Required

### Cloudinary
1. Sign up at [Cloudinary](https://cloudinary.com/)
2. Get your `CLOUDINARY_URL` from the dashboard
3. Add to your `.env` file

### Mapbox
1. Create account at [Mapbox](https://www.mapbox.com/)
2. Generate an access token
3. Add as `MAPBOX_API_KEY` in `.env`

### API Ninjas (for hobby seeding)
1. Register at [API Ninjas](https://api.api-ninjas.com/)
2. Get your API key
3. Add as `API_NINJAS_KEY` in `.env`

## 💾 Database Schema

### Core Models
- **User** - Authentication and profile data
- **FriendProfile** - Friend listings with rates and details
- **Booking** - Rental transactions between users
- **Hobbie/Interrest** - Interest/hobby categorization system

### Key Relationships
```ruby
User
├── has_many :friend_profiles
└── has_many :bookings

FriendProfile
├── belongs_to :user
├── has_many :bookings
├── has_many :hobbies (through :interrests)
└── geocoded_by :address
```

## 🎮 Usage

### For Friend Providers
1. **Sign up** and create your account
2. **Create a Friend Profile** with your photo and details
3. **Set your daily rate** and location
4. **Select your hobbies** and interests
5. **Manage bookings** through your dashboard

### For Friend Seekers
1. **Browse profiles** on the home page
2. **Use the map** to find friends nearby
3. **View detailed profiles** and check availability
4. **Book dates** that work for you
5. **Track your bookings** in your dashboard

## 🗂️ Project Structure

app/
├── controllers/ # Application logic
├── models/ # Data models and relationships
├── views/ # ERB templates
├── javascript/ # Stimulus controllers
└── assets/ # Stylesheets and images
config/
├── routes.rb # URL routing
├── database.yml # Database configuration
└── initializers/ # App configuration
db/
├── migrate/ # Database migrations
└── seeds.rb # Sample data