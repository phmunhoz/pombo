require 'uri'

module Pombo
  module Webservice
    class CPP
      # Request for shipping service
      class ShippingRequest < BaseRequest

        # Convert the object to the format accepted in webservice Correios
        def to_hash
          {
            nCdEmpresa: Pombo.configurations.contract_code.to_s,
            sDsSenha: Pombo.configurations.password.to_s,
            nCdServico: @package.services.join(','),
            sCepOrigem: @package.origin_zip_code,
            sCepDestino: @package.destination_zip_code,
            nVlPeso: @package.weight,
            nCdFormato: @package.format,
            nVlComprimento: @package.length,
            nVlAltura: @package.height,
            nVlLargura: @package.width,
            nVlDiametro: @package.diameter,
            sCdMaoPropria: Pombo::Support.boolean_to_string(@package.in_hand?),
            nVlValorDeclarado: @package.declared_value,
            sCdAvisoRecebimento: Pombo::Support.boolean_to_string(@package.delivery_notice?)
          }
        end

      end
    end
  end
end
