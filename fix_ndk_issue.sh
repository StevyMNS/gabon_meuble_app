#!/bin/bash

# Chemin vers le SDK Android (à adapter si nécessaire)
ANDROID_SDK="$HOME/Android/Sdk"
NDK_VERSION="27.0.12077973"
GRADLE_FILE="./android/build.gradle.kts"

echo "📦 Installation du NDK $NDK_VERSION..."
yes | "$ANDROID_SDK/cmdline-tools/latest/bin/sdkmanager" --install "ndk;$NDK_VERSION"

echo "🛠️ Mise à jour du fichier build.gradle.kts..."
# Vérifie si ndkVersion est déjà présent
if grep -q "ndkVersion" "$GRADLE_FILE"; then
    # Modifier la ligne existante
    sed -i "s/ndkVersion = \".*\"/ndkVersion = \"$NDK_VERSION\"/" "$GRADLE_FILE"
else
    # Ajouter la ligne dans le bloc android
    sed -i "/android[ \t]*{/a \    ndkVersion = \"$NDK_VERSION\"" "$GRADLE_FILE"
fi

echo "🧹 Nettoyage du projet..."
flutter clean

echo "📦 Récupération des packages..."
flutter pub get

echo "🚀 Lancement de l’application..."
flutter run
