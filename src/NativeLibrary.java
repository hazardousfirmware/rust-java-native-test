public final class NativeLibrary {
    // load the native shared library
    static {
        System.loadLibrary("mylibrary");
    }

    private NativeLibrary() {}

    // pre-declare the fucntions in the shared library
    public static native int addNumbers(int a, int b);

    public static native String getMessage();

    public static void main(String[] args) {

        int first = Integer.parseInt(args[0]);
        int second = Integer.parseInt(args[1]);

        int result = addNumbers(first, second);

        System.out.println(result);

        String msg = getMessage();

        System.out.println(msg);
    }
}
