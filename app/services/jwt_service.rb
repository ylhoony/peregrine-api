class JwtService

  def self.encode(payload:)
    JWT.encode payload, ENV["DEVISE_JWT_SECRET"], "HS256", { typ: 'JWT' }
  end

  def self.decode(token:)
    JWT.decode token, ENV["DEVISE_JWT_SECRET"], true, { algorithm: 'HS256' }
  end

  def self.generate_payload(resource)
    {
      sub: resource.id.to_str,
      iat: Time.now.to_i,
      exp: Time.now.to_i + 24 * 60 * 60,
    }
  end
end
