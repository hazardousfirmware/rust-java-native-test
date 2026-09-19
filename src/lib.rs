use jni::objects::{JClass, JString};
use jni::sys::{jint, jstring};
use jni::JNIEnv;

// function to add numbers in java JNI syntax
#[unsafe(no_mangle)]
pub extern "system" fn Java_NativeLibrary_addNumbers(
    _env: JNIEnv,
    _class: JClass,
    a: jint,
    b: jint,
) -> jint {
    a + b
}

// function to return string in java JNI syntax
#[unsafe(no_mangle)]
pub extern "system" fn Java_NativeLibrary_getMessage(
    mut _env: JNIEnv,
    _class: JClass,
) -> jstring {
    let message = c"Hello from Rust";

    match _env.new_string(message.to_str().unwrap()) {
        Ok(java_string) => java_string.into_raw(),
        Err(_) => std::ptr::null_mut(),
    }
}
