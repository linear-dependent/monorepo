export const API_URL = (import.meta as any).env?.VITE_API_URL as string | undefined
if (!API_URL) {
  // Throwing here breaks the app early in dev/prod if not set
  throw new Error("VITE_API_URL is not defined.")
}
