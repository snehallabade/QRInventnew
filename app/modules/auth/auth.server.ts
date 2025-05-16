// ... existing code ...
export async function login({ request }: LoaderFunctionArgs) {
  try {
    // authentication logic
  } catch (error) {
    console.error('Login Error:', error);
    return json(
      { error: "Login failed. Check credentials" },
      { status: 401 }
    );
  }
}