import { json } from 'react-router-dom'
import { Prisma } from 'prisma-client'

export async function login({ request }: LoaderFunctionArgs) {
  try {
    await prisma.$connect(); // Verify database connection
    
    const user = await authenticateUser(request);
    if (!user) {
      return json(
        { error: "Invalid email or password" },
        { status: 401 }
      );
    }
    
    return createUserSession({
      // ... existing session creation logic
    });
  } catch (error) {
    console.error('Login Error:', error);
    
    // Specific error handling
    const message = error instanceof Prisma.PrismaClientInitializationError
      ? "Database connection failed"
      : "Login failed. Please try again later";

    return json(
      { error: message },
      { status: error instanceof Prisma.PrismaClientInitializationError ? 500 : 401 }
    );
  }
}