#!/bin/bash

echo "Setting up staging secrets for qr-inventory-staging..."

# Function to set a secret and check for errors
set_secret() {
    local key=$1
    local value=$2
    
    if fly secrets set -a qr-inventory-staging "$key=$value"; then
        echo "✅ Successfully set $key"
    else
        echo "❌ Failed to set $key"
        exit 1
    fi
}

# Database connections
set_secret "DATABASE_URL" "postgresql://postgres.sqdsduhifwfqbqqhnzyl:1234@aws-0-ap-south-1.pooler.supabase.com:6543/postgres?pgbouncer=true"
set_secret "DIRECT_URL" "postgresql://postgres.sqdsduhifwfqbqqhnzyl:1234@aws-0-ap-south-1.pooler.supabase.com:5432/postgres"

# Supabase configuration
set_secret "SUPABASE_ANON_PUBLIC" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxZHNkdWhpZndmcWJxcWhuenlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcxNTIyNTUsImV4cCI6MjA2MjcyODI1NX0.lUZc0JZdEyJGYa2QHocskamCuCvME2BFtbevPftXUvA"
set_secret "SUPABASE_SERVICE_ROLE" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxZHNkdWhpZndmcWJxcWhuenlsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzE1MjI1NSwiZXhwIjoyMDYyNzI4MjU1fQ.AL9NT3ymD6bnANRNj1tGZij80uo9DnnVDRay2mhYWQc"
set_secret "SUPABASE_URL" "https://sqdsduhifwfqbqqhnzyl.supabase.co"

# Application configuration
set_secret "SERVER_URL" "https://qrinvent-staging.fly.dev"
set_secret "SESSION_SECRET" "Sefb06q1ejNqAhKqpCZTaiLAE5ViMbCA60ZpKLrFrZcHNrcRqBFF2JKBUdZa76Mrh"
set_secret "FINGERPRINT" "Lokadk3fEAVYfVpQzjBDhgjdX2VGMVe1"

# Email configuration
set_secret "SMTP_HOST" "smtp.gmail.com"
set_secret "SMTP_PORT" "465"
set_secret "SMTP_USER" "qrinvent@gmail.com"
set_secret "SMTP_PWD" "ajbipcfvhjouodhi"
set_secret "SMTP_FROM" "Snehal <qrinvent@gmail.com>"

# API keys and other secrets
set_secret "MAPTILER_TOKEN" "it8MYnWJxJtmHWjlg6A0"
set_secret "GEOCODE_API_KEY" "68127a9d290e8956198388qlbebf414"
set_secret "INVITE_TOKEN_SECRET" "secret-test-invite-staging"
set_secret "ADMIN_EMAIL" "support@canspirit.ai"

echo "✅ All staging secrets have been set successfully!"