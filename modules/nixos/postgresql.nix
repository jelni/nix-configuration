{ ... }:
{
  services.postgresql = {
    enable = true;
    extensions = ps: with ps; [ pgvector ];
  };
}
