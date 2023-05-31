plugins {
  id("kotlin-android")
  id("com.android.library")
  id("org.jetbrains.dokka")
  id("com.vanniktech.maven.publish.base")
}

android {
  compileSdk = 33
  buildToolsVersion = "30.0.3"

  defaultConfig {
    minSdk = 24

    buildConfigField("String", "VERSION_CODE", "\"${project.property("VERSION_CODE")}\"")
    buildConfigField("String", "VERSION_NAME", "\"${project.property("VERSION_NAME")}\"")

    testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    consumerProguardFiles("consumer-rules.pro")
  }

  buildTypes {
    getByName("release") {
      isMinifyEnabled = false
      proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    }
  }
  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
  }

  kotlinOptions {
    jvmTarget = "11"
  }
}

dependencies {
  testImplementation("junit:junit:4.13.2")
  androidTestImplementation("androidx.test.ext:junit:1.1.5")
  androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
  androidTestImplementation("com.google.truth:truth:1.1.3")

  api(project(":jvm"))
}

configure<com.vanniktech.maven.publish.MavenPublishBaseExtension> {
  configure(
    com.vanniktech.maven.publish.AndroidSingleVariantLibrary()
  )
}
