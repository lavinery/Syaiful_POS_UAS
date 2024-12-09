<?php
return [

    /*
    |----------------------------------------------------------------------
    | Cross-Origin Resource Sharing (CORS) Configuration
    |----------------------------------------------------------------------
    |
    | Here you may configure your settings for cross-origin resource sharing
    | or "CORS". This determines what cross-origin operations may execute
    | in web browsers. You are free to adjust these settings as needed.
    |
    | To learn more: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
    |
    */

    'paths' => ['api/*', 'sanctum/csrf-cookie'], // Include your API and Sanctum CSRF path

    // Allow specific origin(s) (frontend) or use '*' for development.
    'allowed_origins' => ['http://localhost:55918'], // Update with your frontend URL

    // You can list specific HTTP methods that your application will handle.
    'allowed_methods' => ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], // Allow necessary methods

    // Allowed headers that can be sent with requests
    'allowed_headers' => ['Content-Type', 'X-Requested-With', 'Authorization', 'Accept'], // Specify needed headers

    // Enable credentials to be included with requests (e.g., for cookie-based auth with Sanctum)
    'allowed_credentials' => true,

    // Other optional configurations
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true, // Enable if you're using cookies or authentication sessions

];
