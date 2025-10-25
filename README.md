# Portfolio Flutter Web

A Flutter web application showcasing Javid Akeel's development skills and projects.

## 🚀 Live Demo

This project is deployed on GitHub Pages. Once you follow the setup instructions below, your portfolio will be available at:
`https://yourusername.github.io/portfolio_flutter/`

## 📋 GitHub Pages Setup Instructions

### 1. Enable GitHub Pages
1. Go to your repository on GitHub
2. Click on **Settings** tab
3. Scroll down to **Pages** section in the left sidebar
4. Under **Source**, select **GitHub Actions**
5. Save the settings

### 2. Push Your Code
1. Commit and push all the changes to your main branch:
   ```bash
   git add .
   git commit -m "Setup GitHub Pages deployment"
   git push origin main
   ```

### 3. Monitor Deployment
1. Go to the **Actions** tab in your GitHub repository
2. You should see a workflow run called "Deploy Flutter Web to GitHub Pages"
3. Wait for it to complete (usually takes 2-3 minutes)
4. Once completed, your site will be available at `https://yourusername.github.io/portfolio_flutter/`

### 4. Custom Domain (Optional)
If you have a custom domain, you can:
1. Add a `CNAME` file to the root of your repository with your domain name
2. Update the workflow file `.github/workflows/deploy.yml` and uncomment the `cname` line
3. Configure your domain's DNS settings to point to GitHub Pages

## 🛠️ Local Development

### Prerequisites
- Flutter SDK (3.24.0 or later)
- Dart SDK

### Running Locally
```bash
# Install dependencies
flutter pub get

# Run in development mode
flutter run -d web-server --web-port 8080

# Build for production
flutter build web --release --base-href="/portfolio_flutter/"
```

### Testing the Build
```bash
# Build the web app
flutter build web --release --base-href="/portfolio_flutter/"

# Serve locally to test
cd build/web
python -m http.server 8000
# or
npx serve .
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
└── src/
    ├── models/              # Data models
    ├── screens/             # App screens
    │   └── home_screen.dart
    ├── styles/              # App styling
    ├── utils/               # Utility functions
    └── widgets/             # Reusable widgets

web/
├── index.html               # Web entry point
├── manifest.json            # PWA manifest
└── icons/                   # App icons

.github/
└── workflows/
    └── deploy.yml           # GitHub Actions deployment workflow
```

## 🔧 Configuration

### Base URL
The app is configured to work with GitHub Pages subdirectory structure. The base href is set to `/portfolio_flutter/` in the deployment workflow.

### Flutter Version
The GitHub Actions workflow uses Flutter 3.24.0 (Dart 3.5). Ensure your local environment is compatible. You can update this in `.github/workflows/deploy.yml` if needed.

## 📝 Notes

- The deployment workflow automatically triggers on every push to the main branch
- The build process includes tree-shaking to optimize bundle size
- Font assets are automatically optimized during build
- The app includes PWA capabilities with proper manifest and icons

## 🐛 Troubleshooting

### Build Failures
- Check that all dependencies are properly declared in `pubspec.yaml`
- Ensure Flutter SDK version compatibility
- Review GitHub Actions logs for specific error messages
- If the main workflow fails, try the alternative workflow by renaming `.github/workflows/deploy-alternative.yml` to `.github/workflows/deploy.yml`

### Deployment Issues
- Verify GitHub Pages is enabled in repository settings
- Check that the workflow has proper permissions
- Ensure the `GITHUB_TOKEN` has necessary permissions
- Make sure you're using the correct repository name in the base-href (should match your repository name)

### Common GitHub Actions Issues
1. **Permission Errors**: Make sure GitHub Pages is enabled in repository settings
2. **Build Failures**: Check Flutter version compatibility
3. **Deployment Failures**: Verify the workflow has write permissions to the repository

### Local Development Issues
- Run `flutter doctor` to check Flutter installation
- Clear Flutter cache: `flutter clean && flutter pub get`
- Check web browser console for runtime errors
- Test the build command: `flutter build web --release --base-href="/portfolio_flutter/"`

## 📄 License

This project is open source and available under the [MIT License](LICENSE).