/// used to set the token prefix in the authorization header
enum TokenType {
  jwt,
  access,
  refresh,
  bearer,
}

enum HttpRequestType {
  get,
  post,
  delete,
  put,
  patch,
  head,
}
