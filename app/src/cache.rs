//! Explicit "clear cache" action from Settings.
//!
//! Only disposable data is removed: cached addon HTTP responses and the image
//! cache. Settings, library, credentials, addons, downloads and the running
//! streaming server are never touched.

/// Clears the HTTP response cache and the in-memory/on-disk poster cache.
pub async fn clear_application_cache() -> Result<(), String> {
    let mut errors = Vec::new();

    if let Err(error) = core_env::clear_http_cache().await {
        errors.push(format!("HTTP cache: {error}"));
    }
    if let Err(error) = crate::image_cache::clear_all().await {
        errors.push(format!("image cache: {error}"));
    }

    let _ = crate::db::insert_log("INFO", "Application cache cleared by user.").await;

    if errors.is_empty() {
        Ok(())
    } else {
        Err(errors.join("; "))
    }
}
